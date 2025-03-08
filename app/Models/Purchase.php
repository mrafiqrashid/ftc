<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;

class Purchase extends Model
{
    use CrudTrait,  HasFactory, HasUuids;

    protected $table = 'purchases'; // Explicitly define table name (optional)

    protected $primaryKey = 'id'; // Set primary key

    public $incrementing = false; // UUID is not auto-incrementing
    protected $keyType = 'string'; // UUID is a string

    protected $fillable = [
        'billNo',
        'memberID',
        'salesDate',
        'amount',
    ];

    /**
     * Relationship: A Purchase belongs to a Member.
     */
    public function member()
    {
        return $this->belongsTo(Member::class, 'memberID', 'memberID');
    }


    /*
    |--------------------------------------------------------------------------
    | FUNCTIONS
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | SCOPES
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | ACCESSORS
    |--------------------------------------------------------------------------
    */

    /*
    |--------------------------------------------------------------------------
    | MUTATORS
    |--------------------------------------------------------------------------
    */
}
