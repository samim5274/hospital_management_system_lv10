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

            <div class="page-heading mb-3">
                <h2>Lab Test Details</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Test Details</li>
                    </ol>
                </nav>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card shadow-sm border-0 mt-4">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center py-2">
                                <h6 class="mb-0 fw-semibold text-white"><i class="bi bi-clipboard2-pulse me-2"></i>Available Tests</h6>
                                <span class="badge bg-light text-primary">{{ count($testDetails) }} tests</span>
                            </div>

                            <div class="card-body bg-light p-0" style="max-height: 700px; overflow-y: auto;">
                                <table class="table table-hover table-bordered align-middle mb-0">
                                    <thead class="table-primary sticky-top">
                                        <tr>
                                            <th style="width: 50px;">#</th>
                                            <th>Test Name</th>
                                            <th style="width: 70px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($testDetails as $key => $test)
                                            <tr>
                                                <td class="text-center fw-semibold">{{ $loop->iteration }}</td>
                                                <td class="text-start"><a href="{{ route('test.report.generate.view', $test->id) }}">{{ $test->testName }}</a></td>
                                                <td class="text-center">
                                                    <a href="{{ route('test.report.generate.view', $test->id) }}" class="btn btn-sm btn-outline-success">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="4" class="text-center text-muted py-3">
                                                    <i class="bi bi-exclamation-circle me-2"></i>No tests available.
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                </table>
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