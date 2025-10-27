<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class GenericSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();
        DB::table('generics')->insert([
            ['name' => 'Paracetamol', 'created_at' => $now, 'updated_at' => '2025-10-22 16:57:39'],
            ['name' => 'Amoxicillin', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Ibuprofen', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Metformin', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Ciprofloxacin', 'created_at' => $now, 'updated_at' => $now],
        ]);
    }
}
