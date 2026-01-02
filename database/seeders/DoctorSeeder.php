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
            ['name' => 'Dr. John Smith', 'specialization' => 'Cardiologist', 'email' => 'john.smith@example.com', 'phone' => '01710000001', 'fees' => '1000'],
            ['name' => 'Dr. Alice Johnson', 'specialization' => 'Neurologist', 'email' => 'alice.johnson@example.com', 'phone' => '01710000002', 'fees' => '800'],
            ['name' => 'Dr. Robert Brown', 'specialization' => 'Pediatrician', 'email' => 'robert.brown@example.com', 'phone' => '01710000003', 'fees' => '500'],
            ['name' => 'Dr. Emily Davis', 'specialization' => 'Dermatologist', 'email' => 'emily.davis@example.com', 'phone' => '01710000004', 'fees' => '1000'],
            ['name' => 'Dr. Michael Wilson', 'specialization' => 'Orthopedic', 'email' => 'michael.wilson@example.com', 'phone' => '01710000005', 'fees' => '800'],
            ['name' => 'Dr. Sophia Taylor', 'specialization' => 'Gynecologist', 'email' => 'sophia.taylor@example.com', 'phone' => '01710000006', 'fees' => '1000'],
            ['name' => 'Dr. William Martinez', 'specialization' => 'ENT Specialist', 'email' => 'william.martinez@example.com', 'phone' => '01710000007', 'fees' => '1000'],
            ['name' => 'Dr. Olivia Anderson', 'specialization' => 'Oncologist', 'email' => 'olivia.anderson@example.com', 'phone' => '01710000008', 'fees' => '800'],
            ['name' => 'Dr. James Thomas', 'specialization' => 'Radiologist', 'email' => 'james.thomas@example.com', 'phone' => '01710000009', 'fees' => '700'],
            ['name' => 'Dr. Isabella Jackson', 'specialization' => 'Endocrinologist', 'email' => 'isabella.jackson@example.com', 'phone' => '01710000010', 'fees' => '1500'],
            ['name' => 'Dr. Benjamin White', 'specialization' => 'Urologist', 'email' => 'benjamin.white@example.com', 'phone' => '01710000011', 'fees' => '2000'],
            ['name' => 'Dr. Mia Harris', 'specialization' => 'Gastroenterologist', 'email' => 'mia.harris@example.com', 'phone' => '01710000012', 'fees' => '850'],
            ['name' => 'Dr. Daniel Clark', 'specialization' => 'Pulmonologist', 'email' => 'daniel.clark@example.com', 'phone' => '01710000013', 'fees' => '500'],
            ['name' => 'Dr. Charlotte Lewis', 'specialization' => 'Nephrologist', 'email' => 'charlotte.lewis@example.com', 'phone' => '01710000014', 'fees' => '1000'],
            ['name' => 'Dr. Matthew Lee', 'specialization' => 'Ophthalmologist', 'email' => 'matthew.lee@example.com', 'phone' => '01710000015', 'fees' => '1000'],
        ];

        foreach ($doctors as $doctor) {
            Doctor::create($doctor);
        }
    }
}
