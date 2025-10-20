<?php

namespace App\Http\Controllers\Indoor;

use App\Http\Controllers\Controller;
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
use App\Models\AdmissionPatient;
use App\Models\AdmissionBillSummary;

class IndoorController extends Controller
{
    public function index(){
        $indoorPatients = AdmissionPatient::where('status', 1)->orderBy('id','desc')->paginate(15); // 1 admit, 2 discharge, 3 cancel
        return view('patient.indoor.admit-patient-view', compact('indoorPatients'));
    }

    public function indoor(){
        $beds = Bed::where('status', 'available')->get();
        $refer = Reference::all();
        $doctors = Doctor::all();
        $dutyDoctors = DutyDoctor::all();
        $diseases = Disease::all();
        $patients = AdmissionPatient::all();
        return view('patient.indoor.admit-patient', compact('beds','refer','doctors','dutyDoctors','diseases','patients'));
    }

    public function admit(Request $request){
        $validatedData = $request->validate([
            // Patient Information
            'txtName' => 'required|string|max:255',
            'dtpDob' => 'required',
            'cbxGender' => 'required|in:Male,Female,Other',
            'txtPhone' => 'required|numeric|digits_between:10,15',
            'txtFatherHusband' => 'nullable|string|max:255',
            'txtGuardian' => 'required|string|max:255',
            'txtAddres' => 'required|string|max:500',
            'cbxReligion' => 'nullable|in:Islam,Hindu,Christian,Buddhism,Other',
            'txtNID' => 'required|string|max:20',

            // Contract and Medical Info
            'contractType' => 'required|in:Contract,NonContract',
            'procedureType' => 'required|in:Operative,Conservative',
            'medicinePackage' => 'required|in:Package,nonPackage',

            // Treatment & Assignment
            'cbxRefer' => 'required',
            'cbxTreatmentUnder' => 'required',
            'cbxDutyDoctor' => 'required',
            'cbxDiseas' => 'required',
            'txtNurse' => 'nullable|string|max:255',

            // Bed Booking
            'dtpBedBookedDate' => 'required|date',
            'cbxBed' => 'required',
            'txtBedCost' => 'required|numeric|min:0',
        ]);

        $userId = Auth::guard('admin')->user()->id; // fallback if not using admin guard
        $today = date('Y-m-d');
        $sl = AdmissionPatient::count();
        $invoice = 'IND-' . date('Ymd') . $userId . ($sl + 1);

        // Save to database
        $patient = new AdmissionPatient();

        $patient->reg                = $invoice;
        $patient->name               = $request->input('txtName', '');
        $patient->dob                = $request->input('dtpDob', '');
        $patient->gender             = $request->input('cbxGender', '');
        $patient->mobile             = $request->input('txtPhone', '');
        $patient->father_husband     = $request->input('txtFatherHusband', '');
        $patient->guardian           = $request->input('txtGuardian', '');
        $patient->address            = $request->input('txtAddres', '');
        $patient->religion           = $request->input('cbxReligion', '');
        $patient->nid                = $request->input('txtNID', '');
        $patient->contract_type      = $request->input('contractType', '0');
        $patient->contract_amount    = $request->input('contractAmount', 0);
        $patient->procedure_type     = $request->input('procedureType', '');
        $patient->medicine_package   = $request->input('medicinePackage', '');
        $patient->refer_id           = $request->input('cbxRefer', null);
        $patient->treatment_under_id = $request->input('cbxTreatmentUnder', null);
        $patient->duty_doctor_id     = $request->input('cbxDutyDoctor', null);
        $patient->disease_id         = $request->input('cbxDiseas', null);
        $patient->duty_nurse         = $request->input('txtNurse', '');
        $patient->bed_booked_date    = $request->input('dtpBedBookedDate', '');
        $patient->bed_id             = $request->input('cbxBed', null);
        $patient->bed_cost           = $request->input('txtBedCost', 0);
        $patient->user_id = Auth::guard('admin')->user()->id; // Logged in user

        $bedData = Bed::where('id', $request->input('cbxBed', null))->first();
        $bedData->status = "booked";
        
        $patient->save();
        $bedData->update();
        return redirect()->back()->with('success', 'Patient admitted successfully!')->with('reg', $invoice);
    }

