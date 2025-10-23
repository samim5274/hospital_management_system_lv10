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
        Schema::create('reagent_stocks', function (Blueprint $table) {
            $table->id();
            // Foreign Keys
            $table->foreignId('reagent_id')->constrained('reagents')->onDelete('restrict');

            // Stock fields
            $table->integer('stock_in')->default(0);
            $table->integer('stock_out')->default(0);
            $table->integer('current_stock')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reagent_stocks');
    }
};
