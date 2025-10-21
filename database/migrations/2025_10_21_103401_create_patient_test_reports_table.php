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
        Schema::create('patient_test_reports', function (Blueprint $table) {
            $table->id();

            // registration number or reg code
            $table->string('reg')->nullable();

            // foreign keys
            $table->foreignId('patient_id')->constrained('payment_details')->onDelete('restrict');
            $table->foreignId('test_id')->constrained('test_report_details')->onDelete('restrict');

            // test info
            $table->string('part_of_test')->nullable();
            $table->string('result')->nullable();
            $table->string('unit')->nullable();
            $table->string('reference_value')->nullable();
            $table->string('ref_value_of_hormone')->nullable();
            $table->text('remarks')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('patient_test_reports');
    }
};
