<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Reagent;
use App\Models\Unit;
use App\Models\Generic;
use App\Models\Presentation;

class ReagentSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $unit = Unit::first();
        $generic = Generic::first();
        $presentation = Presentation::first();

        $reagents = [
            'Acetone', 'Alcohol', 'Ammonia', 'Benzene', 'Calcium Chloride', 'Chloroform', 'Citric Acid',
            'Copper Sulphate', 'Formaldehyde', 'Glucose', 'Glycerol', 'Hydrochloric Acid', 'Hydrogen Peroxide',
            'Iodine', 'Iron Sulphate', 'Magnesium Sulphate', 'Methanol', 'Nitric Acid', 'Phenol', 'Potassium Chloride',
            'Potassium Hydroxide', 'Sodium Bicarbonate', 'Sodium Carbonate', 'Sodium Chloride', 'Sodium Hydroxide',
            'Sulfuric Acid', 'Toluene', 'Urea', 'Zinc Sulphate', 'Sodium Nitrate', 'Ammonium Chloride',
            'Barium Sulphate', 'Ethyl Acetate', 'Formic Acid', 'Hydrazine', 'Lithium Carbonate', 'Magnesium Hydroxide',
            'Manganese Sulphate', 'Nickel Sulphate', 'Phenolphthalein', 'Potassium Bromide', 'Silver Nitrate',
            'Sodium Sulphate', 'Sulfur', 'Thymol', 'Triethanolamine', 'Xylene', 'Zinc Chloride', 'Aluminium Sulphate'
        ];

        foreach ($reagents as $name) {
            Reagent::create([
                'name' => $name,
                'unit_id' => $unit->id,
                'generic_id' => $generic->id,
                'presentation_id' => $presentation->id,
                'purchase_price' => rand(50, 500),
                'min_qty' => 50
            ]);
        }
    }
}
