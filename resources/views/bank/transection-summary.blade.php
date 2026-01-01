<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Bank Details - {{ $company->name ?? 'HMS' }}</title>

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
            <div class="page-heading">
                <h3>Bank Balance Details</h3>
            </div>
            <div class="page-content rounded">
                <section class="">   
                    <!-- <div class="card-header bg-white d-flex justify-content-between align-items-center">
                        <h4 class="card-title mb-0 fw-semibold">                                
                            <span>Bank Details</span>
                        </h4>
                        <div class="btn-group">
                            <a href="{{ route('print-total-transection') }}" target="_blank" class="btn btn-outline-primary">
                                <i class="bi bi-printer me-2"></i> Print
                            </a>
                        </div>                            
                    </div> -->
                    <div class="row g-4 mb-4">
                        @forelse($bankSummaries as $bank)
                            <div class="col-md-4">
                                <div class="card shadow-lg border-0 h-100">
                                    <div class="card-body">
                                        <div class="d-flex justify-content-between align-items-start">
                                            <div>
                                                <h5 class="card-title fw-bold mb-1">{{ $bank['bank_name'] }}</h5>
                                                <small class="text-muted">{{ $bank['branch_name'] }} | A/C: {{ $bank['account_number'] }}</small>
                                            </div>
                                            <i class="bi bi-bank fs-2 text-primary"></i>
                                        </div>
                                        <hr>
                                        <div class="d-flex justify-content-between mt-2">
                                            <div>
                                                <small class="text-muted">Total Deposit</small>
                                                <div class="fw-bold text-success">৳ {{ number_format($bank['totalDeposit'], 2) }} tk</div>
                                            </div>
                                            <div>
                                                <small class="text-muted">Total Withdraw</small>
                                                <div class="fw-bold text-danger">৳ {{ number_format($bank['totalWithdraw'], 2) }} tk</div>
                                            </div>
                                            <div>
                                                <small class="text-muted">Balance</small>
                                                <div class="fw-bold text-primary">৳ {{ number_format($bank['balance'], 2) }} tk</div>
                                            </div>
                                        </div>

                                        <div class="mt-3">
                                            <a href="{{ route('bank-transection', $bank['id']) }}" class="btn btn-outline-primary btn-sm">
                                                <i class="bi bi-eye me-1"></i> View Transactions
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        @empty
                            <div class="col-12 text-center text-muted">
                                <i class="bi bi-bank fs-3 d-block mb-2"></i>
                                No bank accounts found
                            </div>
                        @endforelse
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