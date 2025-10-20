<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\LabSubcategory;
use App\Models\LabCategory;

class LabSubcategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $hematologyId = LabCategory::where('catName','Hematology')->first()->id;
        $biochemistryId = LabCategory::where('catName','Biochemistry')->first()->id;

        $subcategories = [
            ['catId' => $hematologyId, 'subCatName' => 'CBC', 'description' => 'Complete Blood Count'],
            ['catId' => $hematologyId, 'subCatName' => 'ESR', 'description' => 'Erythrocyte Sedimentation Rate'],
            ['catId' => $biochemistryId, 'subCatName' => 'Liver Function Test', 'description' => 'LFT panel'],
            ['catId' => $biochemistryId, 'subCatName' => 'Kidney Function Test', 'description' => 'KFT panel'],
        ];

        foreach ($subcategories as $sub) {
            LabSubcategory::create($sub);
        }
    }
}
