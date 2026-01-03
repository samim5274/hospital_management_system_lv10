<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>TTS Details - {{ $company->name ?? 'HMS' }}</title>

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
                <h3>Daily Total Transection Summary (T.T.S)</h3>
            </div>
            <div class="page-content">                

                <div class="">
                    <div class="d-flex justify-content-end mb-3">
                        <a href="{{ route('print.total.tramsaction.summary') }}" target="_blank" class="btn btn-light btn-lg shadow-lg">
                            <i class="bi bi-printer me-2"></i> Print
                        </a>
                    </div>
                    <div class="row g-3">

                        <!-- Total Hand Cash -->
                        <div class="col-md-6">
                            <div class="card shadow-sm text-white bg-warning">
                                <div class="card-body text-center">
                                    <i class="bi bi-wallet2 fs-2 mb-2"></i>
                                    <h6 class="card-title fw-bold">Total Hand Cash</h6>
                                    <p class="fs-5 fw-bold mb-0">৳{{ number_format($totalHandCash ?? 0, 2) }}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Bank Balance -->
                        <div class="col-md-6">
                            <div class="card shadow-sm text-white bg-info">
                                <div class="card-body text-center">
                                    <i class="bi bi-bank fs-2 mb-2"></i>
                                    <h6 class="card-title fw-bold">Bank Balance</h6>
                                    <p class="fs-5 fw-bold mb-0">৳{{ number_format($totalBankBalance ?? 0, 2) }}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Outdoor Test Sale -->
                        <div class="col-md-3">
                            <div class="card shadow-sm border-primary">
                                <div class="card-body text-center">
                                    <i class="bi bi-file-medical fs-2 mb-2 text-primary"></i>
                                    <h6 class="fw-bold">Outdoor Sale</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTestSale,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-primary">
                                <div class="card-body text-center">
                                    <i class="bi bi-percent fs-2 mb-2 text-primary"></i>
                                    <h6 class="fw-bold">Outdoor Discount</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTestDiscount,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-primary">
                                <div class="card-body text-center">
                                    <i class="bi bi-cash-stack fs-2 mb-2 text-primary"></i>
                                    <h6 class="fw-bold">Outdoor Paid</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTestPay,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-primary">
                                <div class="card-body text-center">
                                    <i class="bi bi-exclamation-triangle fs-2 mb-2 text-primary"></i>
                                    <h6 class="fw-bold">Outdoor Due</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTestDue,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Ticket Sales -->
                        <div class="col-md-3">
                            <div class="card shadow-sm border-success">
                                <div class="card-body text-center">
                                    <i class="bi bi-ticket-perforated fs-2 mb-2 text-success"></i>
                                    <h6 class="fw-bold">Ticket Amount</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTicketAmount,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-success">
                                <div class="card-body text-center">
                                    <i class="bi bi-percent fs-2 mb-2 text-success"></i>
                                    <h6 class="fw-bold">Ticket Discount</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTicketDiscount,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-success">
                                <div class="card-body text-center">
                                    <i class="bi bi-cash-stack fs-2 mb-2 text-success"></i>
                                    <h6 class="fw-bold">Ticket Paid</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTicketPay,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-success">
                                <div class="card-body text-center">
                                    <i class="bi bi-exclamation-triangle fs-2 mb-2 text-success"></i>
                                    <h6 class="fw-bold">Ticket Due</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalTicketDue,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Expenses & Income -->
                        <div class="col-md-3">
                            <div class="card shadow-sm border-warning">
                                <div class="card-body text-center">
                                    <i class="bi bi-wallet2 fs-2 mb-2 text-warning"></i>
                                    <h6 class="fw-bold">Total Expenses</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalExpenses,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-warning">
                                <div class="card-body text-center">
                                    <i class="bi bi-cash-coin fs-2 mb-2 text-warning"></i>
                                    <h6 class="fw-bold">Extra Income</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalIncome,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <!-- Indoor Transactions -->
                        <div class="col-md-3">
                            <div class="card shadow-sm border-danger">
                                <div class="card-body text-center">
                                    <i class="bi bi-hospital fs-2 mb-2 text-danger"></i>
                                    <h6 class="fw-bold">Indoor Total Cost</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalIndoorCost,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-danger">
                                <div class="card-body text-center">
                                    <i class="bi bi-percent fs-2 mb-2 text-danger"></i>
                                    <h6 class="fw-bold">Indoor Discount</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalIndoorDiscount,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-danger">
                                <div class="card-body text-center">
                                    <i class="bi bi-cash-stack fs-2 mb-2 text-danger"></i>
                                    <h6 class="fw-bold">Indoor Paid</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalIndoorPaid,2) }}</p>
                                </div>
                            </div>
                        </div>

                        <div class="col-md-3">
                            <div class="card shadow-sm border-danger">
                                <div class="card-body text-center">
                                    <i class="bi bi-exclamation-triangle fs-2 mb-2 text-danger"></i>
                                    <h6 class="fw-bold">Indoor Due</h6>
                                    <p class="fw-bold mb-0">৳{{ number_format($totalIndoorDue,2) }}</p>
                                </div>
                            </div>
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