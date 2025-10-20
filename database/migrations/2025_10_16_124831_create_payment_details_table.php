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
        Schema::create('payment_details', function (Blueprint $table) {
            $table->id();

            $table->string('reg');             // Registration number (sequential)
            $table->date('date');                          // Invoice date
            $table->string('name');                        // Patient name
            $table->string('dob');                         // Date of birth
            $table->string('gender');                      // Gender
            $table->string('phone');                       // Phone number (varchar to handle +880 etc)
            $table->text('address');                       // Address

            $table->foreignId('doctorId')->constrained('doctors')->onDelete('restrict');   // Doctor
            $table->foreignId('referId')->nullable()->constrained('references')->onDelete('set null'); // Reference

            $table->integer('total')->default(0);         // Total amount
            $table->integer('discount')->default(0);      // Discount
            $table->integer('payable')->default(0);       // Payable after discount
            $table->integer('pay')->default(0);           // Paid amount
            $table->integer('duestatus')->default(0);     // 0 = no due, 1 = due
            $table->integer('due')->default(0);           // Due amount
            $table->integer('return')->default(0);        // Return amount if paid excess

            $table->boolean('status')->default(1);        // Active/Inactive
            $table->foreignId('userId')->constrained('admins')->onDelete('restrict'); 

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('payment_details');
    }
};
