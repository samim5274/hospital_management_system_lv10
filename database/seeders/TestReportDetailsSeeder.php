<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\TestReportDetail;

class TestReportDetailsSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $testReportDetails = [
            // 🧬 CBC Test
            [
                'test_id' => 1,
                'part_of_test' => 'Hemoglobin',
                'result' => '14.2',
                'unit' => 'g/dL',
                'reference_value' => '13.0 - 17.0',
                'ref_value_of_hormone' => null,
            ],
            [
                'test_id' => 1,
                'part_of_test' => 'WBC Count',
                'result' => '6.5',
                'unit' => '×10³/µL',
                'reference_value' => '4.0 - 11.0',
                'ref_value_of_hormone' => null,
            ],
            [
                'test_id' => 1,
                'part_of_test' => 'Platelet Count',
                'result' => '230',
                'unit' => '×10³/µL',
                'reference_value' => '150 - 400',
                'ref_value_of_hormone' => null,
            ],

            // 🩸 Thyroid Function Test
            [
                'test_id' => 2,
                'part_of_test' => 'T3',
                'result' => '1.3',
                'unit' => 'ng/mL',
                'reference_value' => '0.8 - 2.0',
                'ref_value_of_hormone' => 'Normal thyroid function',
            ],
            [
                'test_id' => 2,
                'part_of_test' => 'T4',
                'result' => '8.2',
                'unit' => 'µg/dL',
                'reference_value' => '5.0 - 12.0',
                'ref_value_of_hormone' => 'Normal thyroid function',
            ],
            [
                'test_id' => 2,
                'part_of_test' => 'TSH',
                'result' => '2.7',
                'unit' => 'µIU/mL',
                'reference_value' => '0.4 - 4.0',
                'ref_value_of_hormone' => 'Normal thyroid function',
            ],

            // 🧫 Liver Function Test
            [
                'test_id' => 3,
                'part_of_test' => 'SGPT (ALT)',
                'result' => '32',
                'unit' => 'U/L',
                'reference_value' => '0 - 45',
                'ref_value_of_hormone' => null,
            ],
            [
                'test_id' => 3,
                'part_of_test' => 'SGOT (AST)',
                'result' => '28',
                'unit' => 'U/L',
                'reference_value' => '0 - 40',
                'ref_value_of_hormone' => null,
            ],
            [
                'test_id' => 3,
                'part_of_test' => 'Bilirubin Total',
                'result' => '0.8',
                'unit' => 'mg/dL',
                'reference_value' => '0.2 - 1.2',
                'ref_value_of_hormone' => null,
            ],
        ];

        TestReportDetail::insert($testReportDetails);
    }
}
