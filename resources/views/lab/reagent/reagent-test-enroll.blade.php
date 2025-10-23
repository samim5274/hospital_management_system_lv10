<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Re-Agent & Test Entrollment - HMS</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=NReagento:wght@300;400;600;700;800&display=swap" rel="stylesheet">

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
                <h3 class="text-primary">Re-Agent & Test Entrollment</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Re-Agent & Test Entrollment</li>
                    </ol>
                </nav>
            </div>

            <div class="page-content">
                <section class="row">
                    <!-- LEFT COLUMN: Available Tests -->
                    <div class="col-xl-4 col-lg-4 col-md-12">
                        <div class="card shadow-sm border-0 mt-4">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center py-2">
                                <h6 class="mb-0 fw-semibold text-white">
                                    <i class="bi bi-clipboard2-pulse me-2"></i>Available Tests
                                </h6>
                                <span class="badge bg-light text-primary">{{ count($testDetails) }} tests</span>
                            </div>

                            <div class="card-body bg-light p-0" style="max-height: 700px; overflow-y: auto;">
                                <table class="table table-hover table-bordered align-middle mb-0">                                    
                                    <tbody>
                                        @forelse($testDetails as $key => $test)
                                            <tr>
                                                <td class="text-center fw-semibold">{{ $loop->iteration }}</td>
                                                <td>
                                                    <a href="{{ route('test.report.generate.view', $test->id) }}" class="text-decoration-none fw-medium text-dark">
                                                        {{ $test->testName }}
                                                    </a>
                                                </td>
                                                <td class="text-center">
                                                    <button class="btn btn-sm btn-outline-primary px-3 d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#enrollment{{$test->id}}">
                                                        <i class="fa-solid fa-sign-hanging me-1"></i> Enroll
                                                    </button>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="3" class="text-center text-muted py-3">
                                                    <i class="bi bi-exclamation-circle me-2"></i>No tests available.
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    <!-- RIGHT COLUMN: Test & Reagent details section -->                    
                    <div class="col-xl-8 col-lg-8 col-md-12">
                        <div class="card shadow-sm border-0 mt-4">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center py-2 rounded-top">
                                <h6 class="mb-0 fw-semibold text-white">
                                    <i class="fa-solid fa-vial me-2"></i>Re-Agent & Test Details
                                </h6>
                                <span class="badge bg-light text-primary">{{ count($enrolledTests) }}</span>
                            </div>

                            <div class="card-body p-3 bg-light" style="max-height: 700px; overflow-y: auto;">
                                <div class="table-responsive">
                                    <table class="table table-hover table-bordered align-middle mb-0">
                                        <tbody>
                                            @php
                                                $groupedTests = $enrolledTests->groupBy('test_id');
                                                $counter = 1;
                                            @endphp

                                            @forelse($groupedTests as $testId => $reagents)
                                                <!-- Test Header Row -->
                                                <tr class="table-primary">
                                                    <td colspan="9" class="fw-semibold">
                                                        {{ $counter }}. {{ $reagents->first()->test->testName }}
                                                    </td>
                                                </tr>

                                                <!-- Reagents for this test -->
                                                @foreach($reagents as $val)
                                                    <tr data-bs-toggle="modal" data-bs-target="#enrollmentEdit{{$val->id}}">
                                                        <td class="text-center"></td>
                                                        <td>{{ $val->reagent->name }}</td>
                                                        <td>{{ $val->reagent->generic->name }}</td>
                                                        <td>{{ $val->reagent->presentation->name }}</td>
                                                        <td class="text-center">{{ $val->quantity_required }} <small>{{ $val->reagent->unit->name }}</small></td>
                                                    </tr>

                                                    <div class="modal fade" id="enrollmentEdit{{$val->id}}" tabindex="-1" aria-labelledby="enrollmentLabel{{$test->id}}" aria-hidden="true">
                                                        <div class="modal-dialog modal-dialog-centered">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <h5 class="modal-title" id="enrollmentLabel{{$test->id}}">
                                                                        <strong>{{ $reagents->first()->test->testName }}</strong> reagent modify
                                                                    </h5>
                                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                                </div>

                                                                <form action="{{route('modify.enrolled.reagent.test', $val->id)}}" method="POST">
                                                                    @csrf
                                                                    <div class="modal-body">
                                                                        <input type="hidden" name="test_id" value="{{ $test->id }}">
                                                                        <div class="row g-3 align-items-end">

                                                                            <div class="col-md-6">
                                                                                <label class="form-label">Reagent <span class="text-danger">*</span></label>
                                                                                <select name="cbxReagent" class="form-select form-select-sm" required>
                                                                                    <option selected disabled>-- Select Reagent --</option>
                                                                                    @foreach($reagentsList as $reagent)
                                                                                        <option value="{{ $reagent->id }}" @if($reagent->id == $val->reagent_id) selected @endif>
                                                                                            {{ $reagent->name }}
                                                                                        </option>
                                                                                    @endforeach
                                                                                </select>
                                                                            </div>

                                                                            <div class="col-md-6">
                                                                                <label class="form-label">Qty <span class="text-danger">*</span></label>
                                                                                <input type="number" name="qty" min="0.1" step="0.1" class="form-control form-control-sm" placeholder="Enter quantity" value="{{$val->quantity_required}}" required>
                                                                            </div>

                                                                        </div>
                                                                    </div>

                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                                    </div>
                                                                </form>

                                                            </div>
                                                        </div>
                                                    </div>

                                                @endforeach

                                                @php $counter++; @endphp
                                            @empty
                                                <tr>
                                                    <td colspan="9" class="text-center text-muted py-3">
                                                        <i class="fa-solid fa-circle-info me-1"></i> No enrolled reagents.
                                                    </td>
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

            <!-- enrollment modal -->
            @forelse($testDetails as $key => $test)
            <div class="modal fade" id="enrollment{{$test->id}}" tabindex="-1" aria-labelledby="enrollmentLabel" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="enrollmentLabel"><strong>{{ $test->testName }} </strong> reagent set up</h5>
                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                        </div>

                        <form action="{{route('enroll.reagent.test')}}" method="POST">
                            @csrf
                            <div class="modal-body">
                                <input type="hidden" name="test_id" value="{{ $test->id }}">

                                <div class="row g-3 align-items-end">
                                    
                                    <div class="col-md-6">
                                        <label class="form-label">Reagent <span class="text-danger">*</span></label>
                                        <select name="cbxReagent" class="form-select form-select-sm" required>
                                            <option selected disabled>-- Select Reagent --</option>
                                            @foreach($reagentsList as $val)
                                                <option value="{{ $val->id }}">
                                                    {{ $val->name }} - ({{ $val->generic->name }} - {{ $val->presentation->name }}) - (Qty: {{ $val->min_qty }})
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Qty <span class="text-danger">*</span></label>
                                        <input type="number" name="qty" id="qty" min="0.1" step="0.1" class="form-control form-control-sm" placeholder="Enter quantity" required>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                <button type="submit" class="btn btn-primary">Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            @empty
                <tr>
                    <td colspan="3" class="text-center text-muted py-3">
                        <i class="bi bi-exclamation-circle me-2"></i>No tests available.
                    </td>
                </tr>
            @endforelse
            <!-- End enrollment modal -->
            @include('layouts.footer')
        </div>
    </div>

    
    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>  

</body>
</html>