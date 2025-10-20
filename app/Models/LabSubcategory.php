<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LabSubcategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'catId',
        'subCatName',
        'description'
    ];

    public function category()
    {
        return $this->belongsTo(LabCategory::class, 'catId');
    }

    public function labTests()
    {
        return $this->hasMany(LabTest::class, 'subcategoryId');
    }
}
