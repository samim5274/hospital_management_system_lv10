<?php

namespace App\Livewire;

use Illuminate\Support\Str;
use Illuminate\Support\Facades\Auth;

use Livewire\Component;
use App\Models\LabTest;
use App\Models\StoreTest;
use App\Models\PaymentDetail;

class LabInvoice extends Component
{
    public $regNum;
    public $cart = [];
    public $total = 0;
    public $tests;
    public $search = '';      // Search input

    public function mount()
    {
        $this->tests = LabTest::all();
        $this->regNum = $this->generateRegNum();
        $this->loadCart();
    }

    public function loadCart()
    {
        $this->cart = StoreTest::where('regNum', $this->regNum)
                        ->get()
                        ->mapWithKeys(function($item) {
                            return [
                                $item->testId => [
                                    'id' => $item->testId,
                                    'name' =>  $item->test->testName ?? 'Unknown',
                                    'price' => $item->testprice
                                ]
                            ];
                        })->toArray();

        $this->calculateTotal();
    }

    private function generateRegNum()
    {
        $today = date('Y-m-d');
        $count = PaymentDetail::where('date', $today)->count() + 1;
        return 'LAB' . date('Ymd') . $userId = Auth::id() ?? 1 . $count;
    }

    // Add test to cart
    public function addTest($testId)
    {
        $test = LabTest::find($testId);

        if ($test && !isset($this->cart[$testId])) {

            // Insert into DB
            StoreTest::create([
                'regNum'       => $this->regNum,
                'testId'       => $test->id,
                'testprice'    => $test->testPrice,
                'referprice'   => $test->rprice,
                'categoryId'   => $test->categoryId,
                'subcategoryId'=> $test->subcategoryId,
                'specimenId'   => $test->specimenId,
                'groupId'      => $test->groupId,
                'room'         => $test->room ?? 0,
                'status'       => $test->status,
                'reportstatus' => 0,
            ]);

            // Update Livewire cart
            $this->cart[$testId] = [
                'id' => $test->id,
                'name' => $test->testName,
                'price' => $test->testPrice,
            ];

            $this->calculateTotal();
        }
    }


    // Remove test from cart
    public function removeTest($testId)
    {
        if(isset($this->cart[$testId])) {

            // Remove from DB
            StoreTest::where('regNum', $this->regNum)
                    ->where('testId', $testId)
                    ->delete();

            // Remove from Livewire cart
            unset($this->cart[$testId]);
            $this->calculateTotal();
        }
    }

    public function searchTest()
    {
        $query = trim($this->search);

        if(empty($query)) return;

        $test = LabTest::where('id', $query)
                    ->orWhere('testName', 'like', '%' . $query . '%')
                    ->first();

        if($test) {
            $this->addTest($test->id);
            $this->search = ''; 
        }
    }



    // Calculate total
    public function calculateTotal()
    {
        $this->total = collect($this->cart)->sum('price');
        $this->dispatch('updateTotal', total: $this->total);
    }

    public function render()
    {
        return view('livewire.lab-invoice');
    }
}
