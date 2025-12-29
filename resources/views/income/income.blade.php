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
            <div class="page-heading">
                <h3>Incomes Details</h3>
            </div>
            <div class="page-content bg-white p-4 rounded">
                <section class="row">                    
                    <div class="mb-0 shadow-sm border-0">
    
                        <!-- Card Header -->
                        <div class="card-header bg-white d-flex justify-content-between align-items-center">
                            <h4 class="card-title mb-0 fw-semibold">
                                <i class="bi bi-receipt-cutoff me-2 text-primary"></i>
                                <span>Incomes List</span> 
                                <span class="badge bg-light text-dark">
                                    {{ $incomes->count() }} items
                                </span> 
                                 <span class="fw-bold text-success ms-3">
                                    Total: ৳ {{ number_format($incomes->sum('amount'), 2) }}/-
                                </span>
                                <span class="text-muted"> taka only.</span>
                            </h4>
                            <div class="btn-group">
                                <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addIncomeModal">
                                    <i class="bi bi-plus-circle"></i> Add Income
                                </button>
                                <a href="{{ route('income.settings') }}" class="btn btn-outline-primary">
                                    <i class="bi bi-gear"></i> Setting
                                </a>
                            </div>                            
                        </div>

                        <!-- Card Body -->
                        <div class="card-body p-0">
                            <div class="mb-3">
                                <input type="text" id="searchIncomes" class="form-control" placeholder="Search incomes by Title or Date...">
                            </div>
                            <div class="table-responsive" style="max-height: 600px; overflow-y: auto;">
                                <table class="table table-hover align-middle mb-0" id="expensesTable">                                    
                                    <thead class="table-light">
                                        <tr>
                                            <th>#</th>
                                            <th>Date</th>
                                            <th>Title</th>
                                            <th class="text-end">Amount</th>
                                            <th class="text-center">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($incomes as $key => $income)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td>
                                                    <span class="badge bg-light text-dark">
                                                        {{ \Carbon\Carbon::parse($income->date)->format('d M Y') }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="{{ route('incomes-detail-view', $income->id) }}">
                                                        <div class="fw-semibold">{{ $income->title }}</div>
                                                        @if($income->description)
                                                            <small class="text-muted">{{ $income->description }} - </small>
                                                        @endif
                                                        <span class="badge bg-light text-dark">
                                                            {{ \Carbon\Carbon::parse($income->date)->format('d M Y') }}
                                                        </span>
                                                    </a>
                                                </td>
                                                <td class="text-end fw-bold text-success">
                                                    ৳ {{ number_format($income->amount, 2) }}
                                                </td>
                                                <!-- Action -->
                                                <td class="text-center">
                                                    <div class="btn-group btn-group-sm" role="group">                                                        
                                                        <a href="javascript:void(0);" 
                                                        class="btn btn-outline-primary" 
                                                        data-bs-toggle="modal" 
                                                        data-bs-target="#editIncomeModal{{ $income->id }}">
                                                            <i class="bi bi-pencil-square"></i>
                                                        </a>
                                                        <a href="{{ route('incomes.delete', $income->id) }}" 
                                                        class="btn btn-outline-primary" 
                                                        onclick="return confirm('Are you sure you want to delete this income?');">
                                                            <i class="bi bi-trash text-danger"></i>
                                                        </a>
                                                        <a href="{{ route('incomes.print', $income->id) }}" 
                                                        target="_blank" 
                                                        class="btn btn-outline-primary">
                                                            <i class="bi bi-printer"></i>
                                                        </a>
                                                    </div>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="7" class="text-center py-4 text-muted">
                                                    <i class="bi bi-folder-x fs-3 d-block"></i>
                                                    No incomes found
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

<!-- Add Income Modal -->
<div class="modal fade" id="addIncomeModal" tabindex="-1" aria-labelledby="addIncomeModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">
            
            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title text-white" id="addIncomeModalLabel">
                    <i class="bi bi-cash-stack fs-4 me-2"></i> Add New Incomes
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <form action="{{ route('income.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">

                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Category</label>
                            <select name="category_id" id="category_id" class="form-select" required>
                                <option value="">Select Category</option>
                                @foreach($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Sub Category</label>
                            <select name="sub_category_id" id="subcategory_id" class="form-select">
                                <option value="">Select Sub Category</option>
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Income Title</label>
                            <input type="text" name="title" class="form-control" placeholder="e.g. Office Rent" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Amount</label>
                            <input type="number" name="amount" class="form-control" min="0" placeholder="৳ 0.00" step="0.01" required>
                        </div>

                        <div class="col-md-12">
                            <label class="form-label fw-semibold">Remark</label>
                            <textarea name="remark" rows="3" class="form-control" placeholder="Optional note..."></textarea>
                        </div>

                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to save this income?');">
                        <i class="bi bi-save me-1"></i> Save Income
                    </button>
                </div>
            </form>

        </div>
    </div>
</div>

<!-- edit incomes -->
@foreach($incomes as $income)
<div class="modal fade" id="editIncomeModal{{ $income->id }}" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-lg modal-dialog-centered">
        <div class="modal-content shadow-lg border-0">

            <!-- Modal Header -->
            <div class="modal-header bg-primary text-white">
                <h5 class="modal-title text-white">
                    <i class="bi bi-cash-stack fs-4 me-2"></i> Modify Income
                </h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
            </div>

            <!-- Modal Body -->
            <form action="{{ route('incomes.update', $income->id) }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">

                        <!-- Category -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Category</label>
                            <select name="category_id"
                                    class="form-select category-select"
                                    data-income-id="{{ $income->id }}"
                                    required>
                                <option value="">Select Category</option>
                                @foreach($categories as $category)
                                    <option value="{{ $category->id }}"
                                        {{ $income->category_id == $category->id ? 'selected' : '' }}>
                                        {{ $category->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Sub Category -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Sub Category</label>
                            <select name="sub_category_id"
                                    class="form-select subcategory-select"
                                    id="subcategory_{{ $income->id }}"
                                    required>

                                <option value="">Select Sub Category</option>
                                @foreach($subcategories->where('category_id', $income->category_id) as $sub)
                                    <option value="{{ $sub->id }}"
                                        {{ $income->subcategory_id == $sub->id ? 'selected' : '' }}>
                                        {{ $sub->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>


                        <!-- Title -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Income Title</label>
                            <input type="text"
                                   name="title"
                                   class="form-control"
                                   value="{{ $income->title }}"
                                   required>
                        </div>

                        <!-- Amount -->
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Amount</label>
                            <input type="number"
                                   name="amount"
                                   class="form-control"
                                   value="{{ $income->amount }}"
                                   step="0.01"
                                   required>
                        </div>

                        <!-- Remark -->
                        <div class="col-md-12">
                            <label class="form-label fw-semibold">Remark</label>
                            <textarea name="remark" rows="3" class="form-control">{{ $income->description }}</textarea>
                        </div>

                    </div>
                </div>

                <!-- Modal Footer -->
                <div class="modal-footer">
                    <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                    <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to update this income?');">
                        <i class="bi bi-save me-1"></i> Update Income
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {

            // ADD INCOME MODAL
            $('#category_id').on('change', function () {
                loadSubcategories($(this).val(), '#subcategory_id');
            });

            // EDIT INCOME MODAL (multiple)
            $(document).on('change', '.category-select', function () {
                let categoryId = $(this).val();
                let expenseId  = $(this).data('expense-id');
                loadSubcategories(categoryId, '#subcategory_' + expenseId);
            });

            function loadSubcategories(categoryId, targetSelect) {

                $(targetSelect).html('<option value="">Loading...</option>');

                if (categoryId) {
                    $.ajax({
                        url: "{{ url('accounts/get-in-subcategories') }}/" + categoryId,
                        type: "GET",
                        dataType: "json",
                        success: function (data) {

                            let options = '<option value="">Select Sub Category</option>';

                            $.each(data, function (i, sub) {
                                options += `<option value="${sub.id}">${sub.name}</option>`;
                            });

                            $(targetSelect).html(options);
                        },
                        error: function () {
                            $(targetSelect).html('<option value="">Error loading</option>');
                        }
                    });
                } else {
                    $(targetSelect).html('<option value="">Select Sub Category</option>');
                }
            }

        });

        // Search Functionality
        const searchInput = document.getElementById('searchIncomes');
        const table = document.getElementById('expensesTable').getElementsByTagName('tbody')[0];

        searchInput.addEventListener('keyup', function() {
            const filter = searchInput.value.toLowerCase();
            const rows = table.getElementsByTagName('tr');

            for (let i = 0; i < rows.length; i++) {
                const dateCell = rows[i].getElementsByTagName('td')[1];
                const titleCell = rows[i].getElementsByTagName('td')[2];

                const match = (dateCell && dateCell.textContent.toLowerCase().includes(filter)) ||
                            (titleCell && titleCell.textContent.toLowerCase().includes(filter));

                rows[i].style.display = match ? '' : 'none';
            }
        });
    </script>

</body>
</html>