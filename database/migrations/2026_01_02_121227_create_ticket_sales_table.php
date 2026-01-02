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
        Schema::create('ticket_sales', function (Blueprint $table) {
            $table->id();

            $table->string('reg')->unique()->comment('Registration number (sequential)');
            $table->date('date')->comment('Invoice date');

            // Patient details
            $table->string('name')->comment('Patient name');
            $table->string('dob')->nullable()->comment('Date of birth');
            $table->string('gender')->nullable()->comment('Gender');
            $table->string('phone')->nullable()->comment('Phone number (+880 etc)');
            $table->text('address')->nullable()->comment('Address');

            // Relations
            $table->foreignId('doctor_id')->constrained('doctors')->onDelete('restrict')->comment('Doctor');
            $table->foreignId('refer_id')->nullable()->constrained('references')->onDelete('restrict')->comment('Reference');

            // Payment details
            $table->decimal('total', 12, 2)->default(0)->comment('Total amount');
            $table->decimal('discount', 12, 2)->default(0)->comment('Discount');
            $table->decimal('payable', 12, 2)->default(0)->comment('Payable after discount');
            $table->decimal('pay', 12, 2)->default(0)->comment('Paid amount');
            $table->integer('duestatus')->default(0)->comment('0 = no due, 1 = due');
            $table->decimal('due', 12, 2)->default(0)->comment('Due amount');
            $table->decimal('return', 12, 2)->default(0)->comment('Return amount if paid excess');

            $table->boolean('status')->default(1)->comment('Active/Inactive');

            $table->foreignId('user_id')->constrained('admins')->onDelete('restrict')->comment('Created by user');

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('ticket_sales');
    }
};
