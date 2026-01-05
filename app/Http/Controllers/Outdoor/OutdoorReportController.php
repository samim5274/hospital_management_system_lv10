<?php

namespace App\Http\Controllers\Outdoor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Carbon\Carbon;

use App\Models\LabTest;
use App\Models\Doctor;
use App\Models\Reference;
use App\Models\PaymentDetail;
use App\Models\Company;
use App\Models\TicketSale;

class OutdoorReportController extends Controller
{
    public function outdoor(){
        $company = Company::first();
        $date = Carbon::today()->format('Y-m-d');

        // payment and patient
        $datas = PaymentDetail::with(['doctor','reference','user'])->where('date', $date)->get();
        $total = $datas->sum('total');
        $discount = $datas->sum('discount');
        $due = $datas->sum('due');
        $totalPay = $datas->sum('pay');

        $doctors = Doctor::all();
        $references = Reference::all();

        return view('patient.reports.date-wise-sale-report', compact(
            'company', 'datas','totalPay','total','discount','due',
            'doctors','references'
        ));
    }

    public function filterSale(Request $request){
        // Base query
        $query = PaymentDetail::with(['doctor','reference','user']);

        // 🔹 Date range filter
        if ($request->filled('startDate')) {
            $query->whereDate('date', '>=', $request->startDate);
        }
        if ($request->filled('endDate')) {
            $query->whereDate('date', '<=', $request->endDate);
        }

        // 🔹 Doctor filter
        if ($request->filled('doctor_id')) {
            $query->where('doctorId', $request->doctor_id);
        }

        // 🔹 Reference filter
        if ($request->filled('refer_id')) {
            $query->where('referId', $request->refer_id);
        }

        // Fetch data
        $datas = $query->orderBy('date', 'desc')->get();
        $total = $datas->sum('total');
        $discount = $datas->sum('discount');
        $due = $datas->sum('due');
        $totalPay = $datas->sum('pay');

        $doctors = Doctor::all();
        $references = Reference::all();
        $company = Company::first();

        if ($request->has('print')) {
            return view('patient.print.print-date-wise-sale-report', compact('datas','totalPay','total','discount','due','doctors','references','company'));
        }

        // Return to view
        return view('patient.reports.date-wise-sale-report', compact(
            'datas','totalPay','total','discount','due','doctors','references','company'
        ));
    }

    public function due() {
        $company = Company::first();
        $date = Carbon::today()->format('Y-m-d');

        // payment and patient
        $datas = PaymentDetail::with(['doctor','reference','user'])->where('duestatus', 1)->where('date', $date)->get();
        $total = $datas->sum('total');
        $discount = $datas->sum('discount');
        $due = $datas->sum('due');
        $totalPay = $datas->sum('pay');

        $doctors = Doctor::all();
        $references = Reference::all();

        return view('patient.reports.due-report', compact(
            'company', 'datas','totalPay','total','discount','due',
            'doctors','references'
        ));
    }

    public function filterDueSale(Request $request) {
        // Base query
        $query = PaymentDetail::with(['doctor','reference','user'])->where('duestatus', 1);

        // 🔹 Date range filter
        if ($request->filled('startDate')) {
            $query->whereDate('date', '>=', $request->startDate);
        }
        if ($request->filled('endDate')) {
            $query->whereDate('date', '<=', $request->endDate);
        }

        // 🔹 Doctor filter
        if ($request->filled('doctor_id')) {
            $query->where('doctorId', $request->doctor_id);
        }

        // 🔹 Reference filter
        if ($request->filled('refer_id')) {
            $query->where('referId', $request->refer_id);
        }

        // Fetch data
        $datas = $query->orderBy('date', 'desc')->get();
        $total = $datas->sum('total');
        $discount = $datas->sum('discount');
        $due = $datas->sum('due');
        $totalPay = $datas->sum('pay');

        $doctors = Doctor::all();
        $references = Reference::all();
        $company = Company::first();

        if ($request->has('print')) {
            return view('patient.print.print-date-wise-sale-due-report', compact('datas','totalPay','total','discount','due','doctors','references','company'));
        }

        // Return to view
        return view('patient.reports.due-report', compact(
            'company', 'datas','totalPay','total','discount','due',
            'doctors','references'
        ));
    }

    public function ticket() {
        $company = Company::first();
        $date = Carbon::today()->format('Y-m-d');

        // payment and patient
        $datas = TicketSale::with(['doctor','reference','user'])->where('date', $date)->get();
        $total = $datas->sum('total');
        $discount = $datas->sum('discount');
        $due = $datas->sum('due');
        $totalPay = $datas->sum('pay');

        $doctors = Doctor::all();
        $references = Reference::all();

        return view('patient.reports.ticket-sale-report', compact(
            'company', 'datas','totalPay','total','discount','due',
            'doctors','references'
        ));
    }

    public function filterTicket(Request $request){
        // Base query
        $query = TicketSale::with(['doctor','reference','user']);

        // 🔹 Date range filter
        if ($request->filled('startDate')) {
            $query->whereDate('date', '>=', $request->startDate);
        }
        if ($request->filled('endDate')) {
            $query->whereDate('date', '<=', $request->endDate);
        }

        // 🔹 Doctor filter
        if ($request->filled('doctor_id')) {
            $query->where('doctorId', $request->doctor_id);
        }

        // 🔹 Reference filter
        if ($request->filled('refer_id')) {
            $query->where('referId', $request->refer_id);
        }

        // 🔹 Due filter
        if ($request->filled('due_status')) {
            $query->where('duestatus', $request->due_status);
        }

        // Fetch data
        $datas = $query->orderBy('date', 'desc')->get();
        $total = $datas->sum('total');
        $discount = $datas->sum('discount');
        $due = $datas->sum('due');
        $totalPay = $datas->sum('pay');

        $doctors = Doctor::all();
        $references = Reference::all();
        $company = Company::first();

        if ($request->has('print')) {
            return view('patient.print.print-ticket-sale-report', compact('datas','totalPay','total','discount','due','doctors','references','company'));
        }

        // Return to view
        return view('patient.reports.ticket-sale-report', compact(
            'company', 'datas','totalPay','total','discount','due',
            'doctors','references'
        ));
    }
}
