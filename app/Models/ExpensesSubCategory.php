<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExpensesSubCategory extends Model
{
    use HasFactory;

    protected $fillable = ['category_id','name'];

    public function category()
    {
        return $this->belongsTo(ExpensesCategory::class, 'category_id', 'id');
    }

    public function expenses()
    {
        return $this->HasMany(ExpensesDetails::class, 'sub_category_id', 'id');
    }
}
