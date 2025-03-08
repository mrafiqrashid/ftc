<?php

namespace App\Models;

use Backpack\CRUD\app\Models\Traits\CrudTrait;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Concerns\HasUuids;
use Illuminate\Support\Str;

class Member extends Model
{
    use HasFactory, HasUuids, CrudTrait;

    protected $table = 'members';

    protected $primaryKey = 'memberID';

    public $incrementing = false;
    protected $keyType = 'string';

    protected $fillable = [
        'memberID',
        'name',
        'dateJoin',
        'telM',
        'email',
        'birthDate',
        'parentID',
    ];





    /*
    |--------------------------------------------------------------------------
    | FUNCTIONS
    |--------------------------------------------------------------------------
    */

    protected static function boot()
    {
        parent::boot();

        static::creating(function ($member) {
            if (!$member->id) {
                $member->id = Str::uuid(); // Generate UUID
            }
        });
    }


    /*
    |--------------------------------------------------------------------------
    | RELATIONS
    |--------------------------------------------------------------------------
    */
    public function parent()
    {
        return $this->belongsTo(Member::class, 'parentID', 'memberID');
    }

    public function purchases()
    {
        return $this->hasMany(Purchase::class, 'memberID', 'memberID');
    }

    public function children()
    {
        return $this->hasMany(Member::class, 'parentID', 'memberID');
    }

    public function referredMember()
    {
        return $this->belongsTo(Member::class, 'parentID', 'memberID');
    }

    // Relationship: A member may be referred by multiple other members
    public function referringMembers()
    {
        return $this->hasMany(Member::class, 'parentID', 'memberID');
    }

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
    public function getMemberidNameAttribute()
    {
        return "{$this->memberID} - {$this->name}";
    }
}
