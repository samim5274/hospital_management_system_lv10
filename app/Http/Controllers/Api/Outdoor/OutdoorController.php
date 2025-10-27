<?php

namespace App\Http\Controllers\Api\Outdoor;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

use App\Models\Admin;
use App\Models\LabTest;
use App\Models\StoreTest;
use App\Models\PaymentDetail;

class OutdoorController extends Controller
{

    private function generateRegNum($userId)
    {
        $today = date('Y-m-d');
        $count = PaymentDetail::where('date', $today)->where('userId', $userId)->count() + 1;
        // $userId = Auth::guard('admin')->user()->id ?? 1;
        return 'LAB' . date('Ymd') . $userId . $count;
    }

    public function storeTest(Request $request)
    {
        // Step 1: Validate request
        $validated = $request->validate([
            'testId' => 'required|integer|exists:lab_tests,id',
            'userId' => 'required|integer',
            'regNum' => 'nullable|string',
        ]);
        
        // Step 2: Check if user exists
        $userId = $validated['userId'];
        $userFind = Admin::find($userId);
        if (!$userFind) {
            return response()->json([
                'status' => 'error',
                'message' => 'User not found'
            ], 404);
        }

        // Step 3: Find test
        $test = LabTest::where('id', $validated['testId'])->first();
        if (!$test) {
            return response()->json([
                'status' => 'error',
                'message' => 'Test not found in the database'
            ], 404);
        }

        // Step 4: Generate or use provided regNum
        $regNum = $this->generateRegNum($userId);

        $exists = StoreTest::where('regNum', $regNum)->where('testId', $test->id)->first();
        if ($exists) {
            return response()->json([
                'status' => 'error',
                'message' => 'Registration number and test already exist'
            ], 404);
        }

        // api security check can be added here if needed

        $header = $request->header('Authorization');
        if ($header == '') {
            return response()->json([
                'status' => 'error',
                'message' => 'Unauthorized Token 1'
            ], 422);
        } else {
            if($header == 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWUsImlhdCI6MTUxNjIzOTAyMn0.KMUFsIDTnFmyG3nMiGM6H9FNFUROf3wh7SmqJp-QV30'){
                // Step 6: Store test in DB
                $testStore = new StoreTest();
                $testStore->regNum = $regNum;
                $testStore->userId = $userId;
                $testStore->testId = $test->id;
                $testStore->testprice = $test->testPrice;
                $testStore->referprice = $test->rprice;
                $testStore->categoryId = $test->categoryId;
                $testStore->subcategoryId = $test->subcategoryId;
                $testStore->specimenId = $test->specimenId;
                $testStore->groupId = $test->groupId;
                $testStore->room = $test->room;
                $testStore->save();

                // Step 7: Return response
                return response()->json([
                    'message' => 'Test stored successfully',
                    'data' => $testStore
                ], 201);
            } else {
                return response()->json([
                    'status' => 'error',
                    'message' => 'Unauthorized Token dose not match. Please contact with API provider.'
                ], 422);
            }
        }
    }

    public function deleteTest($id)
    {
        $test = StoreTest::find($id);
        if (!$test) {
            return response()->json([
                'status' => 'error',
                'message' => 'Test not found'
            ], 404);
        }

        $test->delete();

        return response()->json([
            'status' => 'success',
            'message' => 'Test deleted successfully'
        ], 200);
    }

    public function testSales(Request $request)
    {
        $data = $request->validate([
            'name'      => 'required|string|max:255',
            'dob'       => 'nullable|date',
            'gender'    => 'nullable|string|in:Male,Female,Other',
            'phone'     => 'nullable|string|max:20',
            'address'   => 'nullable|string|max:255',
            'doctor'    => 'nullable|integer|exists:doctors,id',
            'refer'     => 'nullable|integer|exists:doctors,id',
            'discount'  => 'nullable|numeric|min:0',
            'received'  => 'nullable|numeric|min:0',
            'userId'    => 'required|integer|exists:admins,id',
        ]);

        // Generate or use provided regNum
        $userId = $data['userId'];
        $userFind = Admin::find($userId);

        if (!$userFind) {
            return response()->json([
                'status'  => 'error',
                'message' => 'User not found.',
            ], 404);
        }

        $regNum = $this->generateRegNum($userId);
        $today = date('Y-m-d');

        // Calculate totals
        $total = StoreTest::where('regNum', $regNum)->sum('testprice');

        if ($total <= 0) {
            return response()->json([
                'status'  => 'error',
                'message' => 'Please add tests first before saving!',
            ], 400);
        }

        $discount = $data['discount'] ?? 0;
        $payable = $total - $discount;
        $receivedAmount = $data['received'] ?? 0;

        if ($payable <= $receivedAmount) {
            $pay = $payable;
            $duestatus = 0;
            $due = 0;
        } else {
            $pay = $receivedAmount;
            $duestatus = 1;
            $due = $payable - $receivedAmount;
        }
        
        $payment = new PaymentDetail();
        $payment->reg         = $regNum;
        $payment->date        = $today;
        $payment->name        = $data['name'];
        $payment->dob         = $data['dob'] ?? null;
        $payment->gender      = $data['gender'] ?? null;
        $payment->phone       = $data['phone'] ?? null;
        $payment->address     = $data['address'] ?? null;
        $payment->doctorId    = $data['doctor'] ?? null;
        $payment->referId     = $data['refer'] ?? null;
        $payment->total       = $total;
        $payment->discount    = $discount;
        $payment->payable     = $payable;
        $payment->pay         = $pay;
        $payment->duestatus   = $duestatus;
        $payment->due         = $due;
        $payment->return      = 0;
        $payment->status      = 1;
        $payment->userId      = $userId;
        $payment->save();

        return response()->json([
            'status'  => 'success',
            'message' => 'Payment saved successfully',
            'invoice' => $regNum,
            'data'    => $payment
        ], 201);
    }
}
