<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientTestReport extends Model
{
    use HasFactory;

    protected $fillable = [
        'reg',
        'patient_id',
        'test_id',
        'part_of_test',
        'result',
        'unit',
        'reference_value',
        'ref_value_of_hormone',
        'remarks',
    ];

    public function patient()
    {
        return $this->belongsTo(PaymentDetail::class);
    }

    public function test()
    {
        return $this->belongsTo(TestReportDetail::class);
    }
}