    public function edit($id){
        $patient = AdmissionPatient::where('id', $id)->first(); // dd($patient);

        if(empty($patient)){
            return redirect()->back()->with('warning', 'Patient not found. Please try another patient. Thank you!');
        }

        $beds = Bed::where('status', 'available')->get(); 
        $refer = Reference::all();
        $doctors = Doctor::all();
        $dutyDoctors = DutyDoctor::all();
        $diseases = Disease::all();
        return view('patient.indoor.admit-patient-edit', compact('patient','beds','refer','doctors','dutyDoctors','diseases'));
    }

    public function printConcern($id){
        $patient = AdmissionPatient::where('id', $id)->first();
        if(empty($patient)){
            return redirect()->back()->with('warning', 'Patient not found. Please try again. Thank You!');
        }
        $company = Company::first();
        return view('patient.print.print-concern', compact('patient', 'company'));
    }

    public function modify(Request $request, $id){
        $patient = AdmissionPatient::where('id', $id)->first();

        if(empty($patient)){
            return redirect()->back()->with('warning', 'Patient not found. Please try another patient. Thank you!');
        }
        
        $name               = $request->input('txtName', '');
        $dob                = $request->input('dtpDob', '');
        $gender             = $request->input('cbxGender', '');
        $mobile             = $request->input('txtPhone', '');
        $father_husband     = $request->input('txtFatherHusband', '');
        $guardian           = $request->input('txtGuardian', '');
        $address            = $request->input('txtAddres', '');
        $religion           = $request->input('cbxReligion', '');
        $nid                = $request->input('txtNID', '');
        $contract_type      = $request->input('contractType', '');
        $contract_amount    = $request->input('contractAmount', 0);
        $procedure_type     = $request->input('procedureType', '');
        $medicine_package   = $request->input('medicinePackage', '');
        $refer_id           = $request->input('cbxRefer', null);
        $treatment_under_id = $request->input('cbxTreatmentUnder', null);
        $duty_doctor_id     = $request->input('cbxDutyDoctor', null);
        $disease_id         = $request->input('cbxDiseas', null);
        $duty_nurse         = $request->input('txtNurse', '');
        $bed_booked_date    = $request->input('dtpBedBookedDate', '');
        $bed_id             = $request->input('cbxBed', null);
        $bed_cost           = $request->input('txtBedCost', 0);

        // Step 3: Validation
        $fields = compact(
            'name', 'dob', 'gender', 'mobile', 'father_husband', 'guardian', 
            'address', 'religion', 'nid', 'contract_type', 'contract_amount', 
            'procedure_type', 'medicine_package', 'refer_id', 'treatment_under_id', 
            'duty_doctor_id', 'disease_id', 'duty_nurse', 'bed_booked_date', 
            'bed_id', 'bed_cost'
        );

        $requiredFields = [
            'name', 'dob', 'gender', 'mobile', 'father_husband', 'guardian', 
            'address', 'religion', 'nid', 'contract_type', 'procedure_type', 
            'medicine_package', 'refer_id', 'treatment_under_id', 'duty_doctor_id', 
            'disease_id', 'duty_nurse', 'bed_booked_date', 'bed_id'
        ];

        foreach ($requiredFields as $field) {
            if (empty($fields[$field])) {
                return redirect()->back()->with('error', 'Some information is missing. Please fill all required fields and try again.');
            }
        }

        // Numeric validation
        if (!is_numeric($contract_amount) || !is_numeric($bed_cost)) {
            return redirect()->back()->with('error', 'Contract amount and Bed cost must be numeric.');
        }

        $patient->name               = $name;
        $patient->dob                = $dob;
        $patient->gender             = $gender;
        $patient->mobile             = $mobile;
        $patient->father_husband     = $father_husband;
        $patient->guardian           = $guardian;
        $patient->address            = $address;
        $patient->religion           = $religion;
        $patient->nid                = $nid;
        $patient->contract_type      = $contract_type;
        $patient->contract_amount    = $contract_amount;
        $patient->procedure_type     = $procedure_type;
        $patient->medicine_package   = $medicine_package;
        $patient->refer_id           = $refer_id;
        $patient->treatment_under_id = $treatment_under_id;
        $patient->duty_doctor_id     = $duty_doctor_id;
        $patient->disease_id         = $disease_id;
        $patient->duty_nurse         = $duty_nurse;
        $patient->bed_booked_date    = $bed_booked_date;
        $patient->bed_id             = $bed_id;
        $patient->bed_cost           = $bed_cost;
        $patient->user_id            = Auth::guard('admin')->user()->id; // Logged in user
        $patient->remarks            = 'Modified by '. Auth::guard('admin')->user()->name;

        // dd($patient);

        $patient->update();

        return redirect()->back()->with('success', 'Patient information updated successfully.');
    }

