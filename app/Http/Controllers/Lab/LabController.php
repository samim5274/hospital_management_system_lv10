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
        $testReports = TestReportDetail::whereIn('test_id', $testIds)->get()->groupBy('test_id');;

        return view('lab.report-generate', compact('patient','testDetails','testReports'));
    }
}
