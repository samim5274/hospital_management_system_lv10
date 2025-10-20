<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\LabTest;
use App\Models\Doctor;
use App\Models\Reference;
use App\Models\StoreTest;
use App\Models\PaymentDetail;
use App\Models\Company;
use App\Models\Bed;
use App\Models\DutyDoctor;
use App\Models\Disease;
use App\Models\Patient;

class PatientController extends Controller
{
    public function index(){
        $today = Carbon::today()->toDateString();
        $patientData = PaymentDetail::where('date', $today)->paginate(20);
        $total = PaymentDetail::where('date', $today)->sum('total');
        $discount = PaymentDetail::where('date', $today)->sum('discount');
        $payable = PaymentDetail::where('date', $today)->sum('payable');
        $pay = PaymentDetail::where('date', $today)->sum('pay');
        $due= PaymentDetail::where('date', $today)->sum('due');
        return view('patient.outdoor.patient-details', compact('patientData','total','discount', 'payable', 'pay', 'due'));
    }

    public function testDetails($invoice){
        $testData = StoreTest::with('test')->where('regNum', $invoice)->get();
        $patientData = PaymentDetail::where('reg', $invoice)->first();
        return view('patient.outdoor.patiend-invoice-details', compact('testData','patientData'));
    }

    public function outdoor(){
        $testDetails = LabTest::all();
        $doctor = Doctor::all();
        $refer = Reference::all();

        $userId = Auth::guard('admin')->user()->id; // fallback if not using admin guard
        $today = date('Y-m-d');
        $sl = PaymentDetail::where('date', $today)->count();
        $invoice = 'LAB' . date('Ymd') . $userId . ($sl + 1);

        $total = StoreTest::where('regNum', $invoice)->sum('testprice');
        return view('patient.outdoor.outdoor-details', compact('testDetails','doctor','refer','total'));
    }

    public function store(Request $request){
        
        $name     = $request->has('txtName') ? $request->get('txtName') : '';
        $dob      = $request->has('dtpDob') ? $request->get('dtpDob') : '';
        $gender   = $request->has('slcGender') ? $request->get('slcGender') : '';
        $phone    = $request->has('txtPhone') ? $request->get('txtPhone') : '';
        $address  = $request->has('txtAddress') ? $request->get('txtAddress') : '';
        $doctor   = $request->has('cbxDoctor') ? $request->get('cbxDoctor') : '';
        $refer    = $request->has('cbxRefer') ? $request->get('cbxRefer') : '';

        if (empty($doctor) || empty($name) || empty($dob) || empty($gender) || empty($phone) || empty($address)) {
            return redirect()->back()->with('error', 'Some information is missing. Please check and try again!');
        }

        $data = new PaymentDetail();

        $userId = Auth::guard('admin')->user()->id; // fallback if not using admin guard
        $today = date('Y-m-d');
        $sl = PaymentDetail::where('date', $today)->count();
        $invoice = 'LAB' . date('Ymd') . $userId . ($sl + 1);

        // ---- Calculate totals ----
        $total = StoreTest::where('regNum', $invoice)->sum('testprice');
        // dd($total);
        if ($total <= 0) {
            return redirect()->back()->with('error', 'Please add tests first before saving!');
        }

        $discount = $request->has('txtDiscount') ? (int) $request->get('txtDiscount') : 0;
        $payable = $total - $discount;
        $receivedAmount = $request->has('txtReceived') ? (int) $request->get('txtReceived') : 0;

        // ---- Payment logic ----
        if ($payable <= $receivedAmount) {
            $pay = $payable;
            $duestatus = 0;
            $due = 0;
        } else {
            $pay = $receivedAmount;
            $duestatus = 1;
            $due = $payable - $receivedAmount;
        }

        // ---- Save to DB ----
        $data->reg         = $invoice;
        $data->date        = $today;
        $data->name        = $name;
        $data->dob         = $dob;
        $data->gender      = $gender;
        $data->phone       = $phone;
        $data->address     = $address;
        $data->doctorId    = $doctor;
        $data->referId     = $refer;
        $data->total       = $total;
        $data->discount    = $discount;
        $data->payable     = $payable;
        $data->pay         = $pay;
        $data->duestatus   = $duestatus;
        $data->due         = $due;
        $data->return      = 0;
        $data->status      = 1;
        $data->userId      = $userId;

        $data->save();

        // ---- Return response ----
        return redirect()->back()->with('success', 'Test Sale successfully saved! REG: ' . $invoice)->with('invoice', $invoice);
    }

    public function printInvoice($invoice){
        $testData = StoreTest::with('test')->where('regNum', $invoice)->get();
        $patientData = PaymentDetail::where('reg', $invoice)->first();
        $company = Company::all();
        return view('patient.print.print-patiend-test-details', compact('testData','patientData','company'));
    }

}
