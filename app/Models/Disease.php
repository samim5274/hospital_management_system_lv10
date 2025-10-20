<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Disease extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
    ];

    public function patient()
    {
        return $this->hasMany(AdmissionPatient::class, 'disease_id');
    }
}
