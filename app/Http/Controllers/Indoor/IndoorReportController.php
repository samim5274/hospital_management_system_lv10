<?php

namespace App\Http\Controllers\Indoor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;
use Carbon\Carbon;

use App\Models\LabTest;
use App\Models\Doctor;
use App\Models\Reference;
use App\Models\Company;
use App\Models\StoreTest;
use App\Models\Bed;
use App\Models\DutyDoctor;
use App\Models\Disease;
use App\Models\AdmissionPatient;
use App\Models\AdmissionBillSummary;

class IndoorReportController extends Controller
{
    public function indoor(){
        $company = Company::first();
        $date = Carbon::today()->format('Y-m-d');
        
        $indoorPatients = AdmissionPatient::orderBy('id','desc')->get();
        return view('patient.reports.indoor-admit-patient-view', compact('company','indoorPatients'));
    }

    public function filterAdmin(Request $request){
        $company = Company::first();
        $startDate = $request->start_date ?? $today;
        $endDate   = $request->end_date ?? $today;

        $indoorPatients = AdmissionPatient::whereDate('bed_booked_date', '>=', $startDate)
                                         ->whereDate('bed_booked_date', '<=', $endDate)
                                         ->orderBy('id', 'desc')
                                         ->get();

        if ($request->has('print')) {
            return view('patient.print.print-indoor-admit-patient-view', compact('indoorPatients','company','startDate','endDate'));
        }

        return view('patient.reports.indoor-admit-patient-view', compact('company','indoorPatients'));
    }
}
