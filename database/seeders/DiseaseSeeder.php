<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Disease;

class DiseaseSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $diseases = [
            ['Diabetes Mellitus', 'A metabolic disorder causing high blood sugar levels.'],
            ['Hypertension', 'High blood pressure condition.'],
            ['Asthma', 'A chronic lung disease causing breathing difficulty.'],
            ['Heart Disease', 'Conditions affecting the heart and blood vessels.'],
            ['Arthritis', 'Inflammation of the joints causing pain and stiffness.'],
            ['Migraine', 'Severe recurring headaches often with nausea.'],
            ['Tuberculosis', 'An infectious disease mainly affecting the lungs.'],
            ['Pneumonia', 'Infection that inflames the air sacs in one or both lungs.'],
            ['Covid-19', 'Respiratory illness caused by SARS-CoV-2 virus.'],
            ['Hepatitis B', 'A viral infection that affects the liver.'],
            ['Typhoid Fever', 'Bacterial infection caused by Salmonella typhi.'],
            ['Malaria', 'Mosquito-borne infectious disease affecting red blood cells.'],
            ['Dengue Fever', 'Viral infection spread by Aedes mosquitoes.'],
            ['Gastritis', 'Inflammation of the stomach lining.'],
            ['Ulcer', 'Open sores on the stomach or intestinal lining.'],
            ['Cancer', 'Abnormal cell growth that can spread to other parts of the body.'],
            ['Jaundice', 'Yellowing of the skin and eyes due to liver problems.'],
            ['Influenza', 'Common viral infection causing fever and sore throat.'],
            ['Kidney Stone', 'Hard deposits of minerals in the kidneys.'],
            ['Anemia', 'Low red blood cell count causing fatigue.'],
        ];

        foreach ($diseases as $dis) {
            Disease::create([
                'name' => $dis[0],
                'description' => $dis[1],
            ]);
        }
    }
}
