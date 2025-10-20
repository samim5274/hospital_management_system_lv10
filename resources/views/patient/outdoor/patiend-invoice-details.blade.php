<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details - HMS</title>

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

            <div class="page-content">
                <section class="row justify-content-center">
                    <div class="col-12 col-lg-10">
                        <div class="card shadow border-0">
                            {{-- Header --}}
                            <div class="card-header bg-primary text-white text-center">
                                <h4 class="mb-0 text-white">Patient - {{ $patientData->name ?? '-' }}</h4>
                                <small class="d-block mt-1">Invoice : {{ $patientData->reg ?? '-' }}</small>
                            </div>

                            {{-- Print Button --}}
                            <div class="text-end p-2">
                                <a href="{{url('/patients/print-invoice/'.$patientData->reg)}}" target="_blank" class="btn btn-sm btn-outline-success">
                                    <i class="fa-solid fa-print"></i> Print Invoice
                                </a>
                            </div>

                            {{-- Patient Info --}}
                            <div class="card-body" id="invoice-content">
                                <div class="row g-3 mb-3">
                                    <div class="col-md-4 col-6">
                                        <div class="fw-bold">Phone:</div>
                                        <div>0{{ $patientData->phone ?? '-' }}</div>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <div class="fw-bold">Date:</div>
                                        <div>{{ \Carbon\Carbon::parse($patientData->date)->format('d-M-Y') }}</div>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <div class="fw-bold">Total:</div>
                                        <div>৳{{ number_format($patientData->total, 2) }}/-</div>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <div class="fw-bold">Discount:</div>
                                        <div>৳{{ number_format($patientData->discount, 2) }}/-</div>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <div class="fw-bold">Payable:</div>
                                        <div>৳{{ number_format($patientData->payable, 2) }}/-</div>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <div class="fw-bold">Received:</div>
                                        <div>৳{{ number_format($patientData->pay ?? 0, 2) }}/-</div>
                                    </div>
                                    <div class="col-md-4 col-6">
                                        <div class="fw-bold">Due:</div>
                                        <div>৳{{ number_format($patientData->due ?? 0, 2) }}/-</div>
                                    </div>
                                </div>

                                {{-- Test Table --}}
                                @php
                                    $testData = \App\Models\StoreTest::with('test')->where('regNum', $patientData->reg)->get();
                                @endphp
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered align-middle">
                                        <thead class="table-light text-center">
                                            <tr>
                                                <th style="width: 10%;">#</th>
                                                <th class="text-start">Test Name</th>
                                                <th style="width: 30%;" class="text-end">Price (৳)</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse($testData as $key => $test)
                                            <tr>
                                                <td class="text-center">{{ $key + 1 }}</td>
                                                <td class="text-start">{{ $test->test->testName ?? '-' }}</td>
                                                <td class="text-end">৳{{ number_format($test->test->testPrice ?? 0, 2) }}/-</td>
                                            </tr>
                                            @empty
                                            <tr>
                                                <td colspan="3" class="text-center text-muted">No tests found</td>
                                            </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>
                            </div>
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
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

</body>

</html>