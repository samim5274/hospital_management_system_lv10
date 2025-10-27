<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class UnitSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();
        DB::table('units')->insert([
            ['name' => 'mg', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'ml', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'g', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'L', 'created_at' => $now, 'updated_at' => '2025-10-22 16:52:17'],
            ['name' => 'tablet', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'capsule', 'created_at' => $now, 'updated_at' => $now],
        ]);
    }
}
