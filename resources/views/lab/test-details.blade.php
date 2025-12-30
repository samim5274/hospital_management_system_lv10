<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Lab - {{ $company->name ?? 'HMS' }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/iconly/bold.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/bootstrap-icons/bootstrap-icons.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" />
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
            <div class="page-heading mb-3">
                <h2>Lab Test Details</h2>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Test Details</li>
                    </ol>
                </nav>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-md-12 mx-auto">
                        <div class="card shadow-sm border-0 mt-4">
                            <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center py-2">
                                <h6 class="mb-0 fw-semibold text-white"><i class="bi bi-clipboard2-pulse me-2"></i>Available Tests</h6>
                                <div class="d-flex align-items-center gap-3">
                                    <!-- Tests count badge -->
                                    <span class="badge bg-light text-dark fs-6 py-2 px-3 shadow-sm">
                                        {{ count($testDetails) }} Tests
                                    </span>

                                    <!-- Add Lab Test button -->
                                    <button type="button" class="btn btn-light btn-sm shadow-sm" data-bs-toggle="modal" data-bs-target="#createLabTestModal">
                                        <i class="bi bi-plus-circle me-2"></i> Create Test
                                    </button>

                                    <a href="{{ route('lab.test.setting') }}" type="button" class="btn btn-light btn-sm shadow-sm">
                                        <i class="bi bi-gear"></i>
                                    </a>
                                </div>
                            </div>

                            <div class="my-2">
                                <input type="text" id="searchTests" class="form-control" placeholder="Search Tests by Name...">
                            </div>

                            <div class="card-body bg-light p-0" style="max-height: 700px; overflow-y: auto;">
                                <table id="testsTable" class="table table-hover table-bordered align-middle mb-0">
                                    <thead class="table-primary sticky-top">
                                        <tr>
                                            <th style="width: 50px;">#</th>
                                            <th>Test Name</th>
                                            <th style="width: 130px;">Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($testDetails as $key => $test)
                                            <tr>
                                                <td class="text-center fw-semibold">{{ $loop->iteration }}</td>
                                                <td class="text-start"><a href="{{ route('test.report.generate.view', $test->id) }}">{{ $test->testName }}</a></td>
                                                <td class="text-center">
                                                    <span class="btn btn-sm btn-outline-success" data-bs-toggle="modal" data-bs-target="#editLabTestModal{{$test->id}}">
                                                        <i class="fa-solid fa-pen-to-square"></i>
                                                    </span>
                                                    <a href="{{ route('test.report.generate.view', $test->id) }}" class="btn btn-sm btn-outline-primary">
                                                        <i class="fa-solid fa-square-plus"></i>
                                                    </a>
                                                    <a href="{{ route('test-delete', $test->id) }}" class="btn btn-sm btn-outline-danger" onclick="return confirm('Are you sure? do you want to delete this TEST?')">
                                                        <i class="fa-solid fa-trash-can"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                        @empty
                                            <tr>
                                                <td colspan="3" class="text-center text-muted py-3">
                                                    <i class="bi bi-exclamation-circle me-2"></i>No tests available.
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




<!-- Modal -->
<div class="modal fade" id="createLabTestModal" tabindex="-1" aria-labelledby="createLabTestModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="createLabTestModalLabel">Create Lab Test</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>

            <form action="{{ route('lab.test.store') }}" method="POST">
                @csrf
                <div class="modal-body">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="testName" class="form-label">Test Name</label>
                            <input type="text" class="form-control" id="testName" name="testName" required>
                        </div>

                        <div class="col-md-6">
                            <label for="category_id" class="form-label">Category</label>
                            <select class="form-select category-select"
                                    data-target="subcategory_create"
                                    name="category_id" required>
                                <option disabled selected>-- Select Category --</option>
                                @foreach($categories as $category)
                                    <option value="{{ $category->id }}">{{ $category->catName }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="subcategory_id" class="form-label">Subcategory</label>
                            <select class="form-select"
                                    id="subcategory_create"
                                    name="subcategory_id" required>
                                <option disabled selected>-- Select Sub Category --</option>
                            </select>
                        </div>



                        <div class="col-md-6">
                            <label for="specimenId" class="form-label">Specimen</label>
                            <select class="form-select" id="specimenId" name="specimenId">
                                <option disabled selected>-- Select Specimen --</option>
                                @foreach($specimens as $specimen)
                                <option value="{{ $specimen->id }}">{{ $specimen->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="groupId" class="form-label">Group</label>
                            <select class="form-select" id="groupId" name="groupId">
                                <option disabled selected>-- Select Group --</option>
                                @foreach($groups as $group)
                                <option value="{{ $group->id }}">{{ $group->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <div class="col-md-6">
                            <label for="testPrice" class="form-label">Test Price</label>
                            <input type="number" class="form-control" id="testPrice" name="testPrice" step="0.01" required>
                        </div>

                        <div class="col-md-6">
                            <label for="rprice" class="form-label">R Price</label>
                            <input type="number" class="form-control" id="rprice" name="rprice" step="0.01">
                        </div>

                        <div class="col-md-6">
                            <label for="room" class="form-label">Room</label>
                            <input type="text" class="form-control" id="room" name="room">
                        </div>

                        <div class="col-12">
                            <label for="testDescription" class="form-label">Description</label>
                            <textarea class="form-control" id="testDescription" name="testDescription" rows="3"></textarea>
                        </div>

                        <div class="col-md-6">
                            <label for="status" class="form-label">Status</label>
                            <select class="form-select" id="status" name="status" required>
                                <option value="0">Active</option>
                                <option value="1">Inactive</option>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary">Save Test</button>
                </div>
            </form>
        </div>
    </div>
</div>



<!-- edit modal -->
@foreach($testDetails as $test)
<div class="modal fade" id="editLabTestModal{{ $test->id }}" tabindex="-1">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">

            <div class="modal-header">
                <h5 class="modal-title">Edit Lab Test</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>

            <form action="#" method="POST">
                @csrf

                <div class="modal-body">
                    <div class="row g-3">

                        <!-- Test Name -->
                        <div class="col-md-6">
                            <label class="form-label">Test Name</label>
                            <input type="text" name="testName"
                                   class="form-control"
                                   value="{{ $test->testName }}" required>
                        </div>

                        <!-- Category -->
                        <div class="col-md-6">
                            <label class="form-label">Category</label>
                            <select class="form-select category-select"
                                    data-target="subcategory_{{ $test->id }}"
                                    name="category_id" required>
                                @foreach($categories as $category)
                                    <option value="{{ $category->id }}"
                                        {{ $test->categoryId == $category->id ? 'selected' : '' }}>
                                        {{ $category->catName }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Subcategory -->
                        <div class="col-md-6">
                            <label class="form-label">Subcategory</label>
                            <select class="form-select"
                                    id="subcategory_{{ $test->id }}"
                                    name="subcategory_id">
                                @foreach($subcategories as $sub)
                                    <option value="{{ $sub->id }}"
                                        {{ $test->subcategoryId == $sub->id ? 'selected' : '' }}>
                                        {{ $sub->subCatName }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Specimen -->
                        <div class="col-md-6">
                            <label class="form-label">Specimen</label>
                            <select class="form-select" name="specimenId">
                                @foreach($specimens as $specimen)
                                    <option value="{{ $specimen->id }}"
                                        {{ $test->specimenId == $specimen->id ? 'selected' : '' }}>
                                        {{ $specimen->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Group -->
                        <div class="col-md-6">
                            <label class="form-label">Group</label>
                            <select class="form-select" name="groupId">
                                @foreach($groups as $group)
                                    <option value="{{ $group->id }}"
                                        {{ $test->groupId == $group->id ? 'selected' : '' }}>
                                        {{ $group->name }}
                                    </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Prices -->
                        <div class="col-md-6">
                            <label class="form-label">Test Price</label>
                            <input type="number" name="testPrice"
                                   value="{{ $test->testPrice }}"
                                   class="form-control" required>
                        </div>

                        <div class="col-md-6">
                            <label class="form-label">R Price</label>
                            <input type="number" name="rprice"
                                   value="{{ $test->rprice }}"
                                   class="form-control">
                        </div>

                        <!-- Room -->
                        <div class="col-md-6">
                            <label class="form-label">Room</label>
                            <input type="text" name="room"
                                   value="{{ $test->room }}"
                                   class="form-control">
                        </div>

                        <!-- Description -->
                        <div class="col-12">
                            <label class="form-label">Description</label>
                            <textarea name="testDescription"
                                      class="form-control">{{ $test->testDescription }}</textarea>
                        </div>

                        <!-- Status -->
                        <div class="col-md-6">
                            <label class="form-label">Status</label>
                            <select name="status" class="form-select">
                                <option value="0" {{ $test->status == 0 ? 'selected' : '' }}>Active</option>
                                <option value="1" {{ $test->status == 1 ? 'selected' : '' }}>Inactive</option>
                            </select>
                        </div>

                    </div>
                </div>

                <div class="modal-footer">
                    <button class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button class="btn btn-primary">Update</button>
                </div>

            </form>

        </div>
    </div>
</div>
@endforeach



    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function () {
            $(document).on('change', '.category-select', function () {
                let categoryId = $(this).val();
                let targetId   = $(this).data('target');
                let target     = '#' + targetId;
                $(target).html('<option selected>Loading...</option>');
                if (!categoryId) {
                    $(target).html('<option selected>-- Select Sub Category --</option>');
                    return;
                }
                $.ajax({
                    url: "{{ url('labs/get-subcategories') }}/" + categoryId,
                    type: "GET",
                    dataType: "json",
                    success: function (data) {

                        let options = '<option value="">-- Select Sub Category --</option>';

                        $.each(data, function (i, sub) {
                            options += `<option value="${sub.id}">${sub.subCatName}</option>`;
                        });

                        $(target).html(options);
                    },
                    error: function () {
                        $(target).html('<option>Error loading subcategories</option>');
                    }
                });
            });
        });



        // Search Functionality
        document.addEventListener('DOMContentLoaded', function () {
            const searchInput = document.getElementById('searchTests');
            const tableBody   = document.getElementById('testsTable').getElementsByTagName('tbody')[0];

            searchInput.addEventListener('keyup', function () {
                const filter = searchInput.value.toLowerCase();
                const rows = tableBody.getElementsByTagName('tr');

                for (let i = 0; i < rows.length; i++) {
                    const testNameCell = rows[i].getElementsByTagName('td')[1]; // Test Name column

                    if (testNameCell) {
                        const match = testNameCell.textContent.toLowerCase().includes(filter);
                        rows[i].style.display = match ? '' : 'none';
                    }
                }
            });

        });
    </script>

</body>

</html>