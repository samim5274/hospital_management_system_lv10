<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\IncomeCategory;

class IncomeCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Tuition Fee'],
            ['name' => 'Donation'],
            ['name' => 'Library Fee'],
            ['name' => 'Transport Fee'],
            ['name' => 'Examination Fee'],
        ];

        foreach($categories as $cat){
            IncomeCategory::create($cat);
        }
    }
}
