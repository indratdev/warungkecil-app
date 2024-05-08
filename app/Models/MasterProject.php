<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterProject extends Model
{
    use HasFactory;

    protected $table = 'm_project';


    protected $fillable = [
        'owner_id',
        'name',
        'branch_name',
        'address',
        'province',
        'city',
        'zipcode',
        'npwp',
        'phone',
        'active',
        'deleted',
    ];
}
