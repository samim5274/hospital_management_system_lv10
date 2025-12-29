<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class Admin extends Authenticatable
{
    use HasApiTokens, Notifiable, HasFactory;

    protected $table = 'admins';

    protected $fillable = [
        'name',
        'email',
        'password',
        'role', // admin, superadmin, staff
        'otp',
        'otp_expires_at',
        'email_verified_at',
        'last_login_at',
        'last_login_ip',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    public function storeTest() 
    { 
        return $this->hasMany(StoreTest::class, 'userId'); 
    }

    public function patient()
    {
        return $this->hasMany(AdmissionPatient::class, 'user_id');
    }

    public function bill()
    {
        return $this->hasMany(AdmissionBillSummary::class);
    }

    public function expenses()
    {
        return $this->hasMany(ExpensesDetails::class, 'user_id', 'id');
    }
}
