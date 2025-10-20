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
        Schema::create('test_report_details', function (Blueprint $table) {
            $table->id();

            $table->foreignId('test_id')->constrained('lab_tests')->onDelete('restrict');

            // Core test part info
            $table->string('part_of_test')->nullable();
            $table->string('result')->nullable();
            $table->string('unit')->nullable();
            $table->string('reference_value')->nullable();
            $table->string('ref_value_of_hormone')->nullable();
            
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('test_report_details');
    }
};
