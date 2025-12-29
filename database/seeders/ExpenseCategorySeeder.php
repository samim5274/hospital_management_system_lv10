<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\ExpensesCategory;

class ExpenseCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['name' => 'Salary'],
            ['name' => 'Utility'],
            ['name' => 'Maintenance'],
            ['name' => 'Academic'],
            ['name' => 'Transport'],
            ['name' => 'Event'],
        ];

        foreach ($categories as $category) {
            ExpensesCategory::create($category);
        }
    }
}
