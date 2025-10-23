<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ReagentStock extends Model
{
    use HasFactory;

    protected $fillable = [
        'reagent_id',
        'stock_in',
        'stock_out',
        'current_stock',
    ];

    public function reagent()
    {
        return $this->belongsTo(Reagent::class);
    }
}
