<?php

namespace App\Http\Controllers\Bank;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;

use Auth;
use App\Models\BankDetail;
use App\Models\BankTransectionDetail;
use App\Models\Company;

class BankController extends Controller
{
    public function index(){
        $company = Company::first();
        $banks = BankDetail::all();
        return view('bank.bank-details', compact('company','banks'));
    }

    public function bankStore(Request $request){
        $request->validate([
            'bank_name'      => 'required|string|max:255',
            'branch_name'    => 'required|string|max:255',
            'account_name'   => 'required|string|max:255',
            'account_number' => 'required|string|max:50|unique:bank_details,account_number', // <--- ঠিক করলুম
            'routing_number' => 'nullable|string|max:50',
            'remarks'        => 'nullable|string|max:500',
        ]);

        $data = new BankDetail();
        
        try{
            $data->bank_name        = $request->bank_name;
            $data->branch_name      = $request->branch_name;
            $data->account_name     = $request->account_name;
            $data->account_number   = $request->account_number;
            $data->routing_number   = $request->routing_number;
            $data->remarks          = $request->remarks ?? "N/A";
            $data->save();
            return redirect()->back()->with('success', 'Bank account added successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while adding the Bank details.');
        }
    }

    public function deleteBank($id){
        try {
            $data = BankDetail::findOrFail($id);
            $data->delete();
            return redirect()->back()->with('success', 'Bank account DELETE successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while deleting the Bank details.');
        }
    }

    public function editBank(Request $request, $id){
        $bank = BankDetail::findOrFail($id);

        $request->validate([
            'bank_name'      => 'required|string|max:255',
            'branch_name'    => 'required|string|max:255',
            'account_name'   => 'required|string|max:255',
            'account_number' => 'required|string|max:50|unique:bank_details,account_number,' . $bank->id, // ignore current record
            'routing_number' => 'nullable|string|max:50',
            'remarks'        => 'nullable|string|max:500',
        ]);

        try {
            $bank->bank_name      = $request->bank_name;
            $bank->branch_name    = $request->branch_name;
            $bank->account_name   = $request->account_name;
            $bank->account_number = $request->account_number;
            $bank->routing_number = $request->routing_number;
            $bank->remarks        = $request->remarks ?? "N/A";
            $bank->save();

            return redirect()->back()->with('success', 'Bank account updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while updating the bank details.');
        }
    }

    public function transection(){
        $company = Company::first();
        $banks = BankDetail::with('transection')->get();
        $date = Carbon::now()->format('Y-m-d');
        $transactions = BankTransectionDetail::with(['bank', 'user'])
                            ->whereDate('date', $date)
                            ->orderBy('id', 'desc')
                            ->get();
       

        $totalDepositAll  = $transactions->where('status', 'deposit')->sum('amount');
        $totalWithdrawAll = $transactions->where('status', 'withdraw')->sum('amount');
        $totalBalanceAll  = $totalDepositAll - $totalWithdrawAll;

        return view('bank.transection-details', compact(
            'company',
            'banks',
            'transactions',
            'totalDepositAll',
            'totalWithdrawAll',
            'totalBalanceAll'
        ));
    }

    public function storeDiposit(Request $request){
        // Validation
        $request->validate([
            'bank_id' => 'required|exists:bank_details,id',
            'amount'  => 'required|numeric|min:0.01',
            'remarks' => 'nullable|string|max:500',
        ]);

        try {
            BankTransectionDetail::create([
                'bank_id'  => $request->bank_id,
                'user_id'  => Auth::guard('admin')->user()->id,
                'amount'   => $request->amount,
                'date'     => Carbon::now(),          // current date-time
                'status'   => 'deposit',           // // e.g., 'deposit', 'withdrawal'
                'remarks'  => $request->remarks ?? ' (Deposit)',
            ]);

            return redirect()->back()->with('success', 'Money deposited successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while depositing money.');
        }
    }

