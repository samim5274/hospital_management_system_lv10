<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Expenses Details - {{ $company->name ?? 'HMS' }}</title>

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
                <h3>Expenses Data Filter</h3>
            </div>

            <div class="page-content bg-white p-4 rounded">
                <section class="row">                    
                    <div class="mb-0 shadow-sm border-0">
    
                        <div class="card-body">
                            <!-- FILTER FORM -->
                            <form action="{{ route('expenses.data.filter') }}" method="GET" class="card shadow-sm border-0">
                                <div class="card-body">
                                    <div class="row g-3 align-items-end">

                                        <!-- Start Date -->
                                        <div class="col-md-2">
                                            <label class="form-label fw-semibold">Start Date</label>
                                            <input type="date"
                                                name="start_date"
                                                class="form-control"
                                                value="{{ request('start_date', now()->toDateString()) }}"
                                                max="{{ now()->toDateString() }}">
                                        </div>

                                        <!-- End Date -->
                                        <div class="col-md-2">
                                            <label class="form-label fw-semibold">End Date</label>
                                            <input type="date"
                                                name="end_date"
                                                class="form-control"
                                                value="{{ request('end_date', now()->toDateString()) }}"
                                                max="{{ now()->toDateString() }}">
                                        </div>

                                        <!-- Category -->
                                        <div class="col-md-3">
                                            <label class="form-label fw-semibold">Category</label>
                                            <select name="category_id" id="category_id" class="form-select">
                                                <option value="">-- Select Category --</option>
                                                @foreach($exCategories as $val)
                                                    <option value="{{ $val->id }}"
                                                        {{ request('category_id') == $val->id ? 'selected' : '' }}>
                                                        {{ $val->name }}
                                                    </option>
                                                @endforeach
                                            </select>
                                        </div>

                                        <!-- Sub Category -->
                                        <div class="col-md-3">
                                            <label class="form-label fw-semibold">Sub Category</label>
                                            <select name="sub_category_id" id="sub_category_id" class="form-select">
                                                <option value="">-- Select Sub-Category --</option>
                                            </select>
                                        </div>

                                        <!-- Buttons -->
                                        <div class="col-md-2 d-flex gap-2">
                                            <button type="submit" class="btn btn-primary w-100">
                                                <i class="bi bi-funnel me-1"></i> Filter
                                            </button>

                                            <button type="submit"
                                                    name="print"
                                                    value="1"
                                                    class="btn btn-outline-secondary w-100"
                                                    formtarget="_blank">
                                                <i class="bi bi-printer me-1"></i> Print
                                            </button>
                                        </div>

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
                                            <th>#</th>
                                            <th>Date</th>
                                            <th>Title</th>
                                            <th class="text-end">Amount</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($exDetails as $key => $expense)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td>
                                                    <span class="text-dark">
                                                        {{ \Carbon\Carbon::parse($expense->date)->format('d M Y') }}
                                                    </span>
                                                </td>
                                                <td>
                                                    <a href="{{ route('expenses-detail-view', $expense->id) }}">
                                                        <div class="fw-semibold">{{ $expense->title }}</div>
                                                        @if($expense->remark)
                                                            <small class="text-muted">{{ $expense->remark }} - </small>
                                                        @endif
                                                        <small class="text-muted">
                                                            {{ $expense->category->name }} - {{ $expense->subcategory->name }}
                                                        </small>
                                                    </a>
                                                </td>
                                                <td class="text-end fw-bold text-success">
                                                    ৳ {{ number_format($expense->amount, 2) }}/-
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="7" class="text-center py-4 text-muted">
                                                    <i class="bi bi-folder-x fs-3 d-block"></i>
                                                    No expenses found
                                                </td>
                                            </tr>
                                        @endforelse
                                        <tr class="bg-secondary text-white">
                                            <td colspan="3" class="text-end fw-semibold">
                                                Total
                                            </td>
                                            <td class="text-end fw-bold">
                                                ৳ {{ number_format($exDetails->sum('amount'), 2) }}/-
                                            </td>
                                        </tr>
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

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {

            // Category change (Add Expense)
            $('#category_id').on('change', function () {
                let categoryId = $(this).val();
                loadSubcategories(categoryId, '#sub_category_id');
            });

            function loadSubcategories(categoryId, targetSelect) {

                $(targetSelect).html('<option value="">Loading...</option>');

                if (!categoryId) {
                    $(targetSelect).html('<option value="">-- Select Sub-Category --</option>');
                    return;
                }

                $.ajax({
                    url: "{{ url('accounts/get-ex-subcategories') }}/" + categoryId,
                    type: "GET",
                    dataType: "json",
                    success: function (data) {

                        let options = '<option value="">-- Select Sub-Category --</option>';

                        if (data.length === 0) {
                            options += '<option value="">No sub-category found</option>';
                        } else {
                            $.each(data, function (i, sub) {
                                options += `<option value="${sub.id}">${sub.name}</option>`;
                            });
                        }

                        $(targetSelect).html(options);
                    },
                    error: function () {
                        $(targetSelect).html('<option value="">Failed to load</option>');
                    }
                });
            }

        });

    </script>
    
</body>
</html>