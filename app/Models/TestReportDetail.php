<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TestReportDetail extends Model
{
    use HasFactory;

    protected $fillable = [
        'test_id',
        'part_of_test',
        'result',
        'unit',
        'reference_value',
        'ref_value_of_hormone'
    ];

    // Relationships
    public function test()
    {
        return $this->belongsTo(LabTest::class, 'test_id');
    }

    // Accessor for formatted display
    public function getFormattedResultAttribute()
    {
        return $this->result 
            ? "{$this->result} {$this->unit}" 
            : 'Pending';
    }
}
