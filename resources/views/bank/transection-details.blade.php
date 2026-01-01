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
                <h3>Deposit & Withdraw Transection Details</h3>
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
                                    {{ $transactions->count() }} transection
                                </span> 
                            </h4>
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDepositModal">
                                    <i class="bi bi-coin me-2"></i> Diposit
                                </button>
                                <button type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addWithdrawModal">
                                    <i class="bi bi-cash me-2"></i> Withdraw
                                </button>
                                <a href="{{ route('print-total-transection') }}" target="_blank" class="btn btn-primary">
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
                                            <th class="text-end">Amount</th>
                                            <th class="text-center"></th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        @forelse($transactions as $key => $txn)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td>
                                                    <!-- Line 1: Bank Name & Branch -->
                                                    <div class="fw-semibold">
                                                        <i class="bi bi-bank me-1 text-primary"></i>
                                                        {{ $txn->bank->bank_name ?? 'N/A' }} 
                                                        
                                                        <small class="text-muted">({{ $txn->bank->branch_name ?? 'N/A' }})</small>
                                                        <small><a href="{{ route('print.transection', $txn->id) }}" target="_blank"
                                                        class="btn btn-sm">
                                                            <i class="bi bi-printer"></i>
                                                        </a></small>
                                                    </div>

                                                    <!-- Line 2: Date & Status -->
                                                    <div class="text-muted small mt-1 d-flex align-items-center justify-content-between"  data-bs-toggle="modal" data-bs-target="#viewTransectionModal{{$txn->id}}">
                                                        <span>
                                                            <i class="bi bi-calendar me-1"></i>
                                                            {{ \Carbon\Carbon::parse($txn->date)->format('d M, Y') }}
                                                        </span>
                                                        <span>
                                                            @if($txn->status === 'deposit')
                                                                <span class="badge bg-success">
                                                                    <i class="bi bi-cash-stack me-1"></i> Deposit
                                                                </span>
                                                            @elseif($txn->status === 'withdraw')
                                                                <span class="badge bg-warning text-dark">
                                                                    <i class="bi bi-wallet2 me-1"></i> Withdraw
                                                                </span>
                                                            @else
                                                                <span class="badge bg-secondary">N/A</span>
                                                            @endif
                                                        </span>
                                                    </div>
                                                </td>
                                                <td class="text-end fw-bold text-success">
                                                    ৳ {{ number_format($txn->amount, 2) }} tk
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group btn-group-sm">
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

<!-- Diposit Modal -->
<div class="modal fade" id="addDepositModal" tabindex="-1" aria-labelledby="addDepositModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">

            <!-- Modal Header -->
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title text-white" id="addDepositModalLabel">
                    <i class="bi bi-cash-stack fs-4 me-2"></i> Add Money Deposit
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <form action="{{ route('bank.deposit.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">

                        <!-- Bank Account Select -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Select Bank Account</label>
                            <select name="bank_id" class="form-select" required>
                                <option value="">-- Select Bank --</option>
                                @foreach($banks as $bank)
                                    <option value="{{ $bank->id }}">
                                        {{ $bank->bank_name }} - {{ $bank->account_name }} (A/C: {{ $bank->account_number }})
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Amount -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Amount</label>
                            <input type="number" name="amount" class="form-control" placeholder="৳ 0.00" min="0" step="0.01" required>
                        </div>

                        <!-- Remarks -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Remarks</label>
                            <textarea name="remarks" rows="3" class="form-control" placeholder="Optional note..."></textarea>
                        </div>

                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure you want to deposit this amount?')">
                        <i class="bi bi-cash-stack me-1"></i> Deposit Money
                    </button>
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        <i class="bi bi-x-circle me-1"></i> Cancel
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>


