<?php

namespace App\Http\Controllers\Reagent;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

use App\Models\Company;
use App\Models\Unit;
use App\Models\Generic;
use App\Models\Presentation;
use App\Models\Reagent;

class ReagentController extends Controller
{
    public function rawMatrerial(){
        $units = Unit::all();
        $generics = Generic::all();
        $presentaions = Presentation::all();
        $reagents = Reagent::all();
        return view('lab.raw.raw-metreals', compact('units','generics','presentaions','reagents'));
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
        return view('lab.raw.setting', compact('units','generics','presentaions'));
    }
}
