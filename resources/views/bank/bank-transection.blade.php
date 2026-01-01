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
                <h3>{{ $transections[0]->bank->bank_name }} Transection Details</h3>
            </div>
            <div class="page-content bg-white p-4 rounded">
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card shadow-lg border-0 text-center p-3">
                            <div class="card-body">
                                <i class="bi bi-cash-stack fs-2 text-success mb-2"></i>
                                <h6 class="text-muted mb-2">Total Deposit</h6>
                                <div class="fs-4 fw-bold text-success">
                                    ৳ {{ number_format($totalDepositAll, 2) }}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card shadow-lg border-0 text-center p-3">
                            <div class="card-body">
                                <i class="bi bi-cash-coin fs-2 text-danger mb-2"></i>
                                <h6 class="text-muted mb-2">Total Withdraw</h6>
                                <div class="fs-4 fw-bold text-danger">
                                    ৳ {{ number_format($totalWithdrawAll, 2) }}
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-md-4">
                        <div class="card shadow-lg border-0 text-center p-3">
                            <div class="card-body">
                                <i class="bi bi-bank fs-2 text-primary mb-2"></i>
                                <h6 class="text-muted mb-2">Total Balance</h6>
                                <div class="fs-4 fw-bold text-primary">
                                    ৳ {{ number_format($totalBalanceAll, 2) }}
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <section class="row">                    
                    <div class="mb-0 shadow-sm border-0">
                        <!-- Card Header -->
                        <div class="card-header bg-white d-flex justify-content-between align-items-center">
                            <h4 class="card-title mb-0 fw-semibold">
                                <i class="bi bi-journal-plus me-2 text-primary"></i>
                                <span>Transection Details</span>
                                <span class="badge bg-light text-dark">
                                    {{ $transections->count() }} transection
                                </span> 
                            </h4>
                            <div class="btn-group">                                
                                <a href="{{ route('print-bank-total-transection', $transections[0]->bank_id) }}" target="_blank" class="btn btn-outline-primary">
                                    <i class="bi bi-printer me-2"></i> Print
                                </a>
                            </div>                            
                        </div>

                        <!-- Card Body -->
                        <div class="card-body p-0">
                            <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
                                <table class="table table-hover align-middle mb-0" id="bankTransactionsTable">
                                    <thead class="table-light">
                                        <tr>
                                            <th>#</th>
                                            <th>Bank</th>
                                            <th>User</th>
                                            <th>Amount</th>
                                            <th>Date</th>
                                            <th>Status</th>
                                            <!-- <th>Remarks</th> -->
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        @forelse($transections as $key => $txn)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td>
                                                    <div class="fw-semibold">{{ $txn->bank->bank_name ?? 'N/A' }}</div>
                                                    <small class="text-muted">{{ $txn->bank->branch_name ?? '' }}</small>
                                                </td>
                                                <td>
                                                    <div class="fw-semibold">{{ $txn->user->name ?? 'N/A' }}</div>
                                                    <small class="text-muted">{{ $txn->user->email ?? '' }}</small>
                                                </td>
                                                <td class="text-end fw-bold text-success">
                                                    ৳ {{ number_format($txn->amount, 2) }} tk
                                                </td>
                                                <td>{{ \Carbon\Carbon::parse($txn->date)->format('d M Y') }}</td>
                                                <td>
                                                    @if($txn->status === 'deposit')
                                                        <span class="badge bg-success">Diposit</span>
                                                    @elseif($txn->status === 'withdraw')
                                                        <span class="badge bg-warning text-dark">Withdraw</span>
                                                    @else
                                                        <span class="badge bg-secondary">N/A</span>
                                                    @endif
                                                </td>
                                                <!-- <td>{{ \Illuminate\Support\Str::limit($txn->remarks, 25, '...') }}</td> -->
                                                <td class="text-center">
                                                    <div class="btn-group btn-group-sm">
                                                        <!-- <a href="#" 
                                                        class="btn btn-outline-primary" 
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#editTransactionModal{{ $txn->id }}">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </a> -->

                                                        <!-- <a href="#" 
                                                        class="btn btn-outline-danger" 
                                                        onclick="return confirm('Are you sure you want to delete this transaction?');">
                                                            <i class="bi bi-trash"></i>
                                                        </a> -->

                                                        <a href="{{ route('print.transection', $txn->id) }}" target="_blank"
                                                        class="btn btn-outline-primary">
                                                            <i class="bi bi-printer"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="8" class="text-center py-4 text-muted">
                                                    <i class="bi bi-wallet2 fs-3 d-block mb-1"></i>
                                                    No transactions found
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
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

</body>
</html>