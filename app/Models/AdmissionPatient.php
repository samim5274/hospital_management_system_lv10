<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AdmissionPatient extends Model
{
    use HasFactory;

    protected $fillable = [
        'reg',
        'name',
        'dob',
        'gender',
        'mobile',
        'father_husband',
        'guardian',
        'address',
        'religion',
        'nid',
        'contract_type',
        'contract_amount',
        'procedure_type',
        'medicine_package',
        'refer_id',
        'treatment_under_id',
        'duty_doctor_id',
        'disease_id',
        'duty_nurse',
        'bed_booked_date',
        'bed_id',
        'bed_cost',
        'user_id',
        'status',
        'remarks',
    ];

    // Relation to Refer (e.g., Referring Person)
    public function refer()
    {
        return $this->belongsTo(Reference::class, 'refer_id');
    }

    // Relation to Doctor (Treatment Under)
    public function treatmentUnder()
    {
        return $this->belongsTo(Doctor::class, 'treatment_under_id');
    }

    // Relation to Duty Doctor
    public function dutyDoctor()
    {
        return $this->belongsTo(DutyDoctor::class, 'duty_doctor_id');
    }

    // Relation to Disease
    public function disease()
    {
        return $this->belongsTo(Disease::class, 'disease_id');
    }

    // Relation to Bed
    public function bed()
    {
        return $this->belongsTo(Bed::class, 'bed_id');
    }

    // Relation to User (who admitted the patient)
    public function user()
    {
        return $this->belongsTo(Admin::class, 'user_id');
    }

    public function patientBill()
    {
        return $this->hasMany(AdmissionBillSummary::class);
    }
}
