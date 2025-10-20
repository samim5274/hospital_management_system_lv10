<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Doctor extends Model
{
    use HasFactory;

    protected $fillable = ['name','specialization','phone','email'];

    public function patient()
    {
        return $this->hasMany(AdmissionPatient::class, 'treatment_under_id');
    }
}
