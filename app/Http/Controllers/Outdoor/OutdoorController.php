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
use App\Models\StoreTest;
use App\Models\PaymentDetail;
use App\Models\Company;
use App\Models\Bed;
use App\Models\DutyDoctor;
use App\Models\Disease;
use App\Models\Patient;
use App\Models\TicketSale;

class OutdoorController extends Controller
{
    public function index(){
        $company = Company::first();
        $today = Carbon::today()->toDateString();
        $patientData = PaymentDetail::where('status', 1)->where('date', $today)->paginate(20);
        $collection = $patientData->getCollection();
        $total = $collection->sum('total');
        $discount = $collection->sum('discount');
        $payable = $collection->sum('payable');
        $pay = $collection->sum('pay');
        $due = $collection->sum('due');
        return view('patient.outdoor.patient-details', compact('patientData','total','discount', 'payable', 'pay', 'due', 'company'));
    }

    public function testDetails($invoice){
        $company = Company::first();
        $testData = StoreTest::with('test')->where('regNum', $invoice)->get();
        $patientData = PaymentDetail::where('reg', $invoice)->first();
        if($patientData == null || $testData->isEmpty()){
            return redirect()->back()->with('error', 'No patient data found for Invoice: ' . $invoice);
        }
        return view('patient.outdoor.patiend-invoice-details', compact('testData','patientData', 'company'));
    }

    public function outdoor(){
        $company = Company::first();
        $testDetails = LabTest::all();
        $doctor = Doctor::all();
        $refer = Reference::all();

        $userId = Auth::guard('admin')->user()->id; // fallback if not using admin guard
        $today = date('Y-m-d');
        $sl = PaymentDetail::where('status', 1)->where('date', $today)->where('userId', $userId)->count();
        $invoice = 'LAB' . date('Ymd') . $userId . ($sl + 1);

        $total = StoreTest::where('regNum', $invoice)->sum('testprice');
        return view('patient.outdoor.outdoor-details', compact('testDetails','doctor','refer','total', 'company'));
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
        $count = PaymentDetail::where('date', $today)->where('userId', $userId)->count() + 1;
        $invoice = 'LAB' . date('Ymd') . $userId . $count;
        // dd($userId, $today, $count, $invoice);

        // ---- Calculate totals ----
        $total = StoreTest::where('regNum', $invoice)->sum('testprice');
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
        $company = Company::first();
        return view('patient.print.print-patiend-test-details', compact('testData','patientData','company'));
    }

    public function cancelTestView(){
        $company = Company::first();
        $today = Carbon::today()->toDateString();
        $patientData = PaymentDetail::where('status', 1)->where('date', $today)->paginate(20);
        $cancelData = PaymentDetail::where('status', 0)->where('date', $today)->paginate(20);
        return view('patient.outdoor.cancel-test-view', compact('company', 'patientData', 'cancelData'));
    }

    public function cancelTestByReg($reg){
        // Delete payment detail
        $paymentDetail = PaymentDetail::where('reg', $reg)->first();
        if(!$paymentDetail){
            return redirect()->route('patients.test.cancel.view')->with('error', 'No payment detail found for REG: ' . $reg);
        }

        if($paymentDetail->due > 0){
            $paymentDetail->return = $paymentDetail->pay - $paymentDetail->due; // Refund the paid amount
        } else {
            $paymentDetail->return = $paymentDetail->pay; // Refund the paid amount
        }
        
        $paymentDetail->status = 0; // Mark as cancelled
        $paymentDetail->save();

        // Delete stored tests
        $storeTests = StoreTest::where('regNum', $reg)->get();
        if($storeTests->isEmpty()){
            return redirect()->route('patients.test.cancel.view')->with('error', 'No stored tests found for REG: ' . $reg);
        }

        $storeTests->each(function($test) {
            $test->status = 0;
            $test->save();
        });

        return redirect()->route('patients.test.cancel.view')->with('success', 'Test cancelled successfully for REG: ' . $reg);
    }

    
}
