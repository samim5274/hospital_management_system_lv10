<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Bed;

class BedSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $wards = ['Male Ward', 'Female Ward', 'Cabin', 'ICU', 'Emergency'];

        for ($i = 1; $i <= 250; $i++) {
            Bed::create([
                'bed_number' => 'B' . str_pad($i, 3, '0', STR_PAD_LEFT),
                'ward' => $wards[array_rand($wards)],
                'status' => 'available',
                'price_per_day' => fake()->numberBetween(500, 2000),
            ]);
        }
    }
}
