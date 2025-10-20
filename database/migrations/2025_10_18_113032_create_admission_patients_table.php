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
        Schema::create('admission_patients', function (Blueprint $table) {
            $table->id();
            $table->string('reg')->nullable();
            // Patient Information
            $table->string('name');
            $table->date('dob');
            $table->string('gender');
            $table->string('mobile');
            $table->string('father_husband')->nullable();
            $table->string('guardian');
            $table->text('address');
            $table->string('religion')->nullable();
            $table->string('nid')->nullable();

            // Contract and Medical Info
            $table->enum('contract_type', ['Contract', 'NonContract'])->default('Contract');
            $table->decimal('contract_amount', 10, 2)->default(0);
            $table->enum('procedure_type', ['Operative', 'Conservative'])->default('Operative');
            $table->enum('medicine_package', ['Package', 'NonPackage'])->default('Package');

            // Treatment & Assignment
            $table->foreignId('refer_id')->nullable()->constrained('references')->onDelete('restrict');
            $table->foreignId('treatment_under_id')->nullable()->constrained('doctors')->onDelete('restrict');
            $table->foreignId('duty_doctor_id')->nullable()->constrained('duty_doctors')->onDelete('restrict');
            $table->foreignId('disease_id')->nullable()->constrained('diseases')->onDelete('restrict');
            $table->string('duty_nurse')->nullable();

            // Bed Booking
            $table->date('bed_booked_date')->nullable();
            $table->foreignId('bed_id')->constrained('beds')->onDelete('restrict');
            $table->decimal('bed_cost', 10, 2)->default(0);

            // User
            $table->foreignId('user_id')->constrained('admins')->onDelete('restrict');
            $table->integer('status')->default('1'); // 1 admit, 2 discharge, 3 cancel
            $table->string('remarks')->default('N/A');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admission_patients');
    }
};
