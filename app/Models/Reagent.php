<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Reagent extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'unit_id',
        'generic_id',
        'presentation_id',
        'purchase_price',
        'min_qty',
    ];

    // Relationships
    public function unit()
    {
        return $this->belongsTo(Unit::class);
    }

    public function generic()
    {
        return $this->belongsTo(Generic::class);
    }

    public function presentation()
    {
        return $this->belongsTo(Presentation::class);
    }
}
