<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Patient Details - {{ $company->name ?? 'HMS' }}</title>

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
                <h3>Expenses Setting</h3>
            </div>
            <div class="page-content bg-white p-4 rounded">
                <section class="row">
                    <div class="card m-0 shadow-sm border-0">

                        <!-- Card Header -->
                        <div class="card-header bg-white d-flex">
                            <div class="btn-group" role="group">
                                <a href="{{ url()->previous() }}" class="btn btn-outline-primary toggle-table">
                                    <i class="bi bi-arrow-left me-1"></i> Back
                                </a>
                                <button type="button" class="btn btn-primary toggle-table" data-target="#categoryTableContainer">
                                    <i class="bi bi-list-ul me-1"></i> Category
                                </button>
                                <button type="button" class="btn btn-outline-primary toggle-table" data-target="#subCategoryTableContainer">
                                    <i class="bi bi-list-ul me-1"></i> Sub-Category
                                </button>
                            </div>
                        </div>

                        <!-- Card Body -->
                        <div class="card-body">

                            <!-- Category Table -->
                            <div id="categoryTableContainer" class="table-container">
                                <div class="d-flex justify-content-end mb-2">
                                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                                        <i class="bi bi-plus-circle me-1"></i> Add Category
                                    </button>
                                </div>
                                <div class="mb-3">
                                    <input type="text" id="searchCategory" class="form-control" placeholder="Search Category...">
                                </div>
                                <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                                    <table class="table table-bordered table-hover" id="categoryTable">
                                        <thead class="table-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Category Name</th>
                                                <th class="text-center">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($categories as $category)
                                            <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td>{{ $category->name }}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editCategoryModal{{ $category->id }}">
                                                        <i class="bi bi-pencil-square"></i>
                                                    </button>
                                                    <a href="{{ route('expenses.delete-category', $category->id) }}" class="d-inline">
                                                        <button class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <!-- Sub-Category Table -->
                            <div id="subCategoryTableContainer" class="table-container" style="display:none;">
                                <div class="d-flex justify-content-end mb-2">
                                    <button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSubCategoryModal">
                                        <i class="bi bi-plus-circle me-1"></i> Add Sub-Category
                                    </button>
                                </div>
                                <div class="mb-3">
                                    <input type="text" id="searchSubcategory" class="form-control" placeholder="Search Sub-Category...">
                                </div>
                                <div class="table-responsive" style="max-height: 500px; overflow-y: auto;">
                                    <table class="table table-bordered table-hover" id="subcategoryTable">
                                        <thead class="table-light">
                                            <tr>
                                                <th>#</th>
                                                <th>Category</th>
                                                <th>Sub-Category Name</th>
                                                <th class="text-center">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @foreach($subcategories as $sub)
                                            <tr>
                                                <td>{{ $loop->iteration }}</td>
                                                <td>{{ $sub->category->name ?? 'N/A' }}</td>
                                                <td>{{ $sub->name }}</td>
                                                <td class="text-center">
                                                    <button class="btn btn-sm btn-info" data-bs-toggle="modal" data-bs-target="#editSubCategoryModal{{ $sub->id }}">
                                                        <i class="bi bi-pencil-square"></i>
                                                    </button>
                                                    <a href="{{ route('delete.subcategory', $sub->id) }}" class="d-inline">
                                                        <button class="btn btn-sm btn-danger" onclick="return confirm('Are you sure?')">
                                                            <i class="bi bi-trash"></i>
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                            @endforeach
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                        </div>
                    </div>
                </section>
            </div>

            
            <!-- Add Category Modal -->
            <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content shadow-lg border-0">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title text-white"><i class="bi bi-plus-circle fs-5 me-1"></i> Add Category</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <form action="{{ route('store.category') }}" method="POST">
                            @csrf
                            <div class="modal-body">
                                <label class="form-label fw-semibold">Category Name</label>
                                <input type="text" name="name" class="form-control" placeholder="Enter category name" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" onclick="return confirm('Are you sure?')" class="btn btn-primary"><i class="bi bi-save me-1"></i> Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Category Modal -->
            @foreach($categories as $category)
            <div class="modal fade" id="editCategoryModal{{ $category->id }}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content shadow-lg border-0">

                        <!-- Modal Header -->
                        <div class="modal-header bg-info text-white">
                            <h5 class="modal-title">
                                <i class="bi bi-pencil-square fs-5 me-1"></i> Edit Category
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Modal Body -->
                        <form action="{{ route('update.category', $category->id) }}" method="POST">
                            @csrf
                            <div class="modal-body">
                                <label class="form-label fw-semibold">Category Name</label>
                                <input type="text" name="name" class="form-control" value="{{ $category->name }}" required>
                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" onclick="return confirm('Are you sure you want to update?')" class="btn btn-primary">
                                    <i class="bi bi-save me-1"></i> Update
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            @endforeach


            <!-- Add Sub-Category Modal -->
            <div class="modal fade" id="addSubCategoryModal" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content shadow-lg border-0">
                        <div class="modal-header bg-primary text-white">
                            <h5 class="modal-title text-white"><i class="bi bi-plus-circle fs-5 me-1"></i> Add Sub-Category</h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>
                        <form action="{{ route('store.subcategory') }}" method="POST">
                            @csrf
                            <div class="modal-body">
                                <label class="form-label fw-semibold">Category</label>
                                <select name="category_id" class="form-select" required>
                                    <option value="">Select Category</option>
                                    @foreach($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->name }}</option>
                                    @endforeach
                                </select>

                                <label class="form-label fw-semibold mt-3">Sub-Category Name</label>
                                <input type="text" name="name" class="form-control" placeholder="Enter sub-category name" required>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" onclick="return confirm('Are you sure?')" class="btn btn-primary"><i class="bi bi-save me-1"></i> Save</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Edit Sub-Category Modal -->
            @foreach($subcategories as $sub)
            <div class="modal fade" id="editSubCategoryModal{{ $sub->id }}" tabindex="-1" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered">
                    <div class="modal-content shadow-lg border-0">

                        <!-- Modal Header -->
                        <div class="modal-header bg-info text-white">
                            <h5 class="modal-title">
                                <i class="bi bi-pencil-square fs-5 me-1"></i> Edit Sub-Category
                            </h5>
                            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
                        </div>

                        <!-- Modal Body -->
                        <form action="{{ route('update.subcategory', $sub->id) }}" method="POST">
                            @csrf
                            <div class="modal-body">

                                <!-- Parent Category -->
                                <label class="form-label fw-semibold">Category</label>
                                <select name="category_id" class="form-select" required>
                                    <option value="">Select Category</option>
                                    @foreach($categories as $category)
                                    <option value="{{ $category->id }}" {{ $sub->category_id == $category->id ? 'selected' : '' }}>
                                        {{ $category->name }}
                                    </option>
                                    @endforeach
                                </select>

                                <!-- Sub-Category Name -->
                                <label class="form-label fw-semibold mt-3">Sub-Category Name</label>
                                <input type="text" name="name" class="form-control" value="{{ $sub->name }}" required>

                            </div>

                            <!-- Modal Footer -->
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">Cancel</button>
                                <button type="submit" onclick="return confirm('Are you sure you want to update?')" class="btn btn-primary">
                                    <i class="bi bi-save me-1"></i> Update
                                </button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
            @endforeach


            @include('layouts.footer')
        </div>
    </div>


    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

    <!-- JS Toggle Script -->
    <script>
        document.querySelectorAll('.toggle-table').forEach(btn => {
            btn.addEventListener('click', function () {
                const targetId = this.dataset.target;
                document.querySelectorAll('.table-container').forEach(table => table.style.display = 'none');
                document.querySelector(targetId).style.display = 'block';

                // toggle button styles
                document.querySelectorAll('.toggle-table').forEach(b => {
                    b.classList.remove('btn-primary');
                    b.classList.add('btn-outline-primary');
                });
                this.classList.remove('btn-outline-primary');
                this.classList.add('btn-primary');
            });
        });

        const searchInput = document.getElementById('searchSubcategory');
        const table = document.getElementById('subcategoryTable').getElementsByTagName('tbody')[0];

        searchInput.addEventListener('keyup', function() {
            const filter = searchInput.value.toLowerCase();
            const rows = table.getElementsByTagName('tr');

            for (let i = 0; i < rows.length; i++) {
                const cells = rows[i].getElementsByTagName('td');
                let match = false;

                for (let j = 1; j <= 2; j++) { // Category + Sub-category Name columns
                    if (cells[j] && cells[j].textContent.toLowerCase().includes(filter)) {
                        match = true;
                        break;
                    }
                }

                rows[i].style.display = match ? '' : 'none';
            }
        });

        const searchCatInput = document.getElementById('searchCategory');
        const catTable = document.getElementById('categoryTable').getElementsByTagName('tbody')[0];

        searchCatInput.addEventListener('keyup', function() {
            const filter = searchCatInput.value.toLowerCase();
            const rows = catTable.getElementsByTagName('tr');

            for (let i = 0; i < rows.length; i++) {
                const cell = rows[i].getElementsByTagName('td')[1]; // Category Name column
                if (cell && cell.textContent.toLowerCase().includes(filter)) {
                    rows[i].style.display = '';
                } else {
                    rows[i].style.display = 'none';
                }
            }
        });
    </script>
    
</body>
</html>