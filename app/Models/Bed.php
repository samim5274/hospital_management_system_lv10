<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Bed extends Model
{
    use HasFactory;

    protected $fillable = [
        'bed_number',
        'ward',
        'status',
        'price_per_day',
    ];

    public function patient()
    {
        return $this->hasMany(AdmissionPatient::class, 'bed_id');
    }
}
