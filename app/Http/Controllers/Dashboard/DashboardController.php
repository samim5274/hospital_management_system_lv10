<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

use Auht;
use App\Models\Company;
use App\Models\StoreTest;
use App\Models\PaymentDetail;
use App\Models\TicketSale;
use App\Models\ExpensesDetails;
use App\Models\Income;
use App\Models\BankTransectionDetail;
use App\Models\AdmissionBillSummary;


class DashboardController extends Controller
{
    public function index(){
        $company = Company::first();
        $date = Carbon::now()->format('Y-m-d');

        $totalTestSale = PaymentDetail::where('date', $date)->sum('pay');
        $totalTicketSale = TicketSale::where('date', $date)->sum('pay');
        $totalExpenses = ExpensesDetails::where('date', $date)->sum('amount');
        $totalIncome = Income::where('date', $date)->sum('amount');

        $bankTransection = BankTransectionDetail::where('date', $date)->get();
        $totalBankDiposit = $bankTransection->where('status', 'deposit')->sum('amount');
        $totalBankWithdraw = $bankTransection->where('status', 'withdraw')->sum('amount');
        $totalBankBalance = $totalBankDiposit - $totalBankWithdraw;

        $totalIndoorPayment = AdmissionBillSummary::where('billing_date', $date)->sum('paid_amount');

        // for chart
        $genderChart = PaymentDetail::where('date', $date)->get();
        $male = $genderChart->where('gender', 'Male')->count();
        $female = $genderChart->where('gender', 'Female')->count();

        // Current year
        $year = Carbon::now()->year;
        $monthlySales = [];
        for ($month = 1; $month <= 12; $month++) {
            $total = PaymentDetail::whereYear('date', $year)
                        ->whereMonth('date', $month)
                        ->sum('pay'); 
            $monthlySales[] = $total;
        }

        return view('welcome', compact('company',
            'totalTestSale', 'totalTicketSale','totalExpenses','totalIncome',
            'totalBankDiposit','totalBankWithdraw','totalBankBalance', 'totalIndoorPayment',
            'male','female',
            'monthlySales', 'year',
        ));
    }
}
