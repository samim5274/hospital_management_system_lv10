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

        'address1',
        'address2',

        'dob',
        'gender',
        'blood_group',

        'religion',
        'nationality',
        'national_id',
        'contact_number',

        'father_name',
        'father_profession',
        'father_contact',
        'father_email',
        'father_nid',

        'mother_name',
        'mother_profession',
        'mother_contact',
        'mother_email',
        'mother_nid',

        'guardian_name',
        'guardian_contact',
        'guardian_email',
        'guardian_nid',
        'guardian_relationship',

        'photo',
        'father_photo',
        'mother_photo', 
        
        'status',
        'remark',

        'otp',
        'otp_expires_at',

        'email_verified_at',
        'last_login_at',
        'last_login_ip',
        'remember_token',
    ];

    protected $hidden = [
        'password',
        'remember_token',
        'otp',
    ];

    protected $casts = [
        'email_verified_at' => 'datetime',
        'last_login_at'     => 'datetime',
        'otp_expires_at'    => 'datetime',
        'dob'               => 'date',
        'status'            => 'boolean',
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

    public function income()
    {
        return $this->hasMany(Income::class, 'user_id');
    }

    public function transection()
    {
        return $this->hasMany(BankTransectionDetail::class, 'user_id');
    }

    public function ticket()
    {
        return $this->hasMany(TicketSale::class, 'user_id');
    }
}
