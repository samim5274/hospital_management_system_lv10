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
        Schema::create('lab_tests', function (Blueprint $table) {
            $table->id();
            $table->string('testName');
            
            $table->foreignId('categoryId')->constrained('lab_categories')->onDelete('restrict');
            $table->foreignId('subcategoryId')->constrained('lab_subcategories')->onDelete('restrict');
            $table->foreignId('specimenId')->constrained('lab_specimens')->onDelete('restrict');
            $table->foreignId('groupId')->constrained('lab_groups')->onDelete('restrict');

            $table->decimal('testPrice', 8, 2);
            $table->decimal('rprice', 8, 2);                      
            $table->string('room')->nullable();
            $table->text('testDescription')->nullable();
            $table->integer('status')->default(1);         // 1 = active, 0 = inactive
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('lab_tests');
    }
};
