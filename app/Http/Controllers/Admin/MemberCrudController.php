<?php

namespace App\Http\Controllers\Admin;

use App\Http\Requests\MemberRequest;
use App\Models\Member;
use Backpack\CRUD\app\Http\Controllers\CrudController;
use Backpack\CRUD\app\Library\CrudPanel\CrudPanelFacade as CRUD;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

/**
 * Class MemberCrudController
 *
 * @property-read \Backpack\CRUD\app\Library\CrudPanel\CrudPanel $crud
 */
class MemberCrudController extends CrudController
{
    use \Backpack\CRUD\app\Http\Controllers\Operations\CreateOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\DeleteOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ListOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\ShowOperation;
    use \Backpack\CRUD\app\Http\Controllers\Operations\UpdateOperation;

    /**
     * Configure the CrudPanel object. Apply settings to all operations.
     *
     * @return void
     */
    public function setup()
    {
        CRUD::setModel(\App\Models\Member::class);
        CRUD::setRoute(config('backpack.base.route_prefix') . '/member');
        CRUD::setEntityNameStrings('member', 'members');
    }

    /**
     * Define what happens when the List operation is loaded.
     *
     * @see  https://backpackforlaravel.com/docs/crud-operation-list-entries
     *
     * @return void
     */
    protected function setupListOperation()
    {
        CRUD::setFromDb(); // set columns from db columns.
        CRUD::removeColumn('parentID');

        CRUD::addColumn([
            'name' => 'parentID',
            'label' => 'Referred By',
            'type' => 'select',
            'entity' => 'parent', // Relationship method in model
            'attribute' => 'memberid_name', // Display name instead of ID
            'model' => "App\Models\Member",
            // 'wrapper' => ['class' => 'form-group col-md-4']
        ]);


        /**
         * Columns can be defined using the fluent syntax:
         * - CRUD::column('price')->type('number');
         */
    }

    /**
     * Define what happens when the Create operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-create
     *
     * @return void
     */
    protected function setupCreateOperation()
    {
        CRUD::setValidation(MemberRequest::class);
        CRUD::addField([
            'name' => 'memberID',
            'type' => 'text',
        ]);
        CRUD::setFromDb(); // set columns from db columns.
        foreach (CRUD::fields() as $fieldName => $field) {
            CRUD::modifyField($fieldName, [
                'wrapper' => ['class' => 'form-group col-md-4']
            ]);
        }



        CRUD::addField(
            [
                'name' => 'parentID',
                'label' => 'Referred By',
                'type' => 'select',
                'entity' => 'parent', // Relationship method in model
                'attribute' => 'memberid_name', // Display name instead of ID
                'model' => "App\Models\Member",
                'options' => (function ($query) {
                    return $query->orderBy('memberID', 'ASC')->get();
                }),
                'wrapper' => [
                    'class' => 'form-group col-md-4' // Bootstrap column class
                ],
            ]
        );

        /**
         * Fields can be defined using the fluent syntax:
         * - CRUD::field('price')->type('number');
         */
    }

    /**
     * Define what happens when the Update operation is loaded.
     *
     * @see https://backpackforlaravel.com/docs/crud-operation-update
     *
     * @return void
     */
    protected function setupUpdateOperation()
    {
        $this->setupCreateOperation();
    }

    protected function familyTreeChart(Request $request)
    {
        $member = $this->getData();
        Log::info($member->toArray());
        // Log::info(Member::all()->toArray());

        $familyTree = $this->buildTree($member);
        // Log::info($familyTree);

        return view('admin.member.familyTreeChart', compact('familyTree'));
    }
    private function buildTree($members, $parentID = null)
    {
        $tree = [];

        foreach ($members as $member) {
            if ($member->parentID == $parentID) {
                $children = $this->buildTree($members, $member->memberID);
                if ($children) {
                    $member->children = $children;
                }
                $tree[] = $member;
            }
        }




        return $tree;
    }

    private function getData()
    {
        $personalAmount = DB::table('purchases')
            ->select('memberid', DB::raw('SUM(amount) as personal_amount'))
            ->groupBy('memberid');

        $referralAmount = DB::table('members as m')
            ->join('purchases as p', 'm.memberid', '=', 'p.memberid')
            ->select('m.parentID as memberid', DB::raw('SUM(p.amount) as referral_amount'))
            ->groupBy('m.parentID');

        $results = DB::table('members as m')
            ->leftJoinSub($personalAmount, 'pa', function ($join) {
                $join->on('m.memberid', '=', 'pa.memberid');
            })
            ->leftJoinSub($referralAmount, 'ra', function ($join) {
                $join->on('m.memberid', '=', 'ra.memberid');
            })
            ->select(
                'm.memberid as memberID',
                'm.name',
                'm.dateJoin',
                'm.telM',
                'm.parentID',
                DB::raw('COALESCE(pa.personal_amount, 0) AS Total_Personal_Purchase'),
                DB::raw('COALESCE(ra.referral_amount, 0) AS Total_Referral_Member_Purchase'),
                DB::raw('(COALESCE(pa.personal_amount, 0) + COALESCE(ra.referral_amount, 0)) AS Total_Group_Purchase')
            )
            ->orderBy('m.memberid')
            ->orderBy('m.name')
            ->orderBy('m.dateJoin')
            ->orderBy('m.telM')
            ->get();

        return $results;
    }
}
