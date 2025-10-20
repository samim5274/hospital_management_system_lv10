<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\LabGroup;

class LabGroupSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $groups = [
            ['name' => 'Routine', 'description' => 'Routine tests'],
            ['name' => 'Special', 'description' => 'Special tests'],
            ['name' => 'Emergency', 'description' => 'Emergency tests'],
        ];

        foreach ($groups as $group) {
            LabGroup::create($group);
        }
    }
}
