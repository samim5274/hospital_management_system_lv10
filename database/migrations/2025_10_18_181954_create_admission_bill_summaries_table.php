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
        Schema::create('admission_bill_summaries', function (Blueprint $table) {
            $table->id();

            // Patient reference
            $table->foreignId('patient_id')->constrained('admission_patients')->onDelete('restrict');

            // Financial fields
            $table->decimal('general_bed', 10, 2)->default(0);
            $table->decimal('cabin_fee', 10, 2)->default(0);
            $table->decimal('doctor_fee', 10, 2)->default(0);
            $table->decimal('service_charge', 10, 2)->default(0);
            $table->decimal('ot_medicine', 10, 2)->default(0);
            $table->decimal('oral_medicine', 10, 2)->default(0);
            $table->decimal('others', 10, 2)->default(0);
            $table->decimal('contract_amount', 10, 2)->default(0);
            $table->decimal('total_cost', 10, 2)->default(0);
            $table->decimal('discount', 10, 2)->default(0);
            $table->decimal('advance_paid', 10, 2)->default(0);
            $table->decimal('payable_amount', 10, 2)->default(0);
            $table->decimal('paid_amount', 10, 2)->default(0);
            $table->decimal('remaining_due', 10, 2)->default(0);

            // Additional info
            $table->string('reg')->nullable();
            $table->date('billing_date')->nullable();
            $table->foreignId('user_id')->constrained('admins')->onDelete('restrict');
            $table->text('remarks')->nullable();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('admission_bill_summaries');
    }
};
