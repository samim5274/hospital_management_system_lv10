<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\DutyDoctor;

class DutyDoctorSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $doctors = [
            ['Dr. Ayesha Karim', 'Cardiology', '01710000001', 'ayesha@example.com'],
            ['Dr. Rahat Hossain', 'Orthopedics', '01710000002', 'rahat@example.com'],
            ['Dr. Tanvir Alam', 'Neurology', '01710000003', 'tanvir@example.com'],
            ['Dr. Nusrat Jahan', 'Gynecology', '01710000004', 'nusrat@example.com'],
            ['Dr. Mamun Rahman', 'Medicine', '01710000005', 'mamun@example.com'],
            ['Dr. Farhana Ahmed', 'Dermatology', '01710000006', 'farhana@example.com'],
            ['Dr. Shahidul Islam', 'ENT', '01710000007', 'shahidul@example.com'],
            ['Dr. Sabrina Akter', 'Cardiology', '01710000008', 'sabrina@example.com'],
            ['Dr. Tareq Hasan', 'Urology', '01710000009', 'tareq@example.com'],
            ['Dr. Rafiq Mahmud', 'Medicine', '01710000010', 'rafiq@example.com'],
            ['Dr. Mahiya Sultana', 'Gynecology', '01710000011', 'mahiya@example.com'],
            ['Dr. Hasan Chowdhury', 'Orthopedics', '01710000012', 'hasan@example.com'],
            ['Dr. Sumaiya Rahman', 'Dermatology', '01710000013', 'sumaiya@example.com'],
            ['Dr. Arif Mahmud', 'Cardiology', '01710000014', 'arif@example.com'],
            ['Dr. Nayeem Islam', 'ENT', '01710000015', 'nayeem@example.com'],
            ['Dr. Rima Akter', 'Neurology', '01710000016', 'rima@example.com'],
            ['Dr. Omar Faruk', 'Medicine', '01710000017', 'omar@example.com'],
            ['Dr. Sadiya Hossain', 'Gynecology', '01710000018', 'sadiya@example.com'],
            ['Dr. Kamrul Hasan', 'Cardiology', '01710000019', 'kamrul@example.com'],
            ['Dr. Rashedul Islam', 'Urology', '01710000020', 'rashed@example.com'],
        ];

        foreach ($doctors as $doc) {
            DutyDoctor::create([
                'name' => $doc[0],
                'specialization' => $doc[1],
                'phone' => $doc[2],
                'email' => $doc[3],
            ]);
        }
    }
}
