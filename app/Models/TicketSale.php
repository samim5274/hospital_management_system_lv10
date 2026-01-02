<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TicketSale extends Model
{
    use HasFactory;

    protected $table = 'ticket_sales';

    protected $fillable = [
        'reg',
        'date',
        'name',
        'dob',
        'gender',
        'phone',
        'address',
        'doctor_id',
        'refer_id',
        'total',
        'discount',
        'payable',
        'pay',
        'duestatus',
        'due',
        'return',
        'status',
        'user_id',
    ];

    public function doctor()
    {
        return $this->belongsTo(Doctor::class, 'doctor_id');
    }

    public function reference()
    {
        return $this->belongsTo(Reference::class, 'refer_id');
    }

    public function user()
    {
        return $this->belongsTo(Admin::class, 'user_id');
    }
}
