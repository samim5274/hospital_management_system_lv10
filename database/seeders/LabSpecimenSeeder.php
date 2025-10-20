<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\LabSpecimen;

class LabSpecimenSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $specimens = [
            ['name' => 'Blood', 'description' => 'Venous blood sample'],
            ['name' => 'Urine', 'description' => 'Urine sample'],
            ['name' => 'Saliva', 'description' => 'Saliva sample'],
            ['name' => 'Swab', 'description' => 'Throat/nasal swab'],
        ];

        foreach ($specimens as $specimen) {
            LabSpecimen::create($specimen);
        }
    }
}
