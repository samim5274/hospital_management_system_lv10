<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title> Patient Details - {{ $company->name ?? 'HMS' }}</title>

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

            
            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">                            
                            <div class="bg-white shadow-lg rounded-2xl p-4 mt-6">
                                <div class="flex justify-between items-center mb-4">
                                    <h2 class="text-lg font-semibold text-gray-800"> Setting</h2>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item"><a href="{{ url('/labs') }}">Lab Test Details</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> Setting</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                            <!-- =============================== Category section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Modal -->
                                    <div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="addCategoryModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addCategoryModalLabel">Add New Category</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('create.lab.test.category') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Right Column: Table View -->
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">Category Details</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
                                                        <i class="fa-solid fa-circle-plus me-2"></i> Add New
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Name</th>
                                                                <th>Description</th>
                                                                <th class="text-center">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($categories as $cat)
                                                                <tr>
                                                                    <td class="text-center">{{ $loop->iteration }}</td>
                                                                    <td>{{ $cat->catName }}</td>
                                                                    <td>{{ $cat->description ?? 'N/A' }}</td>
                                                                    <td class="text-center">                                                                        
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editCategoryModal{{$cat->id}}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="6" class="text-center text-muted">No Category found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    @foreach($categories as $key => $cat)
                                    <div class="modal fade" id="editCategoryModal{{$cat->id}}" tabindex="-1" aria-labelledby="editCategoryModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editCategoryModalLabel">Edit ({{ $cat->catName }}) Category</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('edit.lab.test.category', $cat->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{ $cat->catName }}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control" value="{{ $cat->description }}" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Update</button>
                                                        <a href="{{ route('delete.lab.test.category', $cat->id ) }}" class="btn btn-danger" onclick="return confirm('Are you sure? You want to delete Category')">Delete</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                    
                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Category section end =============================== -->

                            <!-- =============================== Category section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Modal -->
                                    <div class="modal fade" id="addSubCategoryModal" tabindex="-1" aria-labelledby="addSubCategoryModal" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addCategoryModalLabel">Add New Sub-Category</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('create.lab.test.sub.category') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Category <span class="text-danger">*</span></label>
                                                            <select class="form-control" name="category_id" required>
                                                                <option selected disabled>-- Select Category --</option>
                                                                @foreach($categories as $cat)
                                                                <option value="{{ $cat->id }}">{{ $cat->catName }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Right Column: Table View -->
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">Sub-Category Details</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSubCategoryModal">
                                                        <i class="fa-solid fa-circle-plus me-2"></i> Add New
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Category</th>
                                                                <th>Sub-Category</th>
                                                                <th>Description</th>
                                                                <th class="text-center">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($subcategories as $cat)
                                                                <tr>
                                                                    <td class="text-center">{{ $loop->iteration }}</td>
                                                                    <td>{{ $cat->category->catName }}</td>
                                                                    <td>{{ $cat->subCatName }}</td>
                                                                    <td>{{ $cat->description }}</td>
                                                                    <td class="text-center">                                                                        
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editSubCategoryModal{{$cat->id}}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="6" class="text-center text-muted">No Category found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    @foreach($subcategories as $key => $sub)
                                    <div class="modal fade" id="editSubCategoryModal{{$sub->id}}" tabindex="-1" aria-labelledby="editSubCategoryModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editSubCategoryModalLabel">Edit ({{ $sub->subCatName }}) Sub-Category</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('edit.lab.test.sub.category', $sub->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Category <span class="text-danger">*</span></label>
                                                            <select class="form-control" name="category_id" required>
                                                                <option selected disabled>-- Select Category --</option>
                                                                @foreach($categories as $val)
                                                                <option value="{{ $val->id }}" {{ $sub->catId == $val->id ? 'selected' : '' }}>{{ $val->catName }}</option>
                                                                @endforeach
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{ $sub->subCatName }}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control" value="{{ $sub->description }}" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Update</button>
                                                        <a href="{{ route('delete.lab.test.sub.category', $sub->id ) }}" class="btn btn-danger" onclick="return confirm('Are you sure? You want to delete this Sub-Category?')">Delete</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                    
                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Category section end =============================== -->

                            <!-- =============================== Group section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Add Group Modal -->
                                    <div class="modal fade" id="addGroupModal" tabindex="-1" aria-labelledby="addGroupModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addGroupModalLabel">Add New Lab Group</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form action="{{ route('create.lab.test.group') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Group Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- Right Column: Table View -->
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">Lab Groups</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addGroupModal">                                                        
                                                        <i class="fa-solid fa-circle-plus me-2"></i> Add New
                                                    </button>
                                                </div>

                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Group Name</th>
                                                                <th>Description</th>
                                                                <th class="text-center">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($groups as $group)
                                                                <tr>
                                                                    <td class="text-center">{{ $loop->iteration }}</td>
                                                                    <td>{{ $group->name }}</td>
                                                                    <td>{{ $group->description }}</td>
                                                                    <td class="text-center">
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editGroupModal{{ $group->id }}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="5" class="text-center text-muted">No Lab Group found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Edit Group Modal -->
                                    @foreach($groups as $group)
                                    <div class="modal fade" id="editGroupModal{{ $group->id }}" tabindex="-1" aria-labelledby="editGroupModalLabel{{ $group->id }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editGroupModalLabel{{ $group->id }}">Edit Lab Group ({{ $group->name }})</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form action="{{ route('edit.lab.test.group', $group->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Group Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{ $group->name }}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control" value="{{ $group->description }}">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Update</button>
                                                        <a href="{{ route('delete.lab.test.group', $group->id ) }}" class="btn btn-danger" onclick="return confirm('Are you sure? You want to delete this group?')">Delete</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach

                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Group section end =============================== -->

                            <!-- =============================== Specimen section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Add Specimen Modal -->
                                    <div class="modal fade" id="addSpecimenModal" tabindex="-1" aria-labelledby="addSpecimenModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addSpecimenModalLabel">Add New Specimen</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form action="{{ route('create.lab.test.specimen') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Specimen Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Table View -->
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">Lab Specimens</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addSpecimenModal">
                                                        <i class="fa-solid fa-circle-plus me-2"></i> Add New
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Specimen Name</th>
                                                                <th>Description</th>
                                                                <th class="text-center">Action</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($specimens as $specimen)
                                                                <tr>
                                                                    <td class="text-center">{{ $loop->iteration }}</td>
                                                                    <td>{{ $specimen->name }}</td>
                                                                    <td>{{ $specimen->description }}</td>
                                                                    <td class="text-center">
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editSpecimenModal{{ $specimen->id }}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="4" class="text-center text-muted">No Specimen found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Edit Specimen Modal -->
                                    @foreach($specimens as $specimen)
                                    <div class="modal fade" id="editSpecimenModal{{ $specimen->id }}" tabindex="-1" aria-labelledby="editSpecimenModalLabel{{ $specimen->id }}" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editSpecimenModalLabel{{ $specimen->id }}">Edit Specimen ({{ $specimen->name }})</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form action="{{ route('edit.lab.test.specimen', $specimen->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Specimen Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{ $specimen->name }}" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description <span>(Optional)</span></label>
                                                            <input type="text" name="description" class="form-control" value="{{ $specimen->description }}">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure?')">Update</button>
                                                        <a href="{{ route('delete.lab.test.specimen', $specimen->id ) }}" class="btn btn-danger" onclick="return confirm('Are you sure? You want to delete this specimen?')">Delete</a>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach

                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Specimen section end =============================== -->


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