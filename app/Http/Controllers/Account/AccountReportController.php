<?php

namespace App\Http\Controllers\Account;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use App\Models\Company;

use App\Models\ExpensesCategory;
use App\Models\ExpensesSubCategory;
use App\Models\ExpensesDetails;

use App\Models\BankDetail;
use App\Models\BankTransectionDetail;

use App\Models\Income;
use App\Models\IncomeCategory;
use App\Models\IncomeSubCategory;

class AccountReportController extends Controller
{
    public function expensesReport(){
        $date = Carbon::now()->format('Y-m-d');
        $company = Company::first();

        // Expenses section
        $exCategories = ExpensesCategory::all();
        $exSubCategories = ExpensesSubCategory::with('category')->get();
        $exDetails = ExpensesDetails::with(['category','subcategory','user'])->where('date', $date)->get();

        // Income section
        // $inCategories = IncomeCategory::all();
        // $inSubCategories = IncomeSubCategory::with('category')->get();
        // $inDetails = Income::with(['category','subcategory','user'])->where('date', $date)->get();

        // // Banking section
        // $banks = BankDetail::all();
        // $transections = BankTransectionDetail::with(['bank','user'])->where('date', $date)->get();

        // $totalDepositAll  = $transections->where('status', 'deposit')->sum('amount');
        // $totalWithdrawAll = $transections->where('status', 'withdraw')->sum('amount');
        // $totalBalanceAll  = $totalDepositAll - $totalWithdrawAll;

        return view('expenses.report.expenses-report', compact(
            'company',
            'exCategories',
            'exSubCategories',
            'exDetails'
        ));
    }

    public function expensesDataFilter(Request $request){
        $company = Company::first();
        $exCategories = ExpensesCategory::all();

        // Default date (today)
        $startDate = $request->start_date ?? Carbon::today()->toDateString();
        $endDate   = $request->end_date ?? Carbon::today()->toDateString();

        $query = ExpensesDetails::with(['category', 'subcategory', 'user']);

        // 📅 Date filter
        if ($request->filled('start_date') && $request->filled('end_date')) {
            $query->whereBetween('date', [$startDate, $endDate]);
        }

        // 📂 Category filter
        if ($request->filled('category_id')) {
            $query->where('category_id', $request->category_id);
        }

        // 📁 Sub Category filter
        if ($request->filled('sub_category_id')) {
            $query->where('sub_category_id', $request->sub_category_id);
        }

        $exDetails = $query->orderBy('date', 'desc')->get();

        // 💰 Total Amount
        $totalAmount = $exDetails->sum('amount');

        // 🖨 Print mode
        if ($request->print == 1) {
            return view('expenses.print.print-expenses-report', compact(
                'company',
                'exDetails',
                'startDate',
                'endDate',
                'totalAmount'
            ));
        }

        return view('expenses.report.expenses-report', compact(
            'company',
            'exCategories',
            'exDetails',
            'totalAmount'
        ));
    }

    public function incomeReport(){
        $date = Carbon::now()->format('Y-m-d');
        $company = Company::first();

        // Income section
        $inCategories = IncomeCategory::all();
        $inSubCategories = IncomeSubCategory::with('category')->get();
        $inDetails = Income::with(['category','subcategory','user'])->where('date', $date)->get();

        return view('income.report.income-report', compact(
            'company',
            'inCategories',
            'inSubCategories',
            'inDetails'
        ));
    }

    public function incomeDataFilter(Request $request){
        // $company = Company::first();

        // $inCategories = IncomeCategory::all(); // categories for dropdown

        // // Start query
        // $query = Income::with(['category', 'subcategory', 'user']);

        // // Filter by date range
        // if ($request->start_date && $request->end_date) {
        //     $query->whereBetween('date', [$request->start_date, $request->end_date]);
        // } elseif ($request->start_date) {
        //     $query->where('date', '>=', $request->start_date);
        // } elseif ($request->end_date) {
        //     $query->where('date', '<=', $request->end_date);
        // }

        // // Filter by category
        // if ($request->category_id) {
        //     $query->where('category_id', $request->category_id);
        // }

        // // Filter by subcategory
        // if ($request->sub_category_id) {
        //     $query->where('sub_category_id', $request->sub_category_id);
        // }

        // $inDetails = $query->orderBy('date', 'desc')->get();

        // $totalAmount = $inDetails->sum('amount');

        // // If print requested
        // if ($request->print) {
        //     return view('income.print.income-report', compact(
        //         'company',
        //         'inCategories',
        //         'inDetails',
        //         'totalAmount',
        //         'request' // pass request to show date/category filter in print
        //     ));
        // }

        // // Otherwise, normal view
        // return view('income.report.income-report', compact(
        //     'company',
        //     'inCategories',
        //     'inDetails',
        //     'totalAmount',
        //     'request'
        // ));
    }
}
