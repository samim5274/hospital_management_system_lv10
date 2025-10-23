<?php

namespace App\Http\Controllers\Reagent;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Company;
use App\Models\Unit;
use App\Models\Generic;
use App\Models\Presentation;
use App\Models\Reagent;
use App\Models\ReagentTest;
use App\Models\LabTest;

class ReagentController extends Controller
{
    public function rawMatrerial(){
        $units = Unit::all();
        $generics = Generic::all();
        $presentaions = Presentation::all();
        $reagents = Reagent::all();
        return view('lab.reagent.reagents', compact('units','generics','presentaions','reagents'));
    }

    public function storeReagent(Request $request){
        
        $validatedData = $request->validate([
            'txtName'          => 'required|string|max:255|unique:reagents,name',
            'cbxUnit'          => 'required|exists:units,id',
            'cbxGeneric'       => 'required|exists:generics,id',
            'cbxPresentation'  => 'required|exists:presentations,id',
            'txtPurchasePrice' => 'required|numeric|min:1',
            'txtMinQty'        => 'required|integer|min:1',
        ]);

        Reagent::create([
            'name'            => $validatedData['txtName'],
            'unit_id'         => $validatedData['cbxUnit'],
            'generic_id'      => $validatedData['cbxGeneric'],
            'presentation_id' => $validatedData['cbxPresentation'],
            'purchase_price'  => $validatedData['txtPurchasePrice'],
            'min_qty'         => $validatedData['txtMinQty'],
        ]);

        return redirect()->back()->with('success', 'Reagent created successfully!');
    }

    public function updateReagent(Request $request, $id){
        $reagent = Reagent::where('id', $id)->first();

        $validatedData = $request->validate([
            'txtName'          => 'required|string|max:255|unique:reagents,name,' . $reagent->id,
            'cbxUnit'          => 'required|exists:units,id',
            'cbxGeneric'       => 'required|exists:generics,id',
            'cbxPresentation'  => 'required|exists:presentations,id',
            'txtPurchasePrice' => 'required|numeric|min:1',
            'txtMinQty'        => 'required|integer|min:1',
        ]);

        $reagent->update([
            'name'            => $validatedData['txtName'],
            'unit_id'         => $validatedData['cbxUnit'],
            'generic_id'      => $validatedData['cbxGeneric'],
            'presentation_id' => $validatedData['cbxPresentation'],
            'purchase_price'  => $validatedData['txtPurchasePrice'],
            'min_qty'         => $validatedData['txtMinQty'],
        ]);

        return redirect()->back()->with('success', 'Reagent updated successfully!');
    }

    public function setting(){
        $units = Unit::all();
        $generics = Generic::all();
        $presentaions = Presentation::all();
        return view('lab.reagent.setting', compact('units','generics','presentaions'));
    }

    public function createUnit(Request $request){
        $data = new Unit();
        $data->name = $request->input('name', '');
        $data->save();
        return redirect()->back()->with('success', 'Reagent unit add successfully!');
    }

    public function modifyUnit(Request $request, $id){
        $data = Unit::where('id', $id)->first();
        if(empty($data)){
            return redirect()->back()->with('error', 'Reagent unit not found. Please try again. Thank You!');
        }
        $data->name = $request->input('name', '');
        $data->update();
        return redirect()->back()->with('success', 'Reagent unit Modified successfully!');
    }

    public function createGenerics(Request $request){
        $data = new Generic();
        $data->name = $request->input('name', '');
        $data->save();
        return redirect()->back()->with('success', 'Reagent Generic add successfully!');
    }

    public function modifyGenerics(Request $request, $id){
        $data = Generic::where('id', $id)->first();
        if(empty($data)){
            return redirect()->back()->with('error', 'Reagent Generic not found. Please try again. Thank You!');
        }
        $data->name = $request->input('name', '');
        $data->update();
        return redirect()->back()->with('success', 'Reagent Generic Modified successfully!');
    }

    public function createPresentation(Request $request){
        $data = new Presentation();
        $data->name = $request->input('name', '');
        $data->save();
        return redirect()->back()->with('success', 'Reagent Presentation add successfully!');
    }

    public function modifyPresentation(Request $request, $id){
        $data = Presentation::where('id', $id)->first();
        if(empty($data)){
            return redirect()->back()->with('error', 'Reagent Presentation not found. Please try again. Thank You!');
        }
        $data->name = $request->input('name', '');
        $data->update();
        return redirect()->back()->with('success', 'Reagent Presentation Modified successfully!');
    }

    public function stock(){
        $data = Reagent::all();
        return view('lab.reagent.stock', compact('data'));
    }

    public function reagentTestEnrolled(){
        $reagentsList = Reagent::all();
        $enrolledTests = ReagentTest::all();
        $testDetails = LabTest::all();
        return view('lab.reagent.reagent-test-enroll', compact('reagentsList', 'enrolledTests', 'testDetails'));
    }

    public function enrollReagentTest(Request $request){
        $validatedData = $request->validate([
            'test_id'    => 'required|exists:lab_tests,id',
            'cbxReagent' => 'required|exists:reagents,id',
            'qty'        => 'nullable|min:0.01',
        ]);

        $existing = ReagentTest::where('test_id', $validatedData['test_id'])->where('reagent_id', $validatedData['cbxReagent'])->first();
        if ($existing) {
            return redirect()->back()->with('warning', 'This reagent is already enrolled for the selected test.');
        }

        $data = new ReagentTest();
        $data->test_id = $validatedData['test_id'];
        $data->reagent_id = $validatedData['cbxReagent'];
        $data->quantity_required = $validatedData['qty'] ?? 1;

        $data->save();
        return redirect()->back()->with('success', 'Reagent enrolled to test successfully!');
    }

    public function modifyEnrolledReagentTest(Request $request, $id){
        $data = ReagentTest::where('id', $id)->first();
        if(empty($data)){
            return redirect()->back()->with('error', 'Enrolled Reagent Test not found. Please try again. Thank You!');
        }

        $validatedData = $request->validate([
            'test_id'    => 'required|exists:lab_tests,id',
            'cbxReagent' => 'required|exists:reagents,id',
            'qty'        => 'nullable|min:0.01',
        ]);

        $data->test_id = $validatedData['test_id'];
        $data->reagent_id = $validatedData['cbxReagent'];
        $data->quantity_required = $validatedData['qty'] ?? 1;

        $data->update();
        return redirect()->back()->with('success', 'Enrolled Reagent Test modified successfully!');
    }
}
