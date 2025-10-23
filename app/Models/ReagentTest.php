<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReagentTest extends Model
{
    use HasFactory;

    protected $table = 'reagent_test'; // pivot table name

    protected $fillable = [
        'test_id',
        'reagent_id',
        'quantity_required',
    ];

    public function test() {
        return $this->belongsTo(LabTest::class);
    }

    public function reagent() {
        return $this->belongsTo(Reagent::class);
    }
}
