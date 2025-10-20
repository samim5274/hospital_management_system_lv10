<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab - HMS</title>

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
                <h2>Lab Report Generate</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/labs/reports')}}">Patient List</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Report Generate</li>
                    </ol>
                </nav>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="card mb-3 shadow-sm">
                        <div class="card-header bg-primary text-white fw-semibold">
                            Patient Information
                        </div>
                        <div class="card-body" id="invoice-content">
                            <div class="row g-3 my-2">
                                {{-- Name --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Name:</div>
                                    <div>{{ $patient->name ?? '-' }}</div>
                                </div>

                                {{-- Date of Birth --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Date of Birth:</div>
                                    <div>{{ $patient->dob ? \Carbon\Carbon::parse($patient->dob)->format('d-M-Y') : '-' }}</div>
                                </div>

                                {{-- Gender --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Gender:</div>
                                    <div>{{ $patient->gender ?? '-' }}</div>
                                </div>

                                {{-- Phone --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Phone:</div>
                                    <div>0{{ $patient->phone ?? '-' }}</div>
                                </div>

                                {{-- Address --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Address:</div>
                                    <div>{{ $patient->address ?? '-' }}</div>
                                </div>

                                {{-- Doctor --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Doctor:</div>
                                    <div>{{ $patient->doctor->name ?? '-' }}</div>
                                </div>

                                {{-- Referral --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Reference:</div>
                                    <div>{{ $patient->reference->name ?? '-' }}</div>
                                </div>

                                {{-- Date --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Date:</div>
                                    <div>{{ $patient->date ? \Carbon\Carbon::parse($patient->date)->format('d-M-Y') : '-' }}</div>
                                </div>

                                {{-- Referral --}}
                                <div class="col-md-4 col-6">
                                    <div class="fw-bold">Billint Officer:</div>
                                    <div>{{ $patient->user->name ?? '-' }}</div>
                                </div>
                            </div>


                            {{-- Test Table --}}
                            @php
                                $testData = \App\Models\StoreTest::with('test')->where('regNum', $patient->reg)->get();
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
                                        {{-- Test Items --}}
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

                                        {{-- Divider --}}
                                        <tr class="table-secondary">
                                            <td colspan="3"></td>
                                        </tr>

                                        {{-- Payment Summary --}}
                                        <tr>
                                            <td colspan="2" class="fw-semibold text-end">Total:</td>
                                            <td class="text-end">৳{{ number_format($patient->total ?? 0, 2) }}/-</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="fw-semibold text-end">Discount:</td>
                                            <td class="text-end">৳{{ number_format($patient->discount ?? 0, 2) }}/-</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="fw-semibold text-end">Payable:</td>
                                            <td class="text-end">৳{{ number_format($patient->payable ?? 0, 2) }}/-</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="fw-semibold text-end">Received:</td>
                                            <td class="text-end">৳{{ number_format($patient->pay ?? 0, 2) }}/-</td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" class="fw-semibold text-end text-danger">Due:</td>
                                            <td class="text-end text-danger">৳{{ number_format($patient->due ?? 0, 2) }}/-</td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>

                    {{-- Test Reports --}}
                    <div class="card mb-3 shadow-sm">
                        <div class="card-header bg-success text-white fw-semibold">
                            Test Reports
                        </div>
                        <div class="card-body p-0">
                            @if($testReports->isNotEmpty())
                            <div class="table-responsive">
                                <table class="table table-bordered table-hover table-sm mb-0">
                                    <thead class="table-light text-center" style="font-size: 0.85rem;">
                                        <tr>
                                            <th style="width: 3%;">#</th>
                                            <th style="width: 30%;">Part of Test</th>
                                            <th style="width: 10%;">Result</th>
                                            <th style="width: 10%;">Unit</th>
                                            <th style="width: 10%;">Reference Value</th>
                                            <th style="width: 10%;">Reference Value of Hormone</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @foreach($testReports as $testId => $reports)
                                            {{-- Test Name Header --}}
                                            <tr class="table-primary">
                                                <td colspan="6" class="fw-bold">
                                                    {{ optional($reports->first()->test)->testName ?? 'Unknown Test' }}
                                                </td>
                                            </tr>

                                            {{-- Test Parts --}}
                                            @foreach($reports as $report)
                                            <tr data-bs-toggle="modal" data-bs-target="#modalReport{{$report->id}}">
                                                <td class="text-center">{{ $loop->iteration }}</td>
                                                <td>{{ $report->part_of_test }}</td>
                                                <td class="text-center fw-semibold text-success">{{ $report->result ?? 'Pending' }}</td>
                                                <td class="text-center">{{ $report->unit ?? '-' }}</td>
                                                <td class="text-center text-muted">{{ $report->reference_value ?? '-' }}</td>
                                                <td class="text-center text-muted">{{ $report->ref_value_of_hormone ?? '-' }}</td>
                                            </tr>
                                            @endforeach
                                        @endforeach
                                    </tbody>
                                </table>
                            </div>
                            @else
                            <p class="text-center text-muted py-2">No test reports available for this patient.</p>
                            @endif
                        </div>
                    </div>
                </section>
            </div>

            @foreach($testReports as $reports)
                @foreach($reports as $detail)
                <div class="modal fade" id="modalReport{{$detail->id}}" tabindex="-1" aria-hidden="true">
                    <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable">
                        <div class="modal-content">

                            <div class="modal-header">
                                <h5 class="modal-title">{{ optional($detail->test)->testName ?? 'Unknown Test' }}</h5>
                                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                            </div>

                            <form action="#" method="POST">
                                @csrf
                                <div class="modal-body">
                                    <div class="row g-3">
                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold">Part of Test</label>
                                            <input type="text" name="part_of_test" class="form-control" value="{{ $detail->part_of_test }}">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold">Result</label>
                                            <input type="text" name="result" class="form-control" value="{{ $detail->result }}">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold">Unit</label>
                                            <input type="text" name="unit" class="form-control" value="{{ $detail->unit }}">
                                        </div>
                                        <div class="col-md-6">
                                            <label class="form-label fw-semibold">Reference Value</label>
                                            <input type="text" name="reference_value" class="form-control" value="{{ $detail->reference_value }}">
                                        </div>
                                        <div class="col-md-12">
                                            <label class="form-label fw-semibold">Reference Value of Hormone</label>
                                            <input type="text" name="ref_value_of_hormone" class="form-control" value="{{ $detail->ref_value_of_hormone }}">
                                        </div>
                                    </div>
                                </div>

                                <div class="modal-footer bg-light py-2">
                                    <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">Close</button>
                                    <button type="submit" class="btn btn-primary btn-sm">Save Changes</button>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
                @endforeach
            @endforeach


            @include('layouts.footer')
        </div>
    </div>    
    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

</body>

</html>