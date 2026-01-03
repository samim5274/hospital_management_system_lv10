<?php

namespace App\Http\Controllers\Ticket;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Carbon\Carbon;

use App\Models\Doctor;
use App\Models\Reference;
use App\Models\Company;
use App\Models\TicketSale;

class TicketController extends Controller
{
    public function ticketSale(){
        $company = Company::first();
        $doctors = Doctor::all();
        $refers = Reference::all();
        $patients = TicketSale::with(['doctor','reference','user',])->where('date', Carbon::now()->format('Y-m-d'))->orderBy('id', 'desc')->get();
        return view('patient.outdoor.ticket-sale', compact('company','doctors','refers','patients'));
    }

    public function ticketSaleStore(Request $request){
        // Validation
        $request->validate([
            'txtName'      => 'required|string|max:255',
            'dtpDob'       => 'required|date',
            'slcGender'    => 'required|in:Male,Female,Other',
            'txtPhone'     => 'required|digits_between:10,15',
            'txtAddress'   => 'required|string',
            'cbxDoctor'    => 'required|exists:doctors,id',
            'cbxRefer'     => 'nullable|exists:references,id',
            'txtDiscount'  => 'required|numeric|min:0',
            'txtReceived'  => 'required|numeric|min:0',
        ]);

        

        try{
            $doctorFee = Doctor::findOrFail($request->cbxDoctor)->fees;

            $total     = $doctorFee;
            $discount  = $request->txtDiscount;
            $payable   = $total - $discount;
            $pay       = $request->txtReceived;
            $due       = max($payable - $pay, 0);

            $duestatus = $due > 0 ? '0' : '1'; // 1 = Active & 0 = Inactive

            // Generate Receipt & Invoice
            do { $reg = strtoupper(Str::random(12)); }
            while (TicketSale::where('reg', $reg)->exists());

            $data = new TicketSale();
            $data->reg        = $reg;
            $data->date       = Carbon::now()->format('Y-m-d');
            $data->name       = $request->txtName;
            $data->dob        = $request->dtpDob;
            $data->gender     = $request->slcGender;
            $data->phone      = $request->txtPhone;
            $data->address    = $request->txtAddress;
            $data->doctor_id  = $request->cbxDoctor;
            $data->refer_id   = $request->cbxRefer;
            $data->total      = $total;
            $data->discount   = $discount;
            $data->payable    = $payable;
            $data->pay        = $pay;
            $data->due        = $due;
            $data->duestatus  = $duestatus;
            $data->return     = $pay > $payable ? $pay - $payable : 0;
            $data->status     = 1;
            $data->user_id    = Auth::guard('admin')->user()->id;
            $data->save();
            return redirect()->back()->with('success', 'Ticket sold successfully!'); 
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while saleing the ticket.');
        }
    }

    public function printTicket($reg){
        $patient = TicketSale::where('reg', $reg)->firstOrFail();
        $company = Company::first();
        return view('patient.print.print-ticket-sale', compact('company', 'patient'));
    }

    public function printPaymentInvoice($reg){
        $patient = TicketSale::where('reg', $reg)->firstOrFail();
        $company = Company::first();
        return view('patient.print.print-ticket-payment-invoice', compact('company', 'patient'));
    }
}
