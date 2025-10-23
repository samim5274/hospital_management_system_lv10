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
        Schema::create('reagent_test', function (Blueprint $table) {
            $table->id();
            $table->foreignId('test_id')->constrained('lab_tests')->onDelete('restrict');
            $table->foreignId('reagent_id')->constrained('reagents')->onDelete('restrict');
            $table->decimal('quantity_required', 8, 2)->default(0);
            $table->timestamps();
            
            $table->unique(['test_id', 'reagent_id']);
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reagent_test');
    }
};
