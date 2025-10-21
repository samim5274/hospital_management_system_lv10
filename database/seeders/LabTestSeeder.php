<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\LabTest;
use App\Models\LabCategory;
use App\Models\LabSubcategory;
use App\Models\LabSpecimen;
use App\Models\LabGroup;
use Faker\Factory as Faker;

class LabTestSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $faker = Faker::create();

        // Get all IDs for foreign keys
        $categoryIds = LabCategory::pluck('id')->toArray() ?: [1];
        $subcategoryIds = LabSubcategory::pluck('id')->toArray() ?: [1];
        $specimenIds = LabSpecimen::pluck('id')->toArray() ?: [1];
        $groupIds = LabGroup::pluck('id')->toArray() ?: [1];

        $testNames = [
            'CBC Test',
            'Thyroid Function Test',
            'Liver Function Test',
            'Kidney Function Test',
            'Lipid Profile',
            'Blood Sugar Test',
            'Urine Routine Test',
            'Electrolyte Test',
            'Pulmonary Function Test',
            'ECG Test',
            'Eye Test',
            'Brain MRI',
            'Cardiac Enzyme Test',
            'Dengue Test',
            'Malaria Test',
            'Vitamin D Test',
            'Vitamin B12 Test',
            'Iron Test',
            'Ferritin Test',
            'Uric Acid Test',
            'ESR Test',
            'RBC Count Test',
            'PCV Test',
            'MCH Test',
            'MCHC Test',
            'RDW Test',
            'Neutrophils Test',
            'Lymphocytes Test',
            'Monocytes Test',
            'Eosinophils Test',
            'Basophils Test',
            'Prothrombin Time Test',
            'INR Test',
            'aPTT Test',
            'HIV 1 & 2 Test',
            'HCV Antibody Test',
            'HbA1c Test',
            'Blood Group Test',
            'Pregnancy Test',
            'Stool Occult Blood Test',
            'Amylase Test',
            'Lipase Test',
            'LDH Test',
            'GGT Test',
            'Phosphorus Test',
            'Magnesium Test',
            'Zinc Test',
            'Copper Test',
            'Insulin (Fasting) Test',
            'Cortisol (Morning) Test',
        ];

        foreach ($testNames as $index => $name) {
            LabTest::create([
                'testName' => $name,
                'categoryId' => $faker->randomElement($categoryIds),
                'subcategoryId' => $faker->randomElement($subcategoryIds),
                'specimenId' => $faker->randomElement($specimenIds),
                'groupId' => $faker->randomElement($groupIds),
                'testPrice' => $faker->numberBetween(500, 5000),
                'rprice' => $faker->numberBetween(300, 4500),
                'room' => 'Room ' . $faker->numberBetween(1, 10),
                'testDescription' => $faker->sentence,
                'status' => 1,
            ]);
        }
    }
}
