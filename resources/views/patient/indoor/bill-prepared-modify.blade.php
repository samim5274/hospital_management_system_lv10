<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Prepared - HMS</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconly/bold.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/bootstrap-icons/bootstrap-icons.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" />
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
    <link rel="shortcut icon" href="{{ asset('assets/images/favicon.svg') }}" type="image/x-icon">

</head>

<body>
    <div id="app">
        @include('layouts.navbar')
        <div id="main">

            <header class="mb-3">
                <a href="#" class="burger-btn d-block d-xl-none">
                    <i class="bi bi-justify fs-3"></i>
                </a>
            </header>

            @include('layouts.message')

            <div class="page-heading mb-3">
                <h3 class="text-primary">Admit Patient</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/indoors/bill/prepared')}}">Patient List</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{$patient->name}}</li>
                    </ol>
                </nav>
            </div>

            <div class="page-content mb-3">
                <section class="row">
                    <div class="col-12">                        
                            
                        <div class="row g-3">
                            <!-- LEFT COLUMN -->
                            <div class="col-xl-12 col-md-12">                                    
                                <div class="card shadow-sm border-0 mb-0">
                                    <div class="card-header bg-primary text-center py-2 rounded-top">
                                        <h6 class="mb-0 text-white fw-semibold">Patient, Medical & Bed Information</h6>
                                    </div>

                                    <div class="card-body py-4">
                                        <div class="row g-3">
                                            <!-- Patient Information -->
                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Patient Name:</label>
                                                <p class="mb-0 text-dark">{{$patient->name}}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Date of Birth:</label>
                                                <p class="mb-0 text-dark">{{ \Carbon\Carbon::parse($patient->dob)->format('d M, Y') }}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Gender:</label>
                                                <p class="mb-0 text-dark">{{$patient->gender}}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Mobile:</label>
                                                <p class="mb-0 text-dark">{{$patient->mobile}}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Father/Husband:</label>
                                                <p class="mb-0 text-dark">{{$patient->father_husband}}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Guardian:</label>
                                                <p class="mb-0 text-dark">{{$patient->guardian}}</p>
                                            </div>

                                            <!-- <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Religion:</label>
                                                <p class="mb-0 text-dark">{{$patient->religion}}</p>
                                            </div> -->

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">NID No:</label>
                                                <p class="mb-0 text-dark">{{$patient->nid}}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Address:</label>
                                                <p class="mb-0 text-dark">{{$patient->address}}</p>
                                            </div>

                                            <!-- Contract & Medical Information -->
                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Contract Type:</label>
                                                <p class="mb-0 text-dark">{{ $patient->contract_type ?? 'N/A' }}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Contract Amount:</label>
                                                <p class="mb-0 text-dark">{{ $patient->contract_amount ? number_format($patient->contract_amount, 2) . ' ৳' : 'N/A' }}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Procedure Type:</label>
                                                <p class="mb-0 text-dark">{{ $patient->procedure_type ?? 'N/A' }}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Medicine Package:</label>
                                                <p class="mb-0 text-dark">{{ $patient->medicine_package == 'Package' ? 'Package' : 'Non-Package' }}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Diseases:</label>
                                                <p class="mb-0 text-dark">{{ $patient->disease->name }}</p>
                                            </div>

                                            <!-- Bed Booking Information -->
                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Bed Booked Date:</label>
                                                <p class="mb-0 text-dark">{{ \Carbon\Carbon::parse($patient->bed_booked_date ?? now())->format('d M, Y') }}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Bed Number:</label>
                                                <p class="mb-0 text-dark">{{ $patient->bed->bed_number ?? 'N/A' }} - {{ $patient->bed->ward ?? '' }}</p>
                                            </div>

                                            <div class="col-md-3">
                                                <label class="fw-semibold text-muted">Bed Cost:</label>
                                                <p class="mb-0 text-dark">{{ isset($patient->bed->price_per_day) ? number_format($patient->bed->price_per_day, 2) . ' ৳' : '0 ৳' }}</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <form action="{{route('bil.modify', $billPrepared->id)}}" method="POST">
                                @csrf
                                <!-- RIGHT COLUMN -->
                                <div class="col-xl-12 col-md-12">
                                    <div class="card shadow-sm border-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Billing Summary Modify</h6>
                                        </div>
                                        <div class="row">
                                            <div class="col-6">
                                                <div class="card-body p-2">
                                                    <table class="table table-bordered table-sm mb-2">
                                                        <tbody>
                                                            <tr><td>Bed Cost</td><td><input type="number" min="0" name="general_bed" class="form-control form-control-sm calc-field" value="{{$billPrepared->general_bed ?? '0'}}" readonly></td></tr>
                                                            <tr><td>Cabin Fee</td><td><input type="number" min="0" name="cabin_fee" class="form-control form-control-sm calc-field" value="{{$billPrepared->cabin_fee ?? '0'}}"></td></tr>
                                                            <tr><td>Doctor’s Fee</td><td><input type="number" min="0" name="doctor_fee" class="form-control form-control-sm calc-field" value="{{$billPrepared->doctor_fee ?? '0'}}"></td></tr>
                                                            <tr><td>Service Charge</td><td><input type="number" min="0" name="service_charge" class="form-control form-control-sm calc-field" value="{{$billPrepared->service_charge ?? '0'}}"></td></tr>
                                                            <tr><td>O.T Medicine</td><td><input type="number" min="0" name="ot_medicine" class="form-control form-control-sm calc-field" value="{{$billPrepared->ot_medicine ?? '0'}}"></td></tr>
                                                            <tr><td>Oral Medicine</td><td><input type="number" min="0" name="oral_medicine" class="form-control form-control-sm calc-field" value="{{$billPrepared->oral_medicine ?? '0'}}"></td></tr>
                                                            <tr><td>Others</td><td><input type="number" min="0" name="others" class="form-control form-control-sm calc-field" value="{{$billPrepared->others ?? '0'}}"></td></tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>

                                            <div class="col-6">
                                                <div class="card-body p-2">
                                                    <table class="table table-bordered table-sm">
                                                        <tbody>
                                                            <tr><td>Contract Amount</td><td><input type="number" min="0" name="contract_amount" class="form-control form-control-sm" value="{{$billPrepared->contract_amount}}" readonly></td></tr>
                                                            <tr><td>Total Cost</td><td><input type="number" min="0" name="total_cost" class="form-control form-control-sm" value="{{$billPrepared->total_cost}}" readonly></td></tr>
                                                            <tr><td>Discount</td><td><input type="number" min="0" name="discount" class="form-control form-control-sm" value="{{$billPrepared->discount}}"></td></tr>
                                                            <tr><td>Advance Paid</td><td><input type="number" min="0" name="advance_paid" class="form-control form-control-sm" value="{{$billPrepared->advance_paid}}" readonly></td></tr>
                                                            <tr><td>Payable</td><td><input type="number" min="0" name="payable_amount" class="form-control form-control-sm text-end text-success fw-bold" value="{{$billPrepared->payable_amount}}" readonly></td></tr>
                                                            <tr><td>Paid</td><td><input type="number" min="0" name="paid_amount" class="form-control form-control-sm text-end text-success fw-bold" value="{{$billPrepared->paid_amount}}"></td></tr>
                                                            <tr><td>Remaining Due</td><td><input type="number" min="0" name="remaining_due" class="form-control form-control-sm text-end text-danger fw-bold" value="{{$billPrepared->remaining_due}}" readonly></td></tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="row g-2">
                                                <div class="col-8">
                                                    <div class="col-12 d-flex justify-content-between">
                                                        <input type="submit" class="btn btn-outline-success w-100" value="Modify Bill" onclick="return confirm('Are you sure you want to modify this bill?');">
                                                    </div>
                                                </div>
                                                <div class="col-4">
                                                    <div class="col-12 d-flex justify-content-between">
                                                        <button  class="btn btn-outline-warning w-100"> Cancel</button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>                                    
                                </div>
                            </form>
                        </div>

                    </div>
                </section>
            </div>

            @include('layouts.footer')
        </div>
    </div>

    
    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>  

    <script>

        window.onload = function () {
            @if(session('success'))
                const reg = "{{ session('reg') }}";
                const printUrl = `{{ url('/indoors/print-admit/bill') }}/${reg}`;
                window.open(printUrl, '_blank');
            @endif
        };

        document.addEventListener('DOMContentLoaded', function() {
            const calcFields = document.querySelectorAll('.calc-field');
            const totalCostInput = document.querySelector('input[name="total_cost"]');
            const discountInput = document.querySelector('input[name="discount"]');
            const advancePaidInput = document.querySelector('input[name="advance_paid"]');
            const payableInput = document.querySelector('input[name="payable_amount"]');
            const paidInput = document.querySelector('input[name="paid_amount"]');
            const remainingDueInput = document.querySelector('input[name="remaining_due"]');

            function calculateTotals() {
                let totalCost = 0;

                // Sum all charge fields
                calcFields.forEach(field => {
                    totalCost += parseFloat(field.value) || 0;
                });

                totalCostInput.value = totalCost.toFixed(2);

                // Calculate payable after discount and advance
                let discount = parseFloat(discountInput.value) || 0;
                let advance = parseFloat(advancePaidInput.value) || 0;
                let payable = totalCost - discount - advance;
                payable = payable < 0 ? 0 : payable; // negative avoid
                payableInput.value = payable.toFixed(2);

                // Calculate remaining due after paid
                let paid = parseFloat(paidInput.value) || 0;
                let remainingDue = payable - paid;
                remainingDue = remainingDue < 0 ? 0 : remainingDue; // negative avoid
                remainingDueInput.value = remainingDue.toFixed(2);
            }

            // Listen for changes
            calcFields.forEach(field => field.addEventListener('input', calculateTotals));
            discountInput.addEventListener('input', calculateTotals);
            advancePaidInput.addEventListener('input', calculateTotals);
            paidInput.addEventListener('input', calculateTotals);

            // Initial calculation
            calculateTotals();
        });

    </script>


</body>
</html>