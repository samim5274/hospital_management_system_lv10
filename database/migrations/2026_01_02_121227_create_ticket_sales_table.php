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

            $table->string('reg')->unique();
            $table->date('date');

            // Patient details
            $table->string('name');
            $table->string('dob')->nullable();
            $table->string('gender')->nullable();
            $table->string('phone')->nullable();
            $table->text('address')->nullable();

            // Relations
            $table->foreignId('doctor_id')->constrained('doctors')->onDelete('restrict');
            $table->foreignId('refer_id')->nullable()->constrained('references')->onDelete('restrict');

            // Payment details
            $table->decimal('total', 12, 2)->default(0);
            $table->decimal('discount', 12, 2)->default(0);
            $table->decimal('payable', 12, 2)->default(0);
            $table->decimal('pay', 12, 2)->default(0);
            $table->integer('duestatus')->default(0); // 1 = no due, 0 = due
            $table->decimal('due', 12, 2)->default(0);
            $table->decimal('return', 12, 2)->default(0);

            $table->boolean('status')->default(1); // 1 = Active & 0 = Inactive

            $table->foreignId('user_id')->constrained('admins')->onDelete('restrict');

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
