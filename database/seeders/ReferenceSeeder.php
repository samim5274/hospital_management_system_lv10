<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Reference;

class ReferenceSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $references = [
            ['name' => 'Mr. John Smith', 'designation' => 'Consultant', 'email' => 'john@example.com', 'phone' => '01710000001', 'status' => 1],
            ['name' => 'Ms. Alice Johnson', 'designation' => 'Lab Manager', 'email' => 'alice@example.com', 'phone' => '01710000002', 'status' => 1],
            ['name' => 'Dr. Robert Brown', 'designation' => 'Physician', 'email' => 'robert@example.com', 'phone' => '01710000003', 'status' => 1],
            ['name' => 'Dr. Emily Davis', 'designation' => 'Surgeon', 'email' => 'emily@example.com', 'phone' => '01710000004', 'status' => 1],
            ['name' => 'Mr. Michael Wilson', 'designation' => 'Technician', 'email' => 'michael@example.com', 'phone' => '01710000005', 'status' => 1],
            ['name' => 'Ms. Sophia Taylor', 'designation' => 'Nurse', 'email' => 'sophia@example.com', 'phone' => '01710000006', 'status' => 1],
            ['name' => 'Dr. William Martinez', 'designation' => 'Radiologist', 'email' => 'william@example.com', 'phone' => '01710000007', 'status' => 1],
            ['name' => 'Dr. Olivia Anderson', 'designation' => 'Oncologist', 'email' => 'olivia@example.com', 'phone' => '01710000008', 'status' => 1],
            ['name' => 'Dr. James Thomas', 'designation' => 'Endocrinologist', 'email' => 'james@example.com', 'phone' => '01710000009', 'status' => 1],
            ['name' => 'Dr. Isabella Jackson', 'designation' => 'Pediatrician', 'email' => 'isabella@example.com', 'phone' => '01710000010', 'status' => 1],
            ['name' => 'Dr. Benjamin White', 'designation' => 'Cardiologist', 'email' => 'benjamin@example.com', 'phone' => '01710000011', 'status' => 1],
            ['name' => 'Dr. Mia Harris', 'designation' => 'Neurologist', 'email' => 'mia@example.com', 'phone' => '01710000012', 'status' => 1],
            ['name' => 'Dr. Daniel Clark', 'designation' => 'Orthopedic', 'email' => 'daniel@example.com', 'phone' => '01710000013', 'status' => 1],
            ['name' => 'Dr. Charlotte Lewis', 'designation' => 'Dermatologist', 'email' => 'charlotte@example.com', 'phone' => '01710000014', 'status' => 1],
            ['name' => 'Dr. Matthew Lee', 'designation' => 'Ophthalmologist', 'email' => 'matthew@example.com', 'phone' => '01710000015', 'status' => 1],
        ];

        foreach ($references as $ref) {
            Reference::create($ref);
        }
    }
}
