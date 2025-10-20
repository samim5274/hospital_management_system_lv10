<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class Admin extends Authenticatable
{
    use HasApiTokens, Notifiable, HasFactory;

    protected $table = 'admins';

    protected $fillable = [
        'name',
        'email',
        'password',
        'role', // admin, superadmin, staff
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function patient()
    {
        return $this->hasMany(AdmissionPatient::class, 'user_id');
    }

    public function bill()
    {
        return $this->hasMany(AdmissionBillSummary::class);
    }
}
