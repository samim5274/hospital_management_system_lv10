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
                <h3>Bank Details</h3>
            </div>
            <div class="page-content bg-white p-4 rounded">
                <section class="row">                    
                    <div class="mb-0 shadow-sm border-0">
    
                        <!-- Card Header -->
                        <div class="card-header bg-white d-flex justify-content-between align-items-center">
                            <h4 class="card-title mb-0 fw-semibold">
                                <i class="bi bi-receipt-cutoff me-2 text-primary"></i>
                                <span>Bank List</span>
                            </h4>
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBankModal">
                                    <i class="bi bi-plus-circle me-2"></i> Add Bank
                                </button>
                                <!-- <a href="#" class="btn btn-outline-primary">
                                    <i class="bi bi-credit-card-2-back fs-4"></i> 
                                </a> -->
                            </div>                            
                        </div>

                        <!-- Card Body -->
                        <div class="card-body p-0">
                            <div class="mb-3">
                                <input type="text" id="searchBank" class="form-control" placeholder="Search Bank by Title or Date...">
                            </div>
                            <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
                                <table class="table table-hover align-middle mb-0" id="bankAccountsTable">
                                    <thead class="table-light">
                                        <tr>
                                            <th>#</th>
                                            <th>Bank Info</th>
                                            <th>Account Info</th>
                                            <th>Routing No</th>
                                            <th>Remarks</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>

                                    <tbody>
                                        @forelse($banks as $key => $bank)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td>
                                                    <div class="fw-semibold">{{ $bank->bank_name }}</div>
                                                    <small class="text-muted">{{ $bank->branch_name }}</small>
                                                </td>
                                                <td>
                                                    <div class="fw-semibold">{{ $bank->account_name }}</div>
                                                    <small class="text-muted">
                                                        A/C: {{ $bank->account_number }}
                                                    </small>
                                                </td>
                                                <td>
                                                    @if($bank->routing_number)
                                                        <span class="badge bg-light text-dark">
                                                            {{ $bank->routing_number }}
                                                        </span>
                                                    @else
                                                        <span class="text-muted">N/A</span>
                                                    @endif
                                                </td>
                                                <td>
                                                    {{ $bank->remarks ?? '-' }}
                                                </td>
                                                <td class="text-center">
                                                    <div class="btn-group btn-group-sm">
                                                        <a href="javascript:void(0)"
                                                        class="btn btn-outline-primary"
                                                        data-bs-toggle="modal"
                                                        data-bs-target="#editBankModal{{ $bank->id }}">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </a>
                                                        <a href="{{ route('delete.bank', $bank->id) }}" class="btn btn-outline-danger" onclick="return confirm('Are you sure you want to delete this bank account?');">
                                                            <i class="bi bi-trash"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="6" class="text-center py-4 text-muted">
                                                    <i class="bi bi-bank fs-3 d-block mb-1"></i>
                                                    No bank accounts found
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

<!-- Add Bank Modal -->
<div class="modal fade" id="addBankModal" tabindex="-1" aria-labelledby="addBankModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">
            
            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title text-white" id="addBankModalLabel">
                    <i class="bi bi-cash-stack fs-4 me-2"></i> Add New Bank
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <form action="{{ route('accounts.store.bank') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">

                        <!-- Bank Name -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Bank Name</label>
                            <input type="text"
                                name="bank_name"
                                class="form-control"
                                placeholder="e.g. Dutch-Bangla Bank Ltd"
                                required>
                        </div>

                        <!-- Branch Name -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Branch Name</label>
                            <input type="text"
                                name="branch_name"
                                class="form-control"
                                placeholder="e.g. Dhanmondi Branch"
                                required>
                        </div>

                        <!-- Account Name -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Account Name</label>
                            <input type="text"
                                name="account_name"
                                class="form-control"
                                placeholder="e.g. Samim Hossain"
                                required>
                        </div>

                        <!-- Account Number -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Account Number</label>
                            <input type="text"
                                name="account_number"
                                class="form-control"
                                placeholder="e.g. 12345678901"
                                required>
                        </div>

                        <!-- Routing Number -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Routing Number</label>
                            <input type="text"
                                name="routing_number"
                                class="form-control"
                                placeholder="e.g. 090261234">
                        </div>

                        <!-- Remarks -->
                        <div class="col-md-12">
                            <label class="form-label fw-semibold">Remarks</label>
                            <textarea name="remarks"
                                    rows="3"
                                    class="form-control"
                                    placeholder="Optional note..."></textarea>
                        </div>

                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to create this bank account?')">
                        <i class="bi bi-save me-1"></i> Creat Bank Account
                    </button>
                    <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">
                       <i class="bi bi-x-circle me-1"></i> Cancel
                    </button>                    
                </div>
            </form>

        </div>
    </div>
</div>



<!-- edit bank modal -->
@forelse($banks as $bank)
<div class="modal fade" id="editBankModal{{$bank->id}}" tabindex="-1" aria-labelledby="addBankModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">
            
            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title text-white" id="addBankModalLabel">
                    <i class="bi bi-cash-stack fs-4 me-2"></i> Modify Bank Details - {{ $bank->bank_name }}
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <form action="{{ route('edit.bank', $bank->id) }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">

                        <!-- Bank Name -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Bank Name</label>
                            <input type="text"
                                name="bank_name"
                                class="form-control"
                                value="{{ $bank->bank_name }}"
                                placeholder="e.g. Dutch-Bangla Bank Ltd"
                                required>
                        </div>

                        <!-- Branch Name -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Branch Name</label>
                            <input type="text"
                                name="branch_name"
                                class="form-control"
                                value="{{ $bank->branch_name }}"
                                placeholder="e.g. Dhanmondi Branch"
                                required>
                        </div>

                        <!-- Account Name -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Account Name</label>
                            <input type="text"
                                name="account_name"
                                class="form-control"
                                value="{{ $bank->account_name }}"
                                placeholder="e.g. Samim Hossain"
                                required>
                        </div>

                        <!-- Account Number -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Account Number</label>
                            <input type="text"
                                name="account_number"
                                class="form-control"
                                value="{{ $bank->account_number }}"
                                placeholder="e.g. 12345678901"
                                required>
                        </div>

                        <!-- Routing Number -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Routing Number</label>
                            <input type="text"
                                name="routing_number"
                                class="form-control"
                                value="{{ $bank->routing_number }}"
                                placeholder="e.g. 090261234">
                        </div>

                        <!-- Remarks -->
                        <div class="col-md-12">
                            <label class="form-label fw-semibold">Remarks</label>
                            <textarea name="remarks"
                                    rows="3"
                                    class="form-control"
                                    value="{{ $bank->remarks }}"
                                    placeholder="Optional note..."></textarea>
                        </div>

                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to MODIFY this bank account?')">
                        <i class="bi bi-save me-1"></i> Creat Bank Account
                    </button>
                    <button type="button" class="btn btn-outline-primary" data-bs-dismiss="modal">
                       <i class="bi bi-x-circle me-1"></i> Cancel
                    </button>                    
                </div>
            </form>

        </div>
    </div>
</div>
 @endforeach


    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

    <script>
        const searchInput = document.getElementById('searchBank');
        const table = document.getElementById('bankAccountsTable').getElementsByTagName('tbody')[0];

        searchInput.addEventListener('keyup', function() {
            const filter = this.value.toLowerCase();
            const rows = table.getElementsByTagName('tr');

            Array.from(rows).forEach(row => {
                const text = row.textContent.toLowerCase();
                if (text.includes(filter)) {
                    row.style.display = '';
                } else {
                    row.style.display = 'none';
                }
            });
        });
    </script>


</body>
</html>