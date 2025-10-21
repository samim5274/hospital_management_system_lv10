<?php

namespace App\Http\Controllers\Lab;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\LabTest;
use App\Models\TestReportDetail;
use App\Models\PaymentDetail;
use App\Models\StoreTest;
use App\Models\PatientTestReport;
use App\Models\Company;

class LabController extends Controller
{
    public function index(){
        $testDetails = LabTest::all();
        return view('lab.test-details', compact('testDetails'));
    }
    
    public function reportView($id){
        $testReportDetails = TestReportDetail::where('test_id', $id)->get();
        $labTest = LabTest::where('id', $id)->first();
        return view('lab.test-report-view', compact('testReportDetails','labTest'));
    }

    public function reportEdit(Request $request, $id){
        $validated = $request->validate([
            'result' => 'nullable|string|max:255',
            'unit' => 'nullable|string|max:100',
            'reference_value' => 'nullable|string|max:255',
            'ref_value_of_hormone' => 'nullable|string|max:255',
        ]);

        $testReportDetails = TestReportDetail::where('id', $id)->first();
        if(empty($testReportDetails)){
            return redirect()->back()->with('error', 'Test report not found.');
        }

        $testReportDetails->part_of_test = $request->input('part_of_test', '');
        $testReportDetails->result = $request->input('result', '');
        $testReportDetails->unit = $request->input('unit', '');
        $testReportDetails->reference_value = $request->input('reference_value', '');
        $testReportDetails->ref_value_of_hormone = $request->input('ref_value_of_hormone', '');
        $testReportDetails->update();
        return redirect()->back()->with('success', 'Test Report edit successfully.');
    }

    public function addPart(Request $request, $id){

        $validated = $request->validate([
            'result' => 'nullable|string|max:255',
            'unit' => 'nullable|string|max:100',
            'reference_value' => 'nullable|string|max:255',
            'ref_value_of_hormone' => 'nullable|string|max:255',
        ]);

        $testReportDetails = new TestReportDetail();
        $testReportDetails->test_id = $id;
        $testReportDetails->part_of_test = $request->input('part_of_test', '');
        $testReportDetails->result = $request->input('result', '');
        $testReportDetails->unit = $request->input('unit', '');
        $testReportDetails->reference_value = $request->input('reference_value', '');
        $testReportDetails->ref_value_of_hormone = $request->input('ref_value_of_hormone', '');
        $testReportDetails->save();
        return redirect()->back()->with('success', 'Test Report add item successfully.');
    }

    public function reportTestView(){
        $date = Carbon::today();
        $patients = PaymentDetail::where('date', $date)->paginate(20);
        return view('lab.report-details', compact('patients'));
    }

    public function patientLabTest($reg){
        $patient = PaymentDetail::where('reg', $reg)->first();
        $testDetails = StoreTest::where('regNum', $reg)->get();
        $testIds = $testDetails->pluck('id');
        $testReports = TestReportDetail::whereIn('test_id', $testIds)->get()->groupBy('test_id');

        $patientTestReport = PatientTestReport::where('reg', $reg)->get();
        
        if ($patientTestReport->isNotEmpty()) {            
            return view('lab.report-generate', compact('patient', 'testDetails', 'testReports', 'patientTestReport', 'reg'));
        } else {            
            foreach ($testDetails as $test) {
                $reports = $testReports[$test->id] ?? collect();

                foreach ($reports as $report) {
                    PatientTestReport::create([
                        'reg' => $reg,
                        'patient_id' => $patient->id,
                        'test_id' => $test->id,
                        'part_of_test' => $report->part_of_test,
                        'result' => $report->result,
                        'unit' => $report->unit,
                        'reference_value' => $report->reference_value,
                        'ref_value_of_hormone' => $report->ref_value_of_hormone,
                        // 'remarks' => 'Report Created by: ' . Auth::guard('admin')->user()->name,
                    ]);
                }
            }

             $patientTestReport = PatientTestReport::where('reg', $reg)->get();
            
            return view('lab.report-generate', compact('patient', 'testDetails', 'testReports', 'patientTestReport', 'reg'));
        }
    }

    public function patientReport(Request $request, $id){
        
        $validated = $request->validate([
            'result' => 'nullable|string|max:255',
            'unit' => 'nullable|string|max:100',
            'reference_value' => 'nullable|string|max:255',
            'ref_value_of_hormone' => 'nullable|string|max:255',
        ]);

        $patientTestReport = PatientTestReport::where('id', $id)->first();
        if(empty($patientTestReport)){
            return redirect()->back()->with('error', 'Test report not found.');
        }

        $patientTestReport->part_of_test = $request->input('part_of_test', '');
        $patientTestReport->result = $request->input('result', '');
        $patientTestReport->unit = $request->input('unit', '');
        $patientTestReport->reference_value = $request->input('reference_value', '');
        $patientTestReport->ref_value_of_hormone = $request->input('ref_value_of_hormone', '');
        $patientTestReport->remarks = $request->input('remarks', '');
        
        $patientTestReport->update();
        return redirect()->back()->with('success', 'Test Report edit successfully.');
    }

    public function printPatientReport($reg){
        $patient = PaymentDetail::where('reg', $reg)->first();
        $testDetails = StoreTest::where('regNum', $reg)->get();
        $testIds = $testDetails->pluck('id');
        $testReports = PatientTestReport::whereIn('test_id', $testIds)->get()->groupBy('test_id');
        $company = Company::first();

        return view('lab.print.print-patient-test-report', compact('patient', 'testDetails', 'testReports', 'reg', 'company'));
    }
}
