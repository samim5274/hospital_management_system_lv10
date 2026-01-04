<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('admins', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->string('email')->unique();
            $table->string('password');
            $table->string('role')->default('staff'); // superadmin, admin, manager, staff

            $table->text('address1')->nullable();
            $table->text('address2')->nullable();

            $table->date('dob')->nullable();
            $table->string('gender')->nullable();
            $table->string('blood_group')->nullable();
            $table->string('religion')->nullable();
            $table->string('nationality')->nullable();
            $table->string('national_id')->nullable();
            $table->string('contact_number', 20)->nullable();

            $table->string('father_name')->nullable();
            $table->string('father_profession')->nullable();
            $table->string('father_contact', 20)->nullable();
            $table->string('father_email')->nullable();
            $table->string('father_nid')->nullable();

            $table->string('mother_name')->nullable();
            $table->string('mother_profession')->nullable();
            $table->string('mother_contact', 20)->nullable();
            $table->string('mother_email')->nullable();
            $table->string('mother_nid')->nullable();

            $table->string('guardian_name')->nullable();
            $table->string('guardian_contact', 20)->nullable();
            $table->string('guardian_email')->nullable();
            $table->string('guardian_nid')->nullable();
            $table->string('guardian_relationship')->nullable();

            $table->string('photo')->nullable();
            $table->string('father_photo')->nullable();
            $table->string('mother_photo')->nullable();

            $table->integer('status')->default(1);
            $table->string('remark')->nullable();

            $table->string('otp')->nullable();
            $table->timestamp('otp_expires_at')->nullable();

            $table->timestamp('email_verified_at')->nullable();
            $table->timestamp('last_login_at')->nullable();
            $table->string('last_login_ip')->nullable();
            $table->rememberToken();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admins');
    }
};
