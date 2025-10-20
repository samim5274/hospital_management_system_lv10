<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdmissionBillSummary extends Model
{
    use HasFactory;

    protected $fillable = [
        'patient_id',
        'general_bed',
        'cabin_fee',
        'doctor_fee',
        'service_charge',
        'ot_medicine',
        'oral_medicine',
        'others',
        'contract_amount',
        'total_cost',
        'discount',
        'advance_paid',
        'payable_amount',
        'paid_amount',
        'remaining_due',
        'reg',
        'billing_date',
        'user_id',
        'remarks',
    ];

    // Relations
    public function patient()
    {
        return $this->belongsTo(AdmissionPatient::class);
    }

    public function user()
    {
        return $this->belongsTo(Admin::class);
    }
}
