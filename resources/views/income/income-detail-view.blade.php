<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Income Details - {{ $company->name ?? 'HMS' }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconly/bold.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/bootstrap-icons/bootstrap-icons.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
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
            <div class="page-content bg-light p-4">
                <div class="container">

                    <!-- Company Header -->
                    <div class="text-center mb-4">
                        <img src="{{ asset('assets/images/logo/main-logo.png') }}" alt="Logo" height="80" class="mb-2">                        
                        <h2 class="fw-bold">{{ $company->name }}</h2>
                        <p class="mb-0">{{ $company->address }}</p>
                        <p class="mb-0">
                            {{ $company->email }} | {{ $company->phone }} | {{ $company->website }}
                        </p>
                        <hr class="my-3">
                    </div>

                    <div class="card shadow-sm border-0 mb-4">
                        <!-- Card Header -->
                        <div class="card-header d-flex justify-content-between align-items-center bg-white">
                            <h5 class="mb-0 d-flex align-items-center">
                                Expense Summary
                            </h5>

                            <div class="btn-group btn-group-sm">  
                                <a href="{{ url()->previous() }}" class="btn btn-outline-secondary" title="back">
                                    <i class="bi bi-arrow-90deg-left me-3"></i> Back
                                </a>                              
                                <a href="{{ route('incomes.print', $income->id) }}" target="_blank" class="btn btn-outline-secondary" title="Print">
                                    <i class="bi bi-printer me-3"></i> Print
                                </a>
                            </div>
                        </div>

                        <!-- Card Body -->
                        <div class="card-body">
                            <div class="row mb-2">
                                <div class="col-md-4 fw-semibold">Title:</div>
                                <div class="col-md-8">{{ $income->title }}</div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-4 fw-semibold">Date:</div>
                                <div class="col-md-8">
                                    <span class="badge bg-light text-dark">
                                        {{ \Carbon\Carbon::parse($income->date)->format('d M Y') }}
                                    </span>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-4 fw-semibold">Category:</div>
                                <div class="col-md-8">
                                    <span class="badge bg-info text-white">{{ $income->category->name ?? 'N/A' }}</span>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-4 fw-semibold">Sub-Category:</div>
                                <div class="col-md-8">
                                    <span class="badge bg-secondary text-white">{{ $income->subcategory->name ?? 'N/A' }}</span>
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-4 fw-semibold">Amount:</div>
                                <div class="col-md-8 fw-bold text-success h5">
                                    ৳ {{ number_format($income->amount, 2) }}
                                </div>
                            </div>

                            <div class="row mb-2">
                                <div class="col-md-4 fw-semibold">Billing by:</div>
                                <div class="col-md-8">
                                    <span class="badge bg-warning text-dark">
                                        {{ $income->user->name }}
                                    </span>
                                </div>
                            </div>

                            @if($income->description)
                            <div class="row mb-2">
                                <div class="col-md-4 fw-semibold">Remark:</div>
                                <div class="col-md-8">{{ $income->description }}</div>
                            </div>
                            @endif
                        </div>
                    </div>


                </div>
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