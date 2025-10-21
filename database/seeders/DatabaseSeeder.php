<?php

namespace Database\Seeders;

// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        $this->call([
            LabCategorySeeder::class,
            LabSubcategorySeeder::class,
            LabGroupSeeder::class,
            LabSpecimenSeeder::class,
            LabTestSeeder::class,
            DoctorSeeder::class,
            ReferenceSeeder::class,
            BedSeeder::class,
            DutyDoctorSeeder::class,
            DiseaseSeeder::class,
            TestReportDetailsSeeder::class,
            ReagentSeeder::class,
        ]);
    }
}
