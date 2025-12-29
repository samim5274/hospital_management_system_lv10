<?php

namespace App\Http\Controllers\Income;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use App\Models\Income;
use App\Models\IncomeCategory;
use App\Models\IncomeSubCategory;
use App\Models\Company;

class IncomeController extends Controller
{
    public function index()
    {
        $company = Company::first();
        $categories = IncomeCategory::all();
        $subcategories = IncomeSubCategory::with('category')->get();
        $incomes = Income::where('date', Carbon::now()->format('Y-m-d'))->with('category', 'subcategory', 'user')->orderBy('id', 'DESC')->get();
        return view('income.income', compact('company', 'categories', 'subcategories', 'incomes'));
    }

    public function getInSubcategories($category_id)
    {
        $subcategories = IncomeSubCategory::where('category_id', $category_id)->get();
        return response()->json($subcategories);
    }

    public function storeIncome(Request $request)
    {
        $request->validate([
            'category_id' => 'required|exists:income_categories,id',
            'sub_category_id' => 'nullable|exists:income_sub_categories,id',
            'amount' => 'required|numeric|min:0',
            'remark' => 'nullable|string',
        ]);

        try{
            $data = new Income();
            $data->category_id = $request->category_id;
            $data->subcategory_id = $request->sub_category_id;
            $data->user_id = Auth::guard('admin')->user()->id;
            $data->title = $request->title;
            $data->description = $request->remark;
            $data->amount = $request->amount;
            $data->date =  Carbon::now()->format('Y-m-d');
            $data->save();
            return redirect()->route('incomes')->with('success', 'Income added successfully.');
        } catch (\Exception $e) {
            return redirect()->route('incomes')->with('error', 'Failed to add income. Please try again.');
        }
    }

    public function editIncome(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'required|exists:income_categories,id',
            'sub_category_id' => 'nullable|exists:income_sub_categories,id',
            'amount' => 'required|numeric|min:0',
            'remark' => 'nullable|string',
        ]);

        try{
            $data = Income::findOrFail($id);
            $data->category_id = $request->category_id;
            $data->subcategory_id = $request->sub_category_id;
            $data->user_id = Auth::guard('admin')->user()->id;
            $data->title = $request->title;
            $data->description = $request->remark. ' (Edited)';
            $data->amount = $request->amount;
            $data->date = Carbon::now()->format('Y-m-d');
            $data->save();
            return redirect()->route('incomes')->with('success', 'Income updated successfully.');
        } catch (\Exception $e) {
            return redirect()->route('incomes')->with('error', 'Failed to update income. Please try again.');
        }
    }

    public function deleteIncome($id)
    {
        try{
            $income = Income::findOrFail($id);
            // $income->delete();
            return redirect()->route('incomes')->with('success', 'Income deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->route('incomes')->with('error', 'Failed to delete income. Please try again.');
        }
    }

    public function printIncome($id)
    {
        try{
            $income = Income::with('category', 'subcategory', 'user')->findOrFail($id);
            $company = Company::first();
            return view('income.print.print-income', compact('income', 'company'));
        } catch (\Exception $e) {
            return redirect()->route('incomes')->with('error', 'Failed to load income for printing. Please try again.');
        }
    }

    public function settings()
    {
        $company = Company::first();
        $categories = IncomeCategory::all();
        $subcategories = IncomeSubCategory::with('category')->get();
        return view('income.income-settings', compact('company', 'categories', 'subcategories'));
    }

    public function storeCategory(Request $request)
    {
        $request->validate([
            'name' => 'required|string|unique:income_categories,name',
        ]);

        try{
            $category = new IncomeCategory();
            $category->name = $request->name;
            $category->save();
            return redirect()->route('income.settings')->with('success', 'Income category added successfully.');
        } catch (\Exception $e) {
            return redirect()->route('income.settings')->with('error', 'Failed to add income category. Please try again.');
        }
    }

    public function deleteCategory($id)
    {
        try{
            $category = IncomeCategory::findOrFail($id);
            $category->delete();
            return redirect()->route('income.settings')->with('success', 'Income category deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->route('income.settings')->with('error', 'Failed to delete income category. Please try again.');
        }
    }

    public function editCategory(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|string|unique:income_categories,name,'.$id,
        ]);

        try{
            $category = IncomeCategory::findOrFail($id);
            $category->name = $request->name;
            $category->save();
            return redirect()->route('income.settings')->with('success', 'Income category updated successfully.');
        } catch (\Exception $e) {
            return redirect()->route('income.settings')->with('error', 'Failed to update income category. Please try again.');
        }
    }

    public function storeSubCategory(Request $request)
    {
        $request->validate([
            'category_id' => 'required|exists:income_categories,id',
            'name' => 'required|string|unique:income_sub_categories,name',
        ]);

        try{
            $subcategory = new IncomeSubCategory();
            $subcategory->category_id = $request->category_id;
            $subcategory->name = $request->name;
            $subcategory->save();
            return redirect()->route('income.settings')->with('success', 'Income sub-category added successfully.');
        } catch (\Exception $e) {
            return redirect()->route('income.settings')->with('error', 'Failed to add income sub-category. Please try again.');
        }
    }

    public function deleteSubCategory($id)
    {
        try{
            $subcategory = IncomeSubCategory::findOrFail($id);
            $subcategory->delete();
            return redirect()->route('income.settings')->with('success', 'Income sub-category deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->route('income.settings')->with('error', 'Failed to delete income sub-category. Please try again.');
        }
    }

    public function editSubCategory(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'required|exists:income_categories,id',
            'name' => 'required|string|unique:income_sub_categories,name,'.$id,
        ]);

        try{
            $subcategory = IncomeSubCategory::findOrFail($id);
            $subcategory->category_id = $request->category_id;
            $subcategory->name = $request->name;
            $subcategory->save();
            return redirect()->route('income.settings')->with('success', 'Income sub-category updated successfully.');
        } catch (\Exception $e) {
            return redirect()->route('income.settings')->with('error', 'Failed to update income sub-category. Please try again.');
        }
    }

    public function viewIncomeDetail($id)
    {
        try{
            $income = Income::with('category', 'subcategory', 'user')->findOrFail($id);
            $company = Company::first();
            return view('income.income-detail-view', compact('income', 'company'));
        } catch (\Exception $e) {
            return redirect()->route('incomes')->with('error', 'Failed to load income details. Please try again.');
        }
    }
}
