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
        Schema::create('reagents', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->foreignId('unit_id')->constrained('units')->onDelete('restrict'); // assuming units table exists
            $table->foreignId('generic_id')->constrained('generics')->onDelete('restrict'); // assuming generics table exists
            $table->foreignId('presentation_id')->constrained('presentations')->onDelete('restrict'); // assuming presentations table exists
            $table->decimal('purchase_price', 12, 2)->default(0);
            $table->integer('min_qty')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('reagents');
    }
};
