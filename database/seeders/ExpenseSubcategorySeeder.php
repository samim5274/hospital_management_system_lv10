<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\ExpensesSubCategory;
use App\Models\ExpensesCategory;

class ExpenseSubcategorySeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $salary = ExpensesCategory::where('name', 'Salary')->first();
        $utility = ExpensesCategory::where('name', 'Utility')->first();
        $maintenance = ExpensesCategory::where('name', 'Maintenance')->first();
        $academic = ExpensesCategory::where('name', 'Academic')->first();
        $transport = ExpensesCategory::where('name', 'Transport')->first();
        $event = ExpensesCategory::where('name', 'Event')->first();

        $subcategories = [
            // Salary
            ['category_id' => $salary->id, 'name' => 'Teacher Salary'],
            ['category_id' => $salary->id, 'name' => 'Staff Salary'],
            ['category_id' => $salary->id, 'name' => 'Guest Teacher Salary'],

            // Utility
            ['category_id' => $utility->id, 'name' => 'Electricity Bill'],
            ['category_id' => $utility->id, 'name' => 'Water Bill'],
            ['category_id' => $utility->id, 'name' => 'Internet Bill'],

            // Maintenance
            ['category_id' => $maintenance->id, 'name' => 'Furniture Repair'],
            ['category_id' => $maintenance->id, 'name' => 'Building Repair'],
            ['category_id' => $maintenance->id, 'name' => 'Painting'],

            // Academic
            ['category_id' => $academic->id, 'name' => 'Books Purchase'],
            ['category_id' => $academic->id, 'name' => 'Lab Equipment'],
            ['category_id' => $academic->id, 'name' => 'Classroom Materials'],

            // Transport
            ['category_id' => $transport->id, 'name' => 'Bus Fuel'],
            ['category_id' => $transport->id, 'name' => 'Driver Salary'],
            ['category_id' => $transport->id, 'name' => 'Vehicle Repair'],

            // Event
            ['category_id' => $event->id, 'name' => 'Annual Program'],
            ['category_id' => $event->id, 'name' => 'Sports Day'],
            ['category_id' => $event->id, 'name' => 'Prize Giving Ceremony'],
        ];

        foreach ($subcategories as $subcat) {
            ExpensesSubCategory::create($subcat);
        }
    }
}
