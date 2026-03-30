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
use App\Models\ReagentStock;
use App\Models\Reagent;
use App\Models\LabCategory;
use App\Models\LabSubcategory;
use App\Models\LabSpecimen;
use App\Models\LabGroup;

class LabController extends Controller
{
    public function index(){
        $company = Company::first();
        $testDetails = LabTest::all();
        $categories = LabCategory::all();
        $subcategories = LabSubcategory::with('category')->get();
        $specimens = LabSpecimen::all();
        $groups = LabGroup::all();
        return view('lab.test-details', compact('testDetails','company','categories', 'subcategories', 'groups','specimens'));
    }

    public function getSubcategories($categoryId)
    {
        $subcategories = LabSubcategory::where('catId', $categoryId)->get();
        return response()->json($subcategories);
    }

    public function store(Request $request){
        $request->validate([
            'testName'        => 'required|string|max:255',
            'category_id'     => 'required|exists:lab_categories,id',
            'subcategory_id'  => 'required|exists:lab_subcategories,id',
            'specimenId'      => 'nullable|exists:lab_specimens,id',
            'groupId'         => 'nullable|exists:lab_groups,id',
            'testPrice'       => 'required|numeric|min:0',
            'rprice'          => 'nullable|numeric|min:0',
            'room'            => 'nullable|string|max:100',
            'testDescription' => 'nullable|string',
            'status'          => 'required',
        ]);

        $labTest = new LabTest();
        $labTest->testName        = $request->testName;
        $labTest->categoryId      = $request->category_id;
        $labTest->subcategoryId   = $request->subcategory_id;
        $labTest->specimenId      = $request->specimenId;
        $labTest->groupId         = $request->groupId;
        $labTest->testPrice       = $request->testPrice;
        $labTest->rprice          = $request->rprice;
        $labTest->room            = $request->room;
        $labTest->testDescription = $request->testDescription;
        $labTest->status          = $request->status;
        $labTest->save();

        return redirect()->back()->with('success', 'Lab test created successfully!');
    }

    public function reportView($id){
        $company = Company::first();
        $testReportDetails = TestReportDetail::where('test_id', $id)->get();
        $labTest = LabTest::where('id', $id)->first();
        return view('lab.test-report-view', compact('testReportDetails','labTest','company'));
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
        $company = Company::first();
        $patients = PaymentDetail::where('date', $date)->paginate(20);
        return view('lab.report-details', compact('patients', 'company'));
    }

    // public function patientLabTest($reg){
    //     $company = Company::first();
    //     $patient = PaymentDetail::where('reg', $reg)->first();
    //     $testDetails = StoreTest::where('regNum', $reg)->get();

    //     $testIds = $testDetails->pluck('testId');
    //     $testReports = TestReportDetail::whereIn('test_id', $testIds)->get()->groupBy('test_id');

    //     $patientTestReport = PatientTestReport::with(['storeTest.test'])
    //                             ->where('reg', $reg)
    //                             ->get();

    //     if ($patientTestReport->isNotEmpty()) {
    //         return view('lab.report-generate', compact('patient', 'testDetails', 'testReports', 'patientTestReport', 'reg','company'));
    //     } else {
    //         foreach ($testDetails as $test) {
    //             $reports = $testReports[$test->testId] ?? collect();

    //             foreach ($reports as $report) {
    //                 PatientTestReport::create([
    //                     'reg' => $reg,
    //                     'patient_id' => $patient->id,
    //                     'test_id' => $report->id,
    //                     'part_of_test' => $report->part_of_test,
    //                     'result' => $report->result,
    //                     'unit' => $report->unit,
    //                     'reference_value' => $report->reference_value,
    //                     'ref_value_of_hormone' => $report->ref_value_of_hormone,
    //                     'remarks' => 'Report Created by: ' . Auth::guard('admin')->user()->name,
    //                 ]);
    //             }
    //         }
    //         $patientTestReport = PatientTestReport::with(['storeTest.test'])
    //                                 ->where('reg', $reg)
    //                                 ->get();
    //         return view('lab.report-generate', compact('patient', 'testDetails', 'testReports', 'patientTestReport', 'reg', 'company'));
    //     }
    // }

    public function patientLabTest($reg){
        $company = Company::first();
        $patient = PaymentDetail::where('reg', $reg)->first();
        $testDetails = StoreTest::where('regNum', $reg)->get();

        $testReports = TestReportDetail::whereIn('test_id', $testDetails->pluck('testId'))->get()->groupBy('test_id');

        $patientTestReport = PatientTestReport::with(['storeTest.test'])->where('reg', $reg)->get();

        if($patientTestReport->isEmpty()) {
            foreach ($testDetails as $test) {
                $reports = $testReports[$test->testId] ?? collect();

                foreach ($reports as $report) {
                    PatientTestReport::create([
                        'reg' => $reg,
                        'patient_id' => $patient->id,
                        'test_id' => $report->id,
                        'part_of_test' => $report->part_of_test,
                        'result' => $report->result,
                        'unit' => $report->unit,
                        'reference_value' => $report->reference_value,
                        'ref_value_of_hormone' => $report->ref_value_of_hormone,
                        'remarks' => 'Report Created by: ' . Auth::guard('admin')->user()->name,
                    ]);
                }
            }
            $patientTestReport = PatientTestReport::with(['storeTest.test'])->where('reg', $reg)->get();
        }
        return view('lab.report-generate', compact('patient', 'testDetails', 'testReports', 'patientTestReport', 'reg', 'company'));
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
        $testReports = PatientTestReport::with(['storeTest.test'])->whereIn('test_id', $testIds)->get()->groupBy('test_id');
        $company = Company::first();

        return view('lab.print.print-patient-test-report', compact('patient', 'testDetails', 'testReports', 'reg', 'company'));
    }

