<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Lab Report - HMS</title>

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
                <h2>Lab Test Details</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="/labs">Test List</a></li>
                        <li class="breadcrumb-item active" aria-current="page">{{ $testReportDetails[0]->test->testName ?? '0' }} - Report Details</li>
                    </ol>
                </nav>
            </div>
            <div class="page-content">
                <section class="row">                    
                    <div class="container py-4">
                        <div class="card shadow-sm border-0">                            
                            <div class="card-body p-0">
                                @if($testReportDetails->isEmpty())
                                    <div class="p-4 text-center text-muted">
                                        <i class="bi bi-info-circle"></i> No test report details found.
                                    </div>
                                @else
                                    <div class="table-responsive shadow-sm rounded">
                                        <table class="table table-bordered table-striped table-sm mb-0 align-middle">
                                            <thead class="bg-primary text-white">
                                                <tr>
                                                    <th style="width:5%">#</th>
                                                    <th style="width:25%">Part of Test</th>
                                                    <th style="width:20%" class="text-center">Result</th>
                                                    <th style="width:10%" class="text-center">Unit</th>
                                                    <th style="width:20%" class="text-center">Reference Value</th>
                                                    <th style="width:20%" class="text-center">Hormone Value</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse($testReportDetails as $detail)
                                                <tr data-bs-toggle="modal" data-bs-target="#exampleModalCenter{{$detail->id}}">
                                                    <td class="text-center">{{ $loop->iteration }}</td>
                                                    <td>{{ $detail->part_of_test }}</td>
                                                    <td class="text-center fw-semibold text-success">{{ $detail->result ?? '—' }}</td>
                                                    <td class="text-center">{{ $detail->unit ?? '—' }}</td>
                                                    <td class="text-center text-muted">{{ $detail->reference_value ?? '—' }}</td>
                                                    <td class="text-center text-muted">{{ $detail->ref_value_of_hormone ?? '—' }}</td>
                                                </tr>
                                                @empty
                                                <tr>
                                                    <td colspan="5" class="text-center text-muted py-3">
                                                        <i class="bi bi-info-circle"></i> No test report details found.
                                                    </td>
                                                </tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
                                @endif
                            </div>
                            <button class="btn btn-outline-success" data-bs-toggle="modal" data-bs-target="#exampleModalCenter"><i class="fa-solid fa-calendar-plus"></i> New</button>
                        </div>
                    </div>

                    <!-- Vertically Centered modal Modal -->
                    @foreach($testReportDetails as $detail)
                    <div class="modal fade" id="exampleModalCenter{{$detail->id}}" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                            role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">{{ $testReportDetails[0]->test->testName ?? '0' }}</h5>
                                    <button type="button" class="close" data-bs-dismiss="modal"
                                        aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="{{ route('test.report.edit', $detail->id) }}" method="POST">
                                        @csrf
                                        <div class="modal-body">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Part of Test</label>
                                                    <input type="text" name="part_of_test" class="form-control"
                                                        value="{{ $detail->part_of_test }}">
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Result</label>
                                                    <input type="text" name="result" class="form-control"
                                                        value="{{ $detail->result }}">
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Unit</label>
                                                    <input type="text" name="unit" class="form-control"
                                                        value="{{ $detail->unit }}">
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Reference Value</label>
                                                    <input type="text" name="reference_value" class="form-control"
                                                        value="{{ $detail->reference_value }}">
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="form-label fw-semibold">Reference Value of Hormone (if any)</label>
                                                    <input type="text" name="ref_value_of_hormone" class="form-control"
                                                        value="{{ $detail->ref_value_of_hormone }}">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer bg-light py-2">
                                            <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary btn-sm">
                                                Save Changes
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                    @endforeach

                    <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                        aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                        <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                            role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalCenterTitle">{{ $labTest->testName ?? '0' }}</h5>
                                    <button type="button" class="close" data-bs-dismiss="modal"
                                        aria-label="Close">
                                        <i data-feather="x"></i>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <form action="{{ route('test.report.part.add', $labTest->id) }}" method="POST">
                                        @csrf
                                        <div class="modal-body">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Part of Test</label>
                                                    <input type="text" name="part_of_test" class="form-control">
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Result</label>
                                                    <input type="text" name="result" class="form-control">
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Unit</label>
                                                    <input type="text" name="unit" class="form-control">
                                                </div>

                                                <div class="col-md-6">
                                                    <label class="form-label fw-semibold">Reference Value</label>
                                                    <input type="text" name="reference_value" class="form-control">
                                                </div>

                                                <div class="col-md-12">
                                                    <label class="form-label fw-semibold">Reference Value of Hormone (if any)</label>
                                                    <input type="text" name="ref_value_of_hormone" class="form-control">
                                                </div>
                                            </div>
                                        </div>

                                        <div class="modal-footer bg-light py-2">
                                            <button type="button" class="btn btn-secondary btn-sm" data-bs-dismiss="modal">
                                                Close
                                            </button>
                                            <button type="submit" class="btn btn-primary btn-sm">
                                                Save Changes
                                            </button>
                                        </div>
                                    </form>
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
    <script src="{{ asset('assets/js/main.js') }}"></script>

</body>

</html>