    public function billPrepared(){        
        $patients = AdmissionPatient::where('status', 1)->get(); // 1 admit, 2 discharge, 3 cancel
        return view('patient.indoor.admit-patient-bill-prepared', compact('patients'));
    }

    public function billPreparedView($id){
        $patient = AdmissionPatient::where('id', $id)->first();
        $billPrepared = AdmissionBillSummary::where('patient_id', $id)->first(); // dd($billPrepared);
        if($billPrepared){
            return view('patient.indoor.bill-prepared-modify', compact('patient','billPrepared'));
        }
        return view('patient.indoor.bill-prepared', compact('patient','billPrepared'));
    }

    public function billCreate(Request $request, $id){
       
        $request->validate([
            'general_bed'      => 'required|numeric|min:0',
            'cabin_fee'        => 'nullable|numeric|min:0',
            'doctor_fee'       => 'nullable|numeric|min:0',
            'service_charge'   => 'nullable|numeric|min:0',
            'ot_medicine'      => 'nullable|numeric|min:0',
            'oral_medicine'    => 'nullable|numeric|min:0',
            'others'           => 'nullable|numeric|min:0',
            'contract_amount'  => 'nullable|numeric|min:0',
            'total_cost'       => 'nullable|numeric|min:0',
            'discount'         => 'nullable|numeric|min:0',
            'advance_paid'     => 'nullable|numeric|min:0',
            'payable_amount'   => 'nullable|numeric|min:0',
            'paid_amount'      => 'nullable|numeric|min:0',
            'remaining_due'    => 'nullable|numeric|min:0',
            'remarks'          => 'nullable|string',
        ]);

        $patient = AdmissionPatient::findOrFail($id);

        $billPrepared = AdmissionBillSummary::where('patient_id', $id)->first();
        if($billPrepared){
            return redirect()->back()->with('error', 'This patient bill already preapred. Please try another patient. Thank you!');
        }

        // Server-side calculations
        $patient_id      = $patient->id;
        $general_bed     = $request->input('general_bed', 0);
        $cabin_fee       = $request->input('cabin_fee', 0);
        $doctor_fee      = $request->input('doctor_fee', 0);
        $service_charge  = $request->input('service_charge', 0);
        $ot_medicine     = $request->input('ot_medicine', 0);
        $oral_medicine   = $request->input('oral_medicine', 0);
        $others          = $request->input('others', 0);
        $contract_amount = $request->input('contract_amount', 0);
        $discount        = $request->input('discount', 0);
        $advance_paid    = $request->input('advance_paid', 0);
        $paid_amount     = $request->input('paid_amount', 0);
        $reg_no          = $patient->reg;

        $total_cost     = $general_bed + $cabin_fee + $doctor_fee + $service_charge + $ot_medicine + $oral_medicine + $others + $contract_amount;
        $payable_amount = $total_cost - $discount - $advance_paid;
        $remaining_due  = $payable_amount - $paid_amount;

        if($remaining_due < 0){
            $remaining_due = 0;
        }

        $bill = new AdmissionBillSummary();

        $bill->patient_id = $patient_id;
        $bill->general_bed = $general_bed;
        $bill->cabin_fee = $cabin_fee;
        $bill->doctor_fee = $doctor_fee;
        $bill->service_charge = $service_charge;
        $bill->ot_medicine = $ot_medicine;
        $bill->oral_medicine = $oral_medicine;
        $bill->others = $others;
        $bill->contract_amount = $contract_amount;
        $bill->total_cost = $total_cost;
        $bill->discount = $discount;
        $bill->payable_amount = $payable_amount;
        $bill->paid_amount = $paid_amount;
        $bill->remaining_due = $remaining_due;
        $bill->reg = $reg_no;
        $bill->billing_date = Carbon::today()->format('Y-m-d');
        $bill->user_id = Auth::guard('admin')->user()->id;
        $bill->remarks = 'Bill prepared by '. Auth::guard('admin')->user()->name. ', Prepared date : '. Carbon::today()->format('d-M-Y');

        $bill->save();

        return redirect()->back()->with('success', 'Billing Summary saved successfully!')->with('reg', $reg_no);
    }

