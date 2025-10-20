<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class StoreTest extends Model
{
    use HasFactory;

    protected $fillable = [
        'regNum',
        'testId',
        'testprice',
        'referprice',
        'categoryId',
        'subcategoryId',
        'specimenId',
        'groupId',
        'room',
        'status',
        'reportstatus',
    ];

    public function test() 
    { 
        return $this->belongsTo(LabTest::class, 'testId'); 
    }

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
}
