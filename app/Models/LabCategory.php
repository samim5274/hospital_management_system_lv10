<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LabCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'catName',
        'description',
    ];

    public function subcategories()
    {
        return $this->hasMany(LabSubcategory::class, 'categoryId');
    }

    public function labTests()
    {
        return $this->hasMany(LabTest::class, 'categoryId');
    }
}
