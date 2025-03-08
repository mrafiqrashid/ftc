@extends(backpack_view('blank'))
@section('header')
    <section class="header-operation container-fluid animated fadeIn d-flex mt-3 mb-5 align-items-baseline d-print-none" bp-section="page-header">
        <h1 class="text-capitalize mb-0" bp-section="page-heading">Family Tree Chart</h1>
        <p class="ms-2 ml-2 mb-0" id="datatable_info_stack" bp-section="page-subheading">View</p>
    </section>
@endsection
@section('content')
<div class="container-fluid mt-5">
    <div class="row justify-content-center">
        <div class="col-lg-12 col-md-12">
            <div class="info mb-2">
                <p>Name (Date Join of the member, Personal Sales and Group Sales)</p>
            </div>

            <div class="card">
                <div class="card-body">
                    
                   <div class="tree">
                          {!! generateTreeHTML($familyTree) !!}
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
@php
function generateTreeHTML($tree, $isLastNode = false)
{
    $html = '<ul>';
    $count = count($tree);
    $i = 0;

    foreach ($tree as $member) {
        $isLast = (++$i == $count) ? 'last-node' : '';

        $html .= '<li class="'.$isLast.'"><a href="#">' . $member->name . ' (' . $member->dateJoin . ', ' . $member->Total_Personal_Purchase . ', ' . $member->Total_Referral_Member_Purchase . ')'.  '</a>';
        if (!empty($member->children)) {
            $html .= generateTreeHTML($member->children);
        }
        $html .= '</li>';
    }

    $html .= '</ul>';
    return $html;
}
@endphp



