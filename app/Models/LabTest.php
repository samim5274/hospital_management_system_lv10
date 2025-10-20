<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LabTest extends Model
{
    use HasFactory;

    protected $fillable = [
        'testName',
        'categoryId',
        'subcategoryId',
        'specimenId',
        'groupId',
        'testPrice',
        'rprice',
        'room',
        'testDescription',
        'status',
    ];

    public function category()
    {
        return $this->belongsTo(LabCategory::class, 'categoryId');
    }

    public function subcategory()
    {
        return $this->belongsTo(LabSubcategory::class, 'subcategoryId');
    }

    public function specimen()
    {
        return $this->belongsTo(LabSpecimen::class, 'specimenId');
    }

    public function group()
    {
        return $this->belongsTo(LabGroup::class, 'groupId');
    }

    public function storeTests()
    {
        return $this->hasMany(StoreTest::class, 'testId');
    }

    public function test()
    {
        return $this->hasMany(TestReportDetail::class, 'test_id');
    }
}