    public function billModify(Request $request, $id){

        $request->validate([
            'general_bed'      => 'required|numeric|min:0',
            'cabin_fee'        => 'nullable|numeric|min:0',
            'doctor_fee'       => 'nullable|numeric|min:0',
            'service_charge'   => 'nullable|numeric|min:0',
            'ot_medicine'      => 'nullable|numeric|min:0',
            'oral_medicine'    => 'nullable|numeric|min:0',
            'others'           => 'nullable|numeric|min:0',
            'contract_amount'  => 'nullable|numeric|min:0',
            'total_cost'       => 'nullable|numeric|min:0',
            'discount'         => 'nullable|numeric|min:0',
            'advance_paid'     => 'nullable|numeric|min:0',
            'payable_amount'   => 'nullable|numeric|min:0',
            'paid_amount'      => 'nullable|numeric|min:0',
            'remaining_due'    => 'nullable|numeric|min:0',
            'remarks'          => 'nullable|string',
        ]);
        
        $bill = AdmissionBillSummary::where('id', $id)->first();
        if(empty($bill)){
            return redirect()->back()->with('error', 'This patient is not found. Please try another patient. Thank you!');
        }

        // Server-side calculations
        $general_bed     = $request->input('general_bed', 0);
        $cabin_fee       = $request->input('cabin_fee', 0);
        $doctor_fee      = $request->input('doctor_fee', 0);
        $service_charge  = $request->input('service_charge', 0);
        $ot_medicine     = $request->input('ot_medicine', 0);
        $oral_medicine   = $request->input('oral_medicine', 0);
        $others          = $request->input('others', 0);
        $contract_amount = $request->input('contract_amount', 0);
        $discount        = $request->input('discount', 0);
        $advance_paid    = $request->input('advance_paid', 0);
        $paid_amount     = $request->input('paid_amount', 0);

        $total_cost     = $general_bed + $cabin_fee + $doctor_fee + $service_charge + $ot_medicine + $oral_medicine + $others + $contract_amount;
        $payable_amount = $total_cost - $discount - $advance_paid;
        $remaining_due  = $payable_amount - $paid_amount;

        if($remaining_due < 0){
            $remaining_due = 0;
        }

        $bill->general_bed = $general_bed;
        $bill->cabin_fee = $cabin_fee;
        $bill->doctor_fee = $doctor_fee;
        $bill->service_charge = $service_charge;
        $bill->ot_medicine = $ot_medicine;
        $bill->oral_medicine = $oral_medicine;
        $bill->others = $others;
        $bill->contract_amount = $contract_amount;
        $bill->total_cost = $total_cost;
        $bill->discount = $discount;
        $bill->payable_amount = $payable_amount;
        $bill->paid_amount = $paid_amount;
        $bill->remaining_due = $remaining_due;

        $bill->billing_date = Carbon::today()->format('Y-m-d');
        $bill->user_id = Auth::guard('admin')->user()->id;
        $bill->remarks = $bill->remarks . ', Bill modified by '. Auth::guard('admin')->user()->name. ', Modify date : '.Carbon::today()->format('d-M-Y').'. ';

        $bill->update();
        return redirect()->back()->with('success', 'This patient bill modified successfully. Thank you!')->with('reg', $bill->reg);
    }

    public function printBill($reg){
        $data = AdmissionBillSummary::where('reg', $reg)->first();
        if(empty($data)){
            return redirect()->back()->with('error', 'This patient is not found. Please try another patient. Thank you!');
        }
        $company = Company::first();
        return view('patient.indoor.print.print-prepared-bill', compact('data','company'));
    }

    public function advanceBillPayView(){
        $patients = AdmissionPatient::where('status', 1)->get(); // 1 admit, 2 discharge, 3 cancel
        return view('patient.indoor.patient-list-advance-pay', compact('patients'));
    }

    public function advanceBillPayPatient($id){
        $patient = AdmissionPatient::where('id', $id)->first(); //dd($patient);
        $data = AdmissionBillSummary::where('patient_id', $id)->first();
        return view('patient.indoor.patient-advance-pay', compact('patient','data'));
    }