    public function deleteTest($id){
        try{
            $data = LabTest::findOrFail($id);
            $data->delete();
            return redirect()->back()->with('success', 'Test DELETED successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while deleting the test.');
        }
    }

    public function deleteTestReport($id){
        try{
            $data = TestReportDetail::findOrFail($id);
            $data->delete();
            return redirect()->back()->with('success', 'Test report item DELETED successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while deleting the item.');
        }
    }

    public function setting(){
        $company = Company::first();
        $categories = LabCategory::all();
        $subcategories = LabSubcategory::with('category')->get();
        $groups = LabGroup::all();
        $specimens = LabSpecimen::all();
        return view('lab.setting', compact('company','categories', 'subcategories', 'groups','specimens'));
    }

    public function addCategory(Request $request){
        $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string|max:255',
        ]);

        try{
            $data = new LabCategory();
            $data->catName = $request->name;
            $data->description = $request->description ?? 'N/A';
            $data->save();
            return redirect()->back()->with('success', 'Lab test category created successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while creating the item.');
        }
    }

    public function editCategory(Request $request, $id){
        $request->validate([
            'name'        => 'required|string|max:255',
        ]);

        try{
            $data = LabCategory::findOrFail($id);
            $data->catName = $request->name;
            $data->description = $request->description ?? 'N/A';
            $data->save();
            return redirect()->back()->with('success', 'Lab test category updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while updating the item.');
        }
    }

    public function deleteCategory($id){
        try{
            $data = LabCategory::findOrFail($id);
            $data->delete();
            return redirect()->back()->with('success', 'Lab test category deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while deleting the item.');
        }
    }

    public function addSubCategory(Request $request){
        $request->validate([
            'category_id' => 'required|exists:lab_categories,id',
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        try {
            $subCategory = new LabSubCategory();
            $subCategory->catId = $request->category_id;
            $subCategory->subCatName = $request->name;
            $subCategory->description = $request->description;
            $subCategory->save();
            return redirect()->back()->with('success', 'Sub-category created successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while creating sub-category.');
        }
    }

    public function editSubCategory(Request $request, $id){
        $request->validate([
            'category_id' => 'required|exists:lab_categories,id',
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        try {
            $subCategory = LabSubCategory::FindOrFail($id);
            $subCategory->catId = $request->category_id;
            $subCategory->subCatName = $request->name;
            $subCategory->description = $request->description;
            $subCategory->save();
            return redirect()->back()->with('success', 'Sub-category updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while creating sub-category.');
        }
    }

    public function deleteSubCategory($id){
        try{
            $data = LabSubCategory::findOrFail($id);
            $data->delete();
            return redirect()->back()->with('success', 'Lab test sub-category deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while deleting the item.');
        }
    }

    public function addGroup(Request $request){
        $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        try{
            $data = new LabGroup();
            $data->name = $request->name;
            $data->description = $request->description ?? 'N/A';
            $data->save();
            return redirect()->back()->with('success', 'Lab test category created successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while creating the item.');
        }
    }

    public function editGroup(Request $request, $id){
        $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        try{
            $data = LabGroup::findOrFail($id);
            $data->name = $request->name;
            $data->description = $request->description ?? 'N/A';
            $data->save();
            return redirect()->back()->with('success', 'Lab test category updated successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while updating the item.');
        }
    }

    public function deleteGroup($id){
        try{
            $data = LabGroup::findOrFail($id);
            $data->delete();
            return redirect()->back()->with('success', 'Lab test group deleted successfully.');
        } catch (\Exception $e) {
            return redirect()->back()->with('error', 'An error occurred while deleting the item.');
        }
    }

    public function addSpecimen(Request $request){
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        LabSpecimen::create([
            'name' => $request->name,
            'description' => $request->description,
        ]);

        return redirect()->back()->with('success', 'Lab Specimen created successfully.');
    }

    public function editSpecimen(Request $request, $id){
        $request->validate([
            'name' => 'required|string|max:255',
            'description' => 'nullable|string|max:500',
        ]);

        $specimen = LabSpecimen::findOrFail($id);
        $specimen->update([
            'name' => $request->name,
            'description' => $request->description,
        ]);

        return redirect()->back()->with('success', 'Lab Specimen updated successfully.');
    }

    public function deleteSpecimen($id){
        LabSpecimen::findOrFail($id)->delete();
        return redirect()->back()->with('success', 'Lab Specimen deleted successfully.');
    }

}
