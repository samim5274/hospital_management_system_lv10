<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\IncomeSubCategory;
use App\Models\IncomeCategory;

class IncomeSubCategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $subcategories = [
            'Tuition Fee' => ['Grade 1-5', 'Grade 6-10', 'Grade 11-12', 'Pre-School'],
            'Donation' => ['Alumni Donation', 'Sponsor Donation', 'General Donation'],
            'Library Fee' => ['Book Fee', 'Late Fee', 'Library Membership Fee'],
            'Transport Fee' => ['Bus Fee', 'Van Fee', 'Driver Allowance'],
            'Examination Fee' => ['Monthly Test', 'Final Exam', 'Practical Exam'],
            'Laboratory Fee' => ['Lab Materials', 'Lab Practical Fee'],
            'Sports Fee' => ['Annual Sports', 'Monthly Sports'],
            'Uniform Fee' => ['Summer Uniform', 'Winter Uniform'],
        ];

        foreach($subcategories as $categoryName => $subs){
            $category = IncomeCategory::where('name', $categoryName)->first();
            if($category){
                foreach($subs as $sub){
                    IncomeSubCategory::create([
                        'category_id' => $category->id,
                        'name' => $sub,
                    ]);
                }
            }
        }
    }
}
