<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Bank Report Details - {{ $company->name ?? 'HMS' }}</title>

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
                <h3>Bank Transection Data Filter</h3>
            </div>
            <div class="page-content bg-white p-4 rounded">
                <section class="row">                    
                    <div class="mb-0 shadow-sm border-0">

                        <div class="card-body">
                            <form method="GET" action="{{ route('bank.transaction.filter') }}">
                                <div class="row g-3">

                                    <!-- Start Date -->
                                    <div class="col-md-3">
                                        <label class="form-label">Start Date</label>
                                        <input type="date" name="start_date" class="form-control"
                                            value="{{ request('start_date', now()->toDateString()) }}">
                                    </div>

                                    <!-- End Date -->
                                    <div class="col-md-3">
                                        <label class="form-label">End Date</label>
                                        <input type="date" name="end_date" class="form-control"
                                            value="{{ request('end_date', now()->toDateString()) }}">
                                    </div>

                                    <!-- Bank -->
                                    <div class="col-md-3">
                                        <label class="form-label">Bank</label>
                                        <select name="bank_id" class="form-select">
                                            <option value="">All Banks</option>
                                            @foreach($banks as $bank)
                                                <option value="{{ $bank->id }}"
                                                    {{ request('bank_id') == $bank->id ? 'selected' : '' }}>
                                                    {{ $bank->bank_name ?? $bank->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <!-- Status -->
                                    <div class="col-md-3">
                                        <label class="form-label">Status</label>
                                        <select name="status" class="form-select">
                                            <option value="">All</option>
                                            <option value="deposit" {{ request('status')=='deposit'?'selected':'' }}>Deposit</option>
                                            <option value="withdraw" {{ request('status')=='withdraw'?'selected':'' }}>Withdraw</option>
                                        </select>
                                    </div>

                                    <!-- Buttons -->
                                    <div class="col-12 text-end mt-3">
                                        <button class="btn btn-primary">
                                            <i class="bi bi-funnel me-1"></i> Filter
                                        </button>

                                        <button name="print" value="1" class="btn btn-outline-secondary" formtarget="_blank">
                                            <i class="bi bi-printer me-1"></i> Print
                                        </button>
                                    </div>

                                </div>
                            </form>
                        </div>

                        <!-- Card Body -->
                        <div class="card-body p-0">                            
                            <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
                                <table class="table table-hover align-middle mb-0" id="expensesTable">                                    
                                    <thead class="table-light">
                                        <tr>
                                            <th style="width:60px">#</th>
                                            <th>Date</th>
                                            <th>Details</th>
                                            <th class="text-end">Amount</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        @forelse($transactions as $key => $row)
                                            <tr>
                                                <td class="text-muted fw-semibold">
                                                    {{ $key + 1 }}
                                                </td>
                                                <td>
                                                    <span class="text-dark">
                                                        {{ \Carbon\Carbon::parse($row->date)->format('d M Y') }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <div class="fw-semibold text-dark">
                                                        {{ $row->bank->bank_name ?? 'Unknown Bank' }}
                                                    </div>
                                                    <small class="text-muted">
                                                        {{ ucfirst($row->status) }} by
                                                        {{ $row->user->name ?? 'N/A' }}
                                                    </small>
                                                    @if($row->remarks)
                                                        <br>
                                                        <small class="text-muted fst-italic">
                                                            {{ $row->remarks }}
                                                        </small>
                                                    @endif
                                                </td>
                                                <td class="text-end fw-bold 
                                                    {{ $row->status == 'deposit' ? 'text-success' : 'text-danger' }}">
                                                    ৳ {{ number_format($row->amount, 2) }}/-
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="4" class="text-center py-4 text-muted">
                                                    <i class="bi bi-folder-x fs-3 d-block mb-2"></i>
                                                    No bank transactions found
                                                </td>
                                            </tr>
                                        @endforelse
                                    </tbody>
                                    <tfoot class="table-light border-top">
                                        <tr>
                                            <td colspan="3" class="text-end fw-semibold">
                                                Total Deposit
                                            </td>
                                            <td class="text-end fw-bold text-success">
                                                ৳ {{ number_format($totalDepositAll, 2) }}/-
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="3" class="text-end fw-semibold">
                                                Total Withdraw
                                            </td>
                                            <td class="text-end fw-bold text-danger">
                                                ৳ {{ number_format($totalWithdrawAll, 2) }}/-
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="3" class="text-end fw-bold fs-6">
                                                Net Balance
                                            </td>
                                            <td class="text-end fw-bold fs-6 
                                                {{ $totalBalanceAll >= 0 ? 'text-success' : 'text-danger' }}">
                                                ৳ {{ number_format($totalBalanceAll, 2) }}/-
                                            </td>
                                        </tr>
                                    </tfoot>
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