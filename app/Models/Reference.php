<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reference extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'designation',
        'email',
        'phone',
        'status',
    ];

    public function patient()
    {
        return $this->hasMany(AdmissionPatient::class, 'refer_id');
    }

    public function ticket()
    {
        return $this->hasMany(TicketSale::class, 'refer_id');
    }
}
