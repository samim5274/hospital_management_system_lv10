<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;

class PresentationSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $now = Carbon::now();
        DB::table('presentations')->insert([
            ['name' => 'Tablet', 'created_at' => $now, 'updated_at' => '2025-10-22 17:00:20'],
            ['name' => 'Capsule', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Syrup', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Injection', 'created_at' => $now, 'updated_at' => $now],
            ['name' => 'Powder', 'created_at' => $now, 'updated_at' => $now],
        ]);
    }
}
