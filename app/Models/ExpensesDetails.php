<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class ExpensesDetails extends Model
{
    use HasFactory;

    protected $fillable = [
        'category_id', 
        'sub_category_id', 
        'user_id', 
        'title',
        'date', 
        'amount', 
        'remark'
    ];

    public function category()
    {
        return $this->belongsTo(ExpensesCategory::class, 'category_id', 'id');
    }

    public function subcategory()
    {
        return $this->belongsTo(ExpensesSubCategory::class, 'sub_category_id', 'id');
    }
    
    public function user()
    {
        return $this->belongsTo(Admin::class, 'user_id', 'id');
    }
}
