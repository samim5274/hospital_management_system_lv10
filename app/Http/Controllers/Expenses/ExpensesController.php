<?php

namespace App\Http\Controllers\Expenses;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use App\Models\ExpensesCategory;
use App\Models\ExpensesSubCategory;
use App\Models\ExpensesDetails;
use App\Models\Company;

class ExpensesController extends Controller
{
    public function index()
    {
        $company = Company::first();
        $excategories = ExpensesCategory::all();
        $exsubcategories = ExpensesSubCategory::all();
        $expenses = ExpensesDetails::with(['category', 'subcategory', 'user'])->orderBy('id', 'desc')->get();
        return view('expenses.expenses-details', compact('company', 'excategories', 'exsubcategories', 'expenses'));
    }

    public function getExSubcategories($category_id)
    {
        $subcategories = ExpensesSubCategory::where('category_id', $category_id)->select('id', 'name')->get();
        return response()->json($subcategories);
    }

    public function storeExpenses(Request $request)
    {
        $request->validate([
            'category_id' => 'required',
            'sub_category_id' => 'required',
            'title' => 'required',
            'amount' => 'required|numeric',
        ]);

        $data = new ExpensesDetails();
        $data->category_id = $request->category_id;
        $data->sub_category_id = $request->sub_category_id;
        $data->user_id = Auth::guard('admin')->user()->id;
        $data->title = $request->title;
        $data->date = Carbon::now()->format('Y-m-d');
        $data->amount = $request->amount;
        $data->remark = $request->remark?? 'N/A';
        $data->save();
        return redirect()->back()->with('success', 'Expense added successfully.');
    }

    public function deleteExpense($id)
    {
        try{
            $expense = ExpensesDetails::findOrFail($id);
            // $expense->delete();
            return redirect()->back()->with('success', 'Expense deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while deleting the expense.');
        }
    }

    public function editExpenses(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'required',
            'sub_category_id' => 'required',
            'title' => 'required',
            'amount' => 'required|numeric',
        ]);

        $data = ExpensesDetails::findOrFail($id);
        $data->category_id = $request->category_id;
        $data->sub_category_id = $request->sub_category_id;
        $data->user_id = Auth::guard('admin')->user()->id;
        $data->title = $request->title;
        $data->date = Carbon::now()->format('Y-m-d');
        $data->amount = $request->amount;
        $data->remark = $request->remark . ' (Edited)';
        $data->save();
        return redirect()->back()->with('success', 'Expense updated successfully.');
    }

    public function printExpense($id)
    {
        $company = Company::first();
        $expense = ExpensesDetails::with(['category', 'subcategory', 'user'])->findOrFail($id);
        return view('expenses.print.print-expenses', compact('company', 'expense'));
    }

    public function viewExpenseDetail($id)
    {
        $company = Company::first();
        $expense = ExpensesDetails::with(['category', 'subcategory', 'user'])->findOrFail($id);
        return view('expenses.expenses-view-details', compact('company', 'expense'));
    }

    public function settings()
    {
        $company = Company::first();
        $categories = ExpensesCategory::all();
        $subcategories = ExpensesSubCategory::with('category')->get();
        return view('expenses.expenses-settings', compact('company', 'categories', 'subcategories'));
    }

    public function storeCategory(Request $request)
    {
        $request->validate([
            'name' => 'required|unique:expenses_categories,name',
        ]);

        $category = new ExpensesCategory();
        $category->name = $request->name;
        $category->save();
        return redirect()->back()->with('success', 'Expense category added successfully.');
    }

    public function editCategory(Request $request, $id)
    {
        $request->validate([
            'name' => 'required|unique:expenses_categories,name,'.$id,
        ]);

        $category = ExpensesCategory::findOrFail($id);
        $category->name = $request->name;
        $category->save();
        return redirect()->back()->with('success', 'Expense category updated successfully.');
    }

    public function deleteCategory($id)
    {
        try{
            $category = ExpensesCategory::findOrFail($id);
            $category->delete();
            return redirect()->back()->with('success', 'Expense category deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Cannot delete category. It may be associated with existing expenses or sub-categories.');
        }
    }

    public function storeSubCategory(Request $request)
    {
        $request->validate([
            'category_id' => 'required',
            'name' => 'required|unique:expenses_sub_categories,name',
        ]);

        $subcategory = new ExpensesSubCategory();
        $subcategory->category_id = $request->category_id;
        $subcategory->name = $request->name;
        $subcategory->save();
        return redirect()->back()->with('success', 'Expense sub-category added successfully.');
    }

    public function editSubCategory(Request $request, $id)
    {
        $request->validate([
            'category_id' => 'required',
            'name' => 'required|unique:expenses_sub_categories,name,'.$id,
        ]);

        $subcategory = ExpensesSubCategory::findOrFail($id);
        $subcategory->category_id = $request->category_id;
        $subcategory->name = $request->name;
        $subcategory->save();
        return redirect()->back()->with('success', 'Expense sub-category updated successfully.');
    }

    public function deleteSubCategory($id)
    {
        try{
            $subcategory = ExpensesSubCategory::findOrFail($id);
            $subcategory->delete();
            return redirect()->back()->with('success', 'Expense sub-category deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'Cannot delete sub-category. It may be associated with existing expenses.');
        }
    }
}