    public function storeWithdraw(Request $request){
        // Validation
        $request->validate([
            'bank_id' => 'required|exists:bank_details,id',
            'amount'  => 'required|numeric|min:0.01',
            'remarks' => 'nullable|string|max:500',
        ]);

        try {

            $bankId = $request->bank_id;
            $withdrawAmount = $request->amount;

            // Calculate current balance
            $totalDeposit = BankTransectionDetail::where('bank_id', $bankId)
                                ->where('status', 'deposit')
                                ->sum('amount');

            $totalWithdraw = BankTransectionDetail::where('bank_id', $bankId)
                                ->where('status', 'withdraw')
                                ->sum('amount');

            $currentBalance = $totalDeposit - $totalWithdraw;

            if ($withdrawAmount > $currentBalance) {
                return redirect()->back()->with('error', 'Insufficient balance. Current balance: ৳ '.number_format($currentBalance, 2).' tk');
            }

            BankTransectionDetail::create([
                'bank_id'  => $request->bank_id,
                'user_id'  => Auth::guard('admin')->user()->id,
                'amount'   => $request->amount,
                'date'     => Carbon::now(),          // current date-time
                'status'   => 'withdraw',           // // e.g., 'deposit', 'withdrawal'
                'remarks'  => $request->remarks ?? ' (Withdraw)',
            ]);

            return redirect()->back()->with('success', 'Money withdrawal successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while withdrawing money.');
        }
    }

    public function printTransection($id){
        $company = Company::first();
        $transaction = BankTransectionDetail::findOrFail($id);
        return view('bank.print.print-transection', compact('transaction', 'company'));
    }

    public function printTotalTransection(){
        $date = Carbon::now()->format('Y-m-d');
        $company = Company::first();
        $transactions = BankTransectionDetail::with(['bank','user'])->where('date', $date)->get();
        return view('bank.print.print-total-transection', compact('transactions', 'company'));
    }

    public function summary(){
        $company = Company::first();
        $banks = BankDetail::with('transection')->get();
        $date = Carbon::now()->format('Y-m-d');

        // Prepare bank summaries (total deposit, withdraw, balance)
        $bankSummaries = $banks->map(function ($bank) {
            $totalDeposit  = $bank->transection->where('status', 'deposit')->sum('amount');
            $totalWithdraw = $bank->transection->where('status', 'withdraw')->sum('amount');
            $balance       = $totalDeposit - $totalWithdraw;

            return [
                'id'            => $bank->id,
                'bank_name'     => $bank->bank_name,
                'branch_name'   => $bank->branch_name,
                'account_number'=> $bank->account_number,
                'totalDeposit'  => $totalDeposit,
                'totalWithdraw' => $totalWithdraw,
                'balance'       => $balance,
            ];
        });

        return view('bank.transection-summary', compact(
            'company',
            'banks',
            'bankSummaries',
        ));
    }

    public function bankTransection($id){
        $company = Company::first();
        $transections = BankTransectionDetail::with(['bank','user'])->where('bank_id', $id)->get();

        $totalDepositAll  = $transections->where('status', 'deposit')->sum('amount');
        $totalWithdrawAll = $transections->where('status', 'withdraw')->sum('amount');
        $totalBalanceAll  = $totalDepositAll - $totalWithdrawAll;


        return view('bank.bank-transection', compact(
            'company',
            'transections',
            'totalDepositAll',
            'totalWithdrawAll',
            'totalBalanceAll',
        ));
    }

    public function printBankTotalTransection($id){
        $company = Company::first();
        $transections = BankTransectionDetail::with(['bank','user'])->where('bank_id', $id)->get();

        $totalDepositAll  = $transections->where('status', 'deposit')->sum('amount');
        $totalWithdrawAll = $transections->where('status', 'withdraw')->sum('amount');
        $totalBalanceAll  = $totalDepositAll - $totalWithdrawAll;


        return view('bank.print.print-bank-transection', compact(
            'company',
            'transections',
            'totalDepositAll',
            'totalWithdrawAll',
            'totalBalanceAll',
        ));
    }
}
