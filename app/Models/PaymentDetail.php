<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PaymentDetail extends Model
{
    use HasFactory;

    // Fillable fields
    protected $fillable = [
        'reg',
        'date',
        'name',
        'dob',
        'gender',
        'phone',
        'address',
        'doctorId',
        'referId',
        'referStatus',
        'total',
        'discount',
        'payable',
        'pay',
        'duestatus',
        'due',
        'return',
        'status',
        'userId',
    ];

    // Relations
    public function doctor()
    {
        return $this->belongsTo(Doctor::class, 'doctorId');
    }

    public function reference()
    {
        return $this->belongsTo(Reference::class, 'referId');
    }

    public function user()
    {
        return $this->belongsTo(Admin::class, 'userId');
    }
}
