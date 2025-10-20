<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Doctor;

class DoctorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $doctors = [
            ['name' => 'Dr. John Smith', 'specialization' => 'Cardiologist', 'email' => 'john.smith@example.com', 'phone' => '01710000001'],
            ['name' => 'Dr. Alice Johnson', 'specialization' => 'Neurologist', 'email' => 'alice.johnson@example.com', 'phone' => '01710000002'],
            ['name' => 'Dr. Robert Brown', 'specialization' => 'Pediatrician', 'email' => 'robert.brown@example.com', 'phone' => '01710000003'],
            ['name' => 'Dr. Emily Davis', 'specialization' => 'Dermatologist', 'email' => 'emily.davis@example.com', 'phone' => '01710000004'],
            ['name' => 'Dr. Michael Wilson', 'specialization' => 'Orthopedic', 'email' => 'michael.wilson@example.com', 'phone' => '01710000005'],
            ['name' => 'Dr. Sophia Taylor', 'specialization' => 'Gynecologist', 'email' => 'sophia.taylor@example.com', 'phone' => '01710000006'],
            ['name' => 'Dr. William Martinez', 'specialization' => 'ENT Specialist', 'email' => 'william.martinez@example.com', 'phone' => '01710000007'],
            ['name' => 'Dr. Olivia Anderson', 'specialization' => 'Oncologist', 'email' => 'olivia.anderson@example.com', 'phone' => '01710000008'],
            ['name' => 'Dr. James Thomas', 'specialization' => 'Radiologist', 'email' => 'james.thomas@example.com', 'phone' => '01710000009'],
            ['name' => 'Dr. Isabella Jackson', 'specialization' => 'Endocrinologist', 'email' => 'isabella.jackson@example.com', 'phone' => '01710000010'],
            ['name' => 'Dr. Benjamin White', 'specialization' => 'Urologist', 'email' => 'benjamin.white@example.com', 'phone' => '01710000011'],
            ['name' => 'Dr. Mia Harris', 'specialization' => 'Gastroenterologist', 'email' => 'mia.harris@example.com', 'phone' => '01710000012'],
            ['name' => 'Dr. Daniel Clark', 'specialization' => 'Pulmonologist', 'email' => 'daniel.clark@example.com', 'phone' => '01710000013'],
            ['name' => 'Dr. Charlotte Lewis', 'specialization' => 'Nephrologist', 'email' => 'charlotte.lewis@example.com', 'phone' => '01710000014'],
            ['name' => 'Dr. Matthew Lee', 'specialization' => 'Ophthalmologist', 'email' => 'matthew.lee@example.com', 'phone' => '01710000015'],
        ];

        foreach ($doctors as $doctor) {
            Doctor::create($doctor);
        }
    }
}
