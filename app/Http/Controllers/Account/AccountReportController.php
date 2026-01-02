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
        $company = Company::first();

        $startDate = $request->start_date;
        $endDate = $request->end_date;

        // Dropdown category list
        $inCategories = IncomeCategory::all();

        // Base query
        $query = Income::with(['category', 'subcategory', 'user']);

        // ================= Date Filter =================
        if ($request->filled('start_date') && $request->filled('end_date')) {
            $query->whereBetween('date', [$startDate, $endDate]);
        } elseif ($request->filled('start_date')) {
            $query->whereDate('date', '>=', $startDate);
        } elseif ($request->filled('end_date')) {
            $query->whereDate('date', '<=', $endDate);
        }

        // ================= Category Filter =================
        if ($request->filled('category_id')) {
            $query->where('category_id', $request->category_id);
        }

        // ================= Sub Category Filter =================
        if ($request->filled('subcategory_id')) {
            $query->where('subcategory_id', $request->subcategory_id);
        }

        // ================= User Filter (optional) =================
        if ($request->filled('user_id')) {
            $query->where('user_id', $request->user_id);
        }

        // ================= Fetch Data =================
        $inDetails = $query->orderBy('date', 'desc')->get();

        // ================= Total Amount =================
        $totalAmount = $inDetails->sum('amount');

        // ================= Print View =================
        if ($request->filled('print')) {
            return view('income.print.print-income-report', compact(
                'company',
                'inCategories',
                'inDetails',
                'totalAmount',
                'request',
                'startDate',
                'endDate',
            ));
        }

        // ================= Normal View =================
        return view('income.report.income-report', compact(
            'company',
            'inCategories',
            'inDetails',
            'totalAmount',
            'request'
        ));
    }

    public function bankReport(){
        $date = Carbon::now()->format('Y-m-d');
        $company = Company::first();

        // Banking section
        $banks = BankDetail::all();
        $transactions = BankTransectionDetail::with(['bank','user'])->where('date', $date)->get();

        $totalDepositAll  = $transactions->where('status', 'deposit')->sum('amount');
        $totalWithdrawAll = $transactions->where('status', 'withdraw')->sum('amount');
        $totalBalanceAll  = $totalDepositAll - $totalWithdrawAll;

        return view('bank.report.bank-report', compact('company','banks','transactions','totalDepositAll','totalWithdrawAll','totalBalanceAll'));
    }

    public function bankDataFilter(Request $request){
        $company = Company::first();

        $startDate = $request->start_date;
        $endDate = $request->end_date;

        // Bank list for dropdown
        $banks = BankDetail::all();

        // Base query
        $query = BankTransectionDetail::with(['bank', 'user']);

        // ================= Date Filter =================
        if ($request->filled('start_date') && $request->filled('end_date')) {
            $query->whereBetween('date', [$startDate, $endDate]);
        } elseif ($request->filled('start_date')) {
            $query->whereDate('date', '>=', $startDate);
        } elseif ($request->filled('end_date')) {
            $query->whereDate('date', '<=', $endDate);
        }

        // ================= Bank Filter =================
        if ($request->filled('bank_id')) {
            $query->where('bank_id', $request->bank_id);
        }

        // ================= Status Filter =================
        if ($request->filled('status')) {
            $query->where('status', $request->status); // deposit / withdraw
        }

        // ================= User Filter (Optional) =================
        if ($request->filled('user_id')) {
            $query->where('user_id', $request->user_id);
        }

        // ================= Get Data =================
        $transactions = $query->orderBy('date', 'desc')->get();

        // ================= Total Amount =================
        $totalDepositAll  = $transactions->where('status', 'deposit')->sum('amount');
        $totalWithdrawAll = $transactions->where('status', 'withdraw')->sum('amount');
        $totalBalanceAll  = $totalDepositAll - $totalWithdrawAll;

        // ================= Print View =================
        if ($request->filled('print')) {
            return view('bank.print.print-bank-report', compact(
                'company',
                'banks',
                'transactions',
                'request',
                'totalDepositAll',
                'totalWithdrawAll',
                'totalBalanceAll',
                'startDate',
                'endDate',
            ));
        }

        // ================= Normal View =================
        return view('bank.report.bank-report', compact(
            'company',
            'banks',
            'transactions',
            'request',
            'totalDepositAll',
            'totalWithdrawAll',
            'totalBalanceAll'
        ));
    }
}