    public function advanceBillPay(Request $request, $id){
        $request->validate([
            'advance_paid'     => 'nullable|numeric|min:1',
        ]);

        $patient = AdmissionPatient::where('id', $id)->first();

        $data = AdmissionBillSummary::where('patient_id', $id)->first();
        if($data){
            return redirect()->back()->with('warning', 'This patient already advance paid. Please try another patient. Thank you!');
        }

        $payBill = new AdmissionBillSummary();
        $payBill->patient_id = $patient->id;
        $payBill->reg = $patient->reg;
        $payBill->general_bed = $patient->bed_cost;
        $payBill->contract_amount = $patient->contract_amount;
        $payBill->advance_paid = $request->input('advance_paid', '');
        $payBill->billing_date = Carbon::today();
        $payBill->user_id = Auth::guard('admin')->user()->id;
        $payBill->remarks = "Advance Pay date of ". Carbon::today()->format('d-M-Y'). ', Received by : '. Auth::guard('admin')->user()->name;
        // dd($payBill, $patient);
        $payBill->save();
        return redirect()->back()->with('success', 'This patient bill modified successfully. Thank you!')->with('reg', $payBill->reg);
    }

    public function patientDisList(){
        $patients = AdmissionPatient::where('status', 1)->get(); // 1 admit, 2 discharge, 3 cancel
        $dischargePatients = AdmissionPatient::where('status', 2)->get(); // 1 admit, 2 discharge, 3 cancel
        return view('patient.indoor.discharge-patient-list', compact('patients','dischargePatients'));
    }

    public function patientViewDis($reg){
        $patient = AdmissionPatient::where('reg', $reg)->first();
        $billPrepared = AdmissionBillSummary::where('reg', $reg)->first();
        if (!$billPrepared || !$patient) {
            return redirect()->back()->with('error', 'This patient is not found. Please try another patient. Thank you!');
        }
        return view('patient.indoor.discharge-patient', compact('patient','billPrepared'));
    }

    public function dischargePatient(Request $request, $reg){
        
        $request->validate([
            'discount'         => 'nullable|numeric|min:0',
            'payable_amount'   => 'nullable|numeric|min:0',
            'remaining_due'    => 'nullable|numeric|min:0',
        ]);

        $bill = AdmissionBillSummary::where('reg', $reg)->first();
        $patient = AdmissionPatient::where('reg', $reg)->first();
        if (!$bill || !$patient) {
            return redirect()->back()->with('error', 'This patient is not found. Please try another patient. Thank you!');
        }

        $patient->status = 2; // 1 admit, 2 discharge, 3 cancel
        $patient->remarks = "Patient discharged. Date of :" . Carbon::today()->format('d-M-Y');

        // Server-side calculations
        $general_bed     = $request->input('general_bed', 0);
        $cabin_fee       = $request->input('cabin_fee', 0);
        $doctor_fee      = $request->input('doctor_fee', 0);
        $service_charge  = $request->input('service_charge', 0);
        $ot_medicine     = $request->input('ot_medicine', 0);
        $oral_medicine   = $request->input('oral_medicine', 0);
        $others          = $request->input('others', 0);
        $contract_amount = $request->input('contract_amount', 0);
        $discount        = $request->input('discount', 0);
        $advance_paid    = $request->input('advance_paid', 0);
        $paid_amount     = $request->input('paid_amount', 0);

        $total_cost     = $general_bed + $cabin_fee + $doctor_fee + $service_charge + $ot_medicine + $oral_medicine + $others + $contract_amount;
        $payable_amount = $total_cost - $discount - $advance_paid;
        $remaining_due  = $payable_amount - $paid_amount;

        if($remaining_due < 0){
            $remaining_due = 0;
        }

        $bill->general_bed = $general_bed;
        $bill->cabin_fee = $cabin_fee;
        $bill->doctor_fee = $doctor_fee;
        $bill->service_charge = $service_charge;
        $bill->ot_medicine = $ot_medicine;
        $bill->oral_medicine = $oral_medicine;
        $bill->others = $others;
        $bill->contract_amount = $contract_amount;
        $bill->total_cost = $total_cost;
        $bill->discount = $discount;
        $bill->payable_amount = $payable_amount;
        $bill->paid_amount = $paid_amount;
        $bill->remaining_due = $remaining_due;

        $bill->billing_date = Carbon::today()->format('Y-m-d');
        $bill->user_id = Auth::guard('admin')->user()->id;
        $bill->remarks = $bill->remarks . ', Patient Discharge by '. Auth::guard('admin')->user()->name. ', Discharge date : '.Carbon::today()->format('d-M-Y').'. ';
        
        $patient->update();
        $bill->update();
        return redirect()->route('patient.dischange.list')->with('success', 'This patient bill modified successfully. Thank you!');
    }
}
