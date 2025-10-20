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
        Schema::create('store_tests', function (Blueprint $table) {
            $table->id();
            $table->string('regNum');            // Patient registration number
            $table->foreignId('testId')->constrained('lab_tests')->onDelete('restrict'); // Lab test
            $table->decimal('testprice', 8, 2);         // Actual test price
            $table->decimal('referprice', 8, 2);        // Reference price
            $table->foreignId('categoryId')->constrained('lab_categories')->onDelete('restrict');
            $table->foreignId('subcategoryId')->constrained('lab_subcategories')->onDelete('restrict');
            $table->foreignId('specimenId')->constrained('lab_specimens')->onDelete('restrict');
            $table->foreignId('groupId')->constrained('lab_groups')->onDelete('restrict');
            $table->string('room')->nullable();   // Room number, optional
            $table->integer('status')->default(1); // 1=active, 0=inactive
            $table->integer('reportstatus')->default(0); // 0=pending, 1=completed
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('store_tests');
    }
};