<!-- Diposit Modal -->
<div class="modal fade" id="addWithdrawModal" tabindex="-1" aria-labelledby="addWithdrawModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">

            <!-- Modal Header -->
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title text-white" id="addWithdrawModalLabel">
                    <i class="bi bi-cash-stack fs-4 me-2"></i>Money Withdraw
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <form action="{{ route('bank.withdraw.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">

                        <!-- Bank Account Select -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Select Bank Account</label>
                            <select name="bank_id" class="form-select" required>
                                <option value="">-- Select Bank --</option>
                                @foreach($banks as $bank)
                                    <option value="{{ $bank->id }}">
                                        {{ $bank->bank_name }} - {{ $bank->account_name }} (A/C: {{ $bank->account_number }})
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Amount -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Amount</label>
                            <input type="number" name="amount" class="form-control" placeholder="৳ 0.00" min="0" step="0.01" required>
                        </div>

                        <!-- Remarks -->
                        <div class="col-12">
                            <label class="form-label fw-semibold">Remarks</label>
                            <textarea name="remarks" rows="3" class="form-control" placeholder="Optional note..."></textarea>
                        </div>

                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-success" onclick="return confirm('Are you sure you want to withdraw this amount?')">
                        <i class="bi bi-cash-stack me-1"></i> Withdraw Money
                    </button>
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        <i class="bi bi-x-circle me-1"></i> Cancel
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>

<!-- Transaction Details Modal -->
@forelse($transactions as $txn)
<div class="modal fade" id="viewTransectionModal{{ $txn->id }}" tabindex="-1" aria-labelledby="viewTransectionModalLabel{{ $txn->id }}" aria-hidden="true">
    <div class="modal-dialog modal-md modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">

            <!-- Modal Header -->
            <div class="modal-header bg-success text-white">
                <h5 class="modal-title text-white" id="viewTransectionModalLabel{{ $txn->id }}">
                    <i class="bi bi-cash-stack fs-4 me-2"></i> Transaction Details
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <div class="modal-body">
                <div class="card shadow-sm border-0 mb-0">
                    
                    <!-- Card Header -->
                    <div class="card-header d-flex justify-content-between align-items-center bg-light">
                        <div>
                            <h5 class="fw-bold mb-0">
                                <i class="bi bi-bank me-2 text-primary"></i> {{ $txn->bank->bank_name ?? 'N/A' }}
                            </h5>
                            <small class="text-muted">
                                {{ $txn->bank->branch_name ?? 'N/A' }} | A/C: {{ $txn->bank->account_number ?? 'N/A' }}
                            </small>
                        </div>
                        <div class="text-end">
                            <span class="fw-bold text-success fs-6">৳ {{ number_format($txn->amount, 2) }}</span>
                        </div>
                    </div>

                    <!-- Card Body -->
                    <div class="card-body">
                        <!-- User & Date -->
                        <div class="d-flex justify-content-between mb-3">
                            <div>
                                <small class="text-muted"><i class="bi bi-person me-1"></i> {{ $txn->user->name ?? 'N/A' }}</small>
                            </div>
                            <div>
                                <small class="text-muted"><i class="bi bi-calendar me-1"></i> {{ \Carbon\Carbon::parse($txn->date)->format('d M, Y') }}</small>
                            </div>
                        </div>

                        <!-- Status & Remarks -->
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                @if($txn->status === 'deposit')
                                    <span class="badge bg-success">
                                        <i class="bi bi-cash-stack me-1"></i> Deposit
                                    </span>
                                @elseif($txn->status === 'withdraw')
                                    <span class="badge bg-warning text-dark">
                                        <i class="bi bi-wallet2 me-1"></i> Withdraw
                                    </span>
                                @else
                                    <span class="badge bg-secondary">N/A</span>
                                @endif
                            </div>
                            <div class="text-end">
                                <small class="text-muted">{{ \Illuminate\Support\Str::limit($txn->remarks, 40, '...') }}</small>
                            </div>
                        </div>
                    </div>

                    <!-- Card Footer -->
                    <div class="card-footer text-end bg-light">
                        <a href="{{ route('print.transection', $txn->id) }}" target="_blank" class="btn btn-sm btn-outline-primary">
                            <i class="bi bi-printer me-1"></i> Print
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</div>
@empty
<div class="col-12 text-center text-muted">
    <i class="bi bi-wallet2 fs-3 d-block mb-2"></i>
    No transactions found
</div>
@endforelse


    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

</body>
</html>