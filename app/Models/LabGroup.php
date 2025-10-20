<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LabGroup extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description'
    ];

    public function labTests()
    {
        return $this->hasMany(LabTest::class, 'groupId');
    }
}
