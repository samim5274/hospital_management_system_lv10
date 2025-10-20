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
        $categoryIds = LabCategory::pluck('id')->toArray();
        $subcategoryIds = LabSubcategory::pluck('id')->toArray();
        $specimenIds = LabSpecimen::pluck('id')->toArray();
        $groupIds = LabGroup::pluck('id')->toArray();

        for ($i = 1; $i <= 50; $i++) {
            LabTest::create([
                'testName' => $faker->word . ' Test ' . $i,
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
