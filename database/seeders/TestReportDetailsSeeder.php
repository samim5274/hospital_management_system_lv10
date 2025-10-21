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
            // 🧬 1. CBC Test
            ['test_id'=>1,'part_of_test'=>'Hemoglobin','result'=>'14.2','unit'=>'g/dL','reference_value'=>'13.0 - 17.0','ref_value_of_hormone'=>null],
            ['test_id'=>1,'part_of_test'=>'WBC Count','result'=>'6.5','unit'=>'×10³/µL','reference_value'=>'4.0 - 11.0','ref_value_of_hormone'=>null],
            ['test_id'=>1,'part_of_test'=>'Platelet Count','result'=>'230','unit'=>'×10³/µL','reference_value'=>'150 - 400','ref_value_of_hormone'=>null],

            // 🧫 2. Thyroid Function Test
            ['test_id'=>2,'part_of_test'=>'T3','result'=>'1.3','unit'=>'ng/mL','reference_value'=>'0.8 - 2.0','ref_value_of_hormone'=>'Normal thyroid function'],
            ['test_id'=>2,'part_of_test'=>'T4','result'=>'8.2','unit'=>'µg/dL','reference_value'=>'5.0 - 12.0','ref_value_of_hormone'=>'Normal thyroid function'],
            ['test_id'=>2,'part_of_test'=>'TSH','result'=>'2.7','unit'=>'µIU/mL','reference_value'=>'0.4 - 4.0','ref_value_of_hormone'=>'Normal thyroid function'],

            // 🩸 3. Liver Function Test
            ['test_id'=>3,'part_of_test'=>'SGPT (ALT)','result'=>'32','unit'=>'U/L','reference_value'=>'0 - 45','ref_value_of_hormone'=>null],
            ['test_id'=>3,'part_of_test'=>'SGOT (AST)','result'=>'28','unit'=>'U/L','reference_value'=>'0 - 40','ref_value_of_hormone'=>null],
            ['test_id'=>3,'part_of_test'=>'Bilirubin Total','result'=>'0.8','unit'=>'mg/dL','reference_value'=>'0.2 - 1.2','ref_value_of_hormone'=>null],

            // 🧪 4. Kidney Function Test
            ['test_id'=>4,'part_of_test'=>'Urea','result'=>'35','unit'=>'mg/dL','reference_value'=>'15 - 45','ref_value_of_hormone'=>null],
            ['test_id'=>4,'part_of_test'=>'Creatinine','result'=>'1.1','unit'=>'mg/dL','reference_value'=>'0.7 - 1.4','ref_value_of_hormone'=>null],

            // 💧 5. Lipid Profile
            ['test_id'=>5,'part_of_test'=>'Cholesterol Total','result'=>'180','unit'=>'mg/dL','reference_value'=>'<200','ref_value_of_hormone'=>null],
            ['test_id'=>5,'part_of_test'=>'HDL','result'=>'52','unit'=>'mg/dL','reference_value'=>'>40','ref_value_of_hormone'=>null],
            ['test_id'=>5,'part_of_test'=>'LDL','result'=>'110','unit'=>'mg/dL','reference_value'=>'<130','ref_value_of_hormone'=>null],
            ['test_id'=>5,'part_of_test'=>'Triglycerides','result'=>'145','unit'=>'mg/dL','reference_value'=>'<150','ref_value_of_hormone'=>null],

            // 🩺 6. Blood Sugar Test
            ['test_id'=>6,'part_of_test'=>'Fasting Blood Sugar','result'=>'92','unit'=>'mg/dL','reference_value'=>'70 - 100','ref_value_of_hormone'=>null],
            ['test_id'=>6,'part_of_test'=>'Postprandial Blood Sugar','result'=>'128','unit'=>'mg/dL','reference_value'=>'<140','ref_value_of_hormone'=>null],

            // ⚕️ 7. Urine Routine Test
            ['test_id'=>7,'part_of_test'=>'pH','result'=>'6.5','unit'=>null,'reference_value'=>'4.5 - 8.0','ref_value_of_hormone'=>null],
            ['test_id'=>7,'part_of_test'=>'Protein','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],
            ['test_id'=>7,'part_of_test'=>'Glucose','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],

            // 💉 8. Electrolyte Test
            ['test_id'=>8,'part_of_test'=>'Sodium','result'=>'138','unit'=>'mmol/L','reference_value'=>'135 - 145','ref_value_of_hormone'=>null],
            ['test_id'=>8,'part_of_test'=>'Potassium','result'=>'4.2','unit'=>'mmol/L','reference_value'=>'3.5 - 5.1','ref_value_of_hormone'=>null],
            ['test_id'=>8,'part_of_test'=>'Chloride','result'=>'103','unit'=>'mmol/L','reference_value'=>'98 - 107','ref_value_of_hormone'=>null],

            // 🫁 9. Pulmonary Function Test
            ['test_id'=>9,'part_of_test'=>'FEV1','result'=>'3.5','unit'=>'L','reference_value'=>'>2.5','ref_value_of_hormone'=>null],
            ['test_id'=>9,'part_of_test'=>'FVC','result'=>'4.2','unit'=>'L','reference_value'=>'>3.0','ref_value_of_hormone'=>null],

            // ❤️ 10. ECG Test
            ['test_id'=>10,'part_of_test'=>'Heart Rate','result'=>'78','unit'=>'bpm','reference_value'=>'60 - 100','ref_value_of_hormone'=>null],
            ['test_id'=>10,'part_of_test'=>'QRS Duration','result'=>'85','unit'=>'ms','reference_value'=>'70 - 110','ref_value_of_hormone'=>null],

            // 👁️ 11. Eye Test
            ['test_id'=>11,'part_of_test'=>'Vision (Left)','result'=>'6/6','unit'=>null,'reference_value'=>'6/6','ref_value_of_hormone'=>null],
            ['test_id'=>11,'part_of_test'=>'Vision (Right)','result'=>'6/6','unit'=>null,'reference_value'=>'6/6','ref_value_of_hormone'=>null],

            // 🧠 12. Brain MRI
            ['test_id'=>12,'part_of_test'=>'Observation','result'=>'Normal','unit'=>null,'reference_value'=>'Normal','ref_value_of_hormone'=>null],

            // 🫀 13. Cardiac Enzyme Test
            ['test_id'=>13,'part_of_test'=>'CK-MB','result'=>'20','unit'=>'U/L','reference_value'=>'<25','ref_value_of_hormone'=>null],
            ['test_id'=>13,'part_of_test'=>'Troponin I','result'=>'0.01','unit'=>'ng/mL','reference_value'=>'<0.04','ref_value_of_hormone'=>null],

            // 🦠 14. Dengue Test
            ['test_id'=>14,'part_of_test'=>'NS1 Antigen','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],
            ['test_id'=>14,'part_of_test'=>'IgM Antibody','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],

            // 🧫 15. Malaria Test
            ['test_id'=>15,'part_of_test'=>'Plasmodium Falciparum','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],
            ['test_id'=>15,'part_of_test'=>'Plasmodium Vivax','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],

            // 16–50: Simplified Examples
            ['test_id'=>16,'part_of_test'=>'Vitamin D','result'=>'35','unit'=>'ng/mL','reference_value'=>'30 - 100','ref_value_of_hormone'=>null],
            ['test_id'=>17,'part_of_test'=>'Vitamin B12','result'=>'450','unit'=>'pg/mL','reference_value'=>'200 - 900','ref_value_of_hormone'=>null],
            ['test_id'=>18,'part_of_test'=>'Iron','result'=>'95','unit'=>'µg/dL','reference_value'=>'60 - 170','ref_value_of_hormone'=>null],
            ['test_id'=>19,'part_of_test'=>'Ferritin','result'=>'80','unit'=>'ng/mL','reference_value'=>'30 - 400','ref_value_of_hormone'=>null],
            ['test_id'=>20,'part_of_test'=>'Uric Acid','result'=>'5.6','unit'=>'mg/dL','reference_value'=>'3.5 - 7.2','ref_value_of_hormone'=>null],
            ['test_id'=>21,'part_of_test'=>'ESR','result'=>'12','unit'=>'mm/hr','reference_value'=>'0 - 15','ref_value_of_hormone'=>null],
            ['test_id'=>22,'part_of_test'=>'RBC Count','result'=>'4.9','unit'=>'million/µL','reference_value'=>'4.2 - 6.0','ref_value_of_hormone'=>null],
            ['test_id'=>23,'part_of_test'=>'PCV','result'=>'42','unit'=>'%','reference_value'=>'40 - 50','ref_value_of_hormone'=>null],
            ['test_id'=>24,'part_of_test'=>'MCH','result'=>'29','unit'=>'pg','reference_value'=>'27 - 33','ref_value_of_hormone'=>null],
            ['test_id'=>25,'part_of_test'=>'MCHC','result'=>'33','unit'=>'g/dL','reference_value'=>'32 - 36','ref_value_of_hormone'=>null],
            ['test_id'=>26,'part_of_test'=>'RDW','result'=>'13.2','unit'=>'%','reference_value'=>'11.5 - 14.5','ref_value_of_hormone'=>null],
            ['test_id'=>27,'part_of_test'=>'Neutrophils','result'=>'60','unit'=>'%','reference_value'=>'40 - 75','ref_value_of_hormone'=>null],
            ['test_id'=>28,'part_of_test'=>'Lymphocytes','result'=>'32','unit'=>'%','reference_value'=>'20 - 45','ref_value_of_hormone'=>null],
            ['test_id'=>29,'part_of_test'=>'Monocytes','result'=>'6','unit'=>'%','reference_value'=>'2 - 8','ref_value_of_hormone'=>null],
            ['test_id'=>30,'part_of_test'=>'Eosinophils','result'=>'2','unit'=>'%','reference_value'=>'1 - 6','ref_value_of_hormone'=>null],
            ['test_id'=>31,'part_of_test'=>'Basophils','result'=>'0.5','unit'=>'%','reference_value'=>'0 - 1','ref_value_of_hormone'=>null],
            ['test_id'=>32,'part_of_test'=>'Prothrombin Time','result'=>'13','unit'=>'sec','reference_value'=>'11 - 15','ref_value_of_hormone'=>null],
            ['test_id'=>33,'part_of_test'=>'INR','result'=>'1.0','unit'=>null,'reference_value'=>'0.8 - 1.2','ref_value_of_hormone'=>null],
            ['test_id'=>34,'part_of_test'=>'aPTT','result'=>'30','unit'=>'sec','reference_value'=>'25 - 35','ref_value_of_hormone'=>null],
            ['test_id'=>35,'part_of_test'=>'HIV 1 & 2','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],
            ['test_id'=>36,'part_of_test'=>'HCV Antibody','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],
            ['test_id'=>37,'part_of_test'=>'HbA1c','result'=>'5.4','unit'=>'%','reference_value'=>'<5.7','ref_value_of_hormone'=>null],
            ['test_id'=>38,'part_of_test'=>'Blood Group','result'=>'B+','unit'=>null,'reference_value'=>null,'ref_value_of_hormone'=>null],
            ['test_id'=>39,'part_of_test'=>'Pregnancy Test','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],
            ['test_id'=>40,'part_of_test'=>'Stool Occult Blood','result'=>'Negative','unit'=>null,'reference_value'=>'Negative','ref_value_of_hormone'=>null],
            ['test_id'=>41,'part_of_test'=>'Amylase','result'=>'85','unit'=>'U/L','reference_value'=>'30 - 110','ref_value_of_hormone'=>null],
            ['test_id'=>42,'part_of_test'=>'Lipase','result'=>'45','unit'=>'U/L','reference_value'=>'13 - 60','ref_value_of_hormone'=>null],
            ['test_id'=>43,'part_of_test'=>'LDH','result'=>'180','unit'=>'U/L','reference_value'=>'140 - 280','ref_value_of_hormone'=>null],
            ['test_id'=>44,'part_of_test'=>'GGT','result'=>'28','unit'=>'U/L','reference_value'=>'10 - 50','ref_value_of_hormone'=>null],
            ['test_id'=>45,'part_of_test'=>'Phosphorus','result'=>'3.6','unit'=>'mg/dL','reference_value'=>'2.5 - 4.5','ref_value_of_hormone'=>null],
            ['test_id'=>46,'part_of_test'=>'Magnesium','result'=>'2.1','unit'=>'mg/dL','reference_value'=>'1.7 - 2.4','ref_value_of_hormone'=>null],
            ['test_id'=>47,'part_of_test'=>'Zinc','result'=>'95','unit'=>'µg/dL','reference_value'=>'60 - 120','ref_value_of_hormone'=>null],
            ['test_id'=>48,'part_of_test'=>'Copper','result'=>'110','unit'=>'µg/dL','reference_value'=>'70 - 140','ref_value_of_hormone'=>null],
            ['test_id'=>49,'part_of_test'=>'Insulin (Fasting)','result'=>'8.5','unit'=>'µIU/mL','reference_value'=>'2 - 25','ref_value_of_hormone'=>null],
            ['test_id'=>50,'part_of_test'=>'Cortisol (Morning)','result'=>'15','unit'=>'µg/dL','reference_value'=>'6 - 23','ref_value_of_hormone'=>'Normal morning level'],
        ];


        TestReportDetail::insert($testReportDetails);
    }
}
