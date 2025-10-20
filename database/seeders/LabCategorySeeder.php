<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\LabCategory;

class LabCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $categories = [
            ['catName' => 'Hematology', 'description' => 'Blood related tests'],
            ['catName' => 'Biochemistry', 'description' => 'Chemical analysis tests'],
            ['catName' => 'Microbiology', 'description' => 'Bacteria and virus tests'],
            ['catName' => 'Immunology', 'description' => 'Immune system tests'],
        ];

        foreach ($categories as $category) {
            LabCategory::create($category);
        }
    }
}
