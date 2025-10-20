<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Patient Details - HMS</title>

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
    <link rel="shortcut icon" href="{{ asset('assets/images/favicon.svg') }}" type="image/x-icon">

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
                                            <li class="breadcrumb-item active" aria-current="page"> Setting</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                            <!-- =============================== reference section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Modal -->
                                    <div class="modal fade" id="addReferModal" tabindex="-1" aria-labelledby="addReferModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addReferModalLabel">Add New Refer</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{route('setting.add.refer')}}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Designation</label>
                                                            <input type="text" name="designation" class="form-control">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Phone</label>
                                                            <input type="text" name="phone" class="form-control">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Email</label>
                                                            <input type="email" name="email" class="form-control">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Status</label>
                                                            <select name="status" class="form-select">
                                                                <option value="1" selected>Active</option>
                                                                <option value="0">Inactive</option>
                                                            </select>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save Refer</button>
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
                                                    <h5 class="card-title mb-0">All Refers</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addReferModal">
                                                        <i class="fa-solid fa-user-plus"></i> Add New
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Name</th>
                                                                <th>Designation</th>
                                                                <th>Phone</th>
                                                                <th>Email</th>
                                                                <th class="text-center">Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($refers as $key => $refer)
                                                                <tr>
                                                                    <td class="text-center">{{ $key +1 }}</td>
                                                                    <td>{{ $refer->name }}</td>
                                                                    <td>{{ $refer->designation ?? '-' }}</td>
                                                                    <td>{{ $refer->phone ?? '-' }}</td>
                                                                    <td>{{ $refer->email ?? '-' }}</td>
                                                                    <td class="text-center">
                                                                        @if($refer->status == '1')
                                                                            <span class="badge bg-success">Active</span>
                                                                        @else
                                                                            <span class="badge bg-danger">Inactive</span>
                                                                        @endif
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editReferModal{{$refer->id}}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="6" class="text-center text-muted">No refers found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    @foreach($refers as $key => $refer)
                                    <div class="modal fade" id="editReferModal{{$refer->id}}" tabindex="-1" aria-labelledby="editReferModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="editReferModalLabel">Edit ({{ $refer->name }}) Reference</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ url('/settings/setting/edit/refer/'.$refer->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{ $refer->name }}" required>
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Designation</label>
                                                            <input type="text" name="designation" class="form-control" value="{{ $refer->designation }}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Phone</label>
                                                            <input type="text" name="phone" class="form-control" value="{{ $refer->phone }}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Email</label>
                                                            <input type="email" name="email" class="form-control" value="{{ $refer->email }}">
                                                        </div>

                                                        <div class="mb-3">
                                                            <label class="form-label">Status</label>
                                                            <select name="status" class="form-select">
                                                                <option value="1" {{ $refer->status == 1 ? 'selected' : '' }}>Active</option>
                                                                <option value="0" {{ $refer->status == 0 ? 'selected' : '' }}>Inactive</option>
                                                            </select>

                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Edit Refer</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @endforeach
                                    
                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== reference section end =============================== -->

                            <hr>
                            
                            <!-- =============================== Doctor section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Add Doctor Modal -->
                                    <div class="modal fade" id="addDoctorModal" tabindex="-1" aria-labelledby="addDoctorModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addDoctorModalLabel">Add New Doctor</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="{{ route('setting.add.doctor') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Specialization</label>
                                                            <input type="text" name="specialization" class="form-control">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Phone</label>
                                                            <input type="text" name="phone" class="form-control">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Email</label>
                                                            <input type="email" name="email" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save Doctor</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Doctors Table -->
                                    <div class="col-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">All Doctors</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDoctorModal">
                                                        <i class="fa-solid fa-user-plus"></i> Add Doctor
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Name</th>
                                                                <th>Specialization</th>
                                                                <th>Phone</th>
                                                                <th>Email</th>
                                                                <th class="text-center">Status</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($doctors as $key => $doctor)
                                                                <tr>
                                                                    <td class="text-center">{{ $key + 1 }}</td>
                                                                    <td>{{ $doctor->name }}</td>
                                                                    <td>{{ $doctor->specialization ?? '-' }}</td>
                                                                    <td>{{ $doctor->phone ?? '-' }}</td>
                                                                    <td>{{ $doctor->email ?? '-' }}</td>
                                                                    <td class="text-center">
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editDoctorModal{{ $doctor->id }}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="6" class="text-center text-muted">No doctors found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Edit Doctor Modal for Each Doctor -->
                                    @foreach($doctors as $doctor)
                                        <div class="modal fade" id="editDoctorModal{{ $doctor->id }}" tabindex="-1" aria-labelledby="editDoctorModalLabel{{ $doctor->id }}" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editDoctorModalLabel{{ $doctor->id }}">Edit Doctor ({{ $doctor->name }})</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="{{ route('setting.edit.doctor', $doctor->id) }}" method="POST">
                                                        @csrf
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <label class="form-label">Name <span class="text-danger">*</span></label>
                                                                <input type="text" name="name" class="form-control" value="{{ $doctor->name }}" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Specialization</label>
                                                                <input type="text" name="specialization" class="form-control" value="{{ $doctor->specialization }}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Phone</label>
                                                                <input type="text" name="phone" class="form-control" value="{{ $doctor->phone }}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Email</label>
                                                                <input type="email" name="email" class="form-control" value="{{ $doctor->email }}">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Update Doctor</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Doctor section end =============================== -->

                            <hr>

                            <!-- =============================== Duty Doctor section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">

                                    <!-- Add Doctor Modal -->
                                    <div class="modal fade" id="addDutyDoctorModal" tabindex="-1" aria-labelledby="addDutyDoctorModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addDutyDoctorModalLabel">Add New Duty Doctor</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                <form action="{{ route('setting.add.duty.doctor') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Specialization</label>
                                                            <input type="text" name="specialization" class="form-control">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Phone</label>
                                                            <input type="text" name="phone" class="form-control">
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Email</label>
                                                            <input type="email" name="email" class="form-control">
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save Doctor</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Doctors Table -->
                                    <div class="col-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">All Duty Doctors</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDutyDoctorModal">
                                                        <i class="fa-solid fa-user-plus"></i> Add Duty Doctor
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Name</th>
                                                                <th>Specialization</th>
                                                                <th>Phone</th>
                                                                <th>Email</th>
                                                                <th class="text-center">Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($dutyDoctors as $key => $doctor)
                                                                <tr>
                                                                    <td class="text-center">{{ $key + 1 }}</td>
                                                                    <td>{{ $doctor->name }}</td>
                                                                    <td>{{ $doctor->specialization ?? '-' }}</td>
                                                                    <td>{{ $doctor->phone ?? '-' }}</td>
                                                                    <td>{{ $doctor->email ?? '-' }}</td>
                                                                    <td class="text-center">
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editDutyDoctorModal{{ $doctor->id }}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="6" class="text-center text-muted">No doctors found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Edit Doctor Modals -->
                                    @foreach($dutyDoctors as $doctor)
                                        <div class="modal fade" id="editDutyDoctorModal{{ $doctor->id }}" tabindex="-1" aria-labelledby="editDutyDoctorModalLabel{{ $doctor->id }}" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="editDutyDoctorModalLabel{{ $doctor->id }}">Edit Duty Doctor ({{ $doctor->name }})</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <form action="{{ route('setting.edit.duty.doctor', $doctor->id) }}" method="POST">
                                                        @csrf
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <label class="form-label">Name <span class="text-danger">*</span></label>
                                                                <input type="text" name="name" class="form-control" value="{{ $doctor->name }}" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Specialization</label>
                                                                <input type="text" name="specialization" class="form-control" value="{{ $doctor->specialization }}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Phone</label>
                                                                <input type="text" name="phone" class="form-control" value="{{ $doctor->phone }}">
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Email</label>
                                                                <input type="email" name="email" class="form-control" value="{{ $doctor->email }}">
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Update Doctor</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach

                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Duty Doctor section end =============================== -->

                            <hr>

                            <!-- =============================== Disease section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">

                                    <!-- Add Disease Modal -->
                                    <div class="modal fade" id="addDiseaseModal" tabindex="-1" aria-labelledby="addDiseaseModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Add New Disease</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form action="{{ route('setting.diseases.store') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Disease Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control form-control-sm" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Description</label>
                                                            <textarea name="description" rows="3" class="form-control form-control-sm"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save Disease</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Disease Table -->
                                    <div class="col-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">All Diseases</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addDiseaseModal">
                                                        <i class="fa-solid fa-plus"></i> Add New
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Name</th>
                                                                <th>Description</th>
                                                                <th class="text-center">Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($diseases as $key => $disease)
                                                                <tr>
                                                                    <td class="text-center">{{ $key + 1 }}</td>
                                                                    <td>{{ $disease->name }}</td>
                                                                    <td>{{ $disease->description ?? '-' }}</td>
                                                                    <td class="text-center">
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editDiseaseModal{{ $disease->id }}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="4" class="text-center text-muted">No diseases found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Edit Disease Modals -->
                                    @foreach($diseases as $disease)
                                        <div class="modal fade" id="editDiseaseModal{{ $disease->id }}" tabindex="-1" aria-labelledby="editDiseaseModalLabel{{ $disease->id }}" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Edit Disease ({{ $disease->name }})</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <form action="{{ route('setting.diseases.update', $disease->id) }}" method="POST">
                                                        @csrf
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <label class="form-label">Disease Name <span class="text-danger">*</span></label>
                                                                <input type="text" name="name" class="form-control form-control-sm" value="{{ $disease->name }}" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Description</label>
                                                                <textarea name="description" rows="3" class="form-control form-control-sm">{{ $disease->description }}</textarea>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Update Disease</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach

                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Disease section end =============================== -->

                            <hr>

                            <!-- =============================== Bed section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">

                                    <!-- Add Bed Modal -->
                                    <div class="modal fade" id="addBedModal" tabindex="-1" aria-labelledby="addBedModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title">Add New Bed</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                </div>
                                                <form action="{{ route('setting.beds.store') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Bed Number <span class="text-danger">*</span></label>
                                                            <input type="text" name="bed_number" class="form-control form-control-sm" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Ward <span class="text-danger">*</span></label>
                                                            <input type="text" name="ward" class="form-control form-control-sm" required>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Status</label>
                                                            <select name="status" class="form-select form-select-sm" required>
                                                                <option value="available">Available</option>
                                                                <option value="occupied">Occupied</option>
                                                                <option value="maintenance">Maintenance</option>
                                                            </select>
                                                        </div>
                                                        <div class="mb-3">
                                                            <label class="form-label">Price per Day (৳)</label>
                                                            <input type="number" step="0.01" name="price_per_day" class="form-control form-control-sm" required>
                                                        </div>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save Bed</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Beds Table -->
                                    <div class="col-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">All Beds</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addBedModal">
                                                        <i class="fa-solid fa-bed"></i> Add New
                                                    </button>
                                                </div>
                                                <div class="table-responsive" style="max-height: 400px; overflow-y: auto;">
                                                    <table class="table table-striped table-bordered mb-0">
                                                        <thead class="table-light">
                                                            <tr>
                                                                <th class="text-center">#</th>
                                                                <th>Bed Number</th>
                                                                <th>Ward</th>
                                                                <th>Status</th>
                                                                <th>Price/Day (৳)</th>
                                                                <th class="text-center">Actions</th>
                                                            </tr>
                                                        </thead>
                                                        <tbody>
                                                            @forelse($beds as $key => $bed)
                                                                <tr>
                                                                    <td class="text-center">{{ $key + 1 }}</td>
                                                                    <td>{{ $bed->bed_number }}</td>
                                                                    <td>{{ $bed->ward }}</td>
                                                                    <td>
                                                                        @if($bed->status == 'available')
                                                                            <span class="badge bg-success">Available</span>
                                                                        @elseif($bed->status == 'booked')
                                                                            <span class="badge bg-danger">Booked</span>
                                                                        @else
                                                                            <span class="badge bg-warning text-dark">Maintenance</span>
                                                                        @endif
                                                                    </td>
                                                                    <td>{{ number_format($bed->price_per_day, 2) }}</td>
                                                                    <td class="text-center">
                                                                        <span class="badge bg-info" data-bs-toggle="modal" data-bs-target="#editBedModal{{ $bed->id }}">Edit</span>
                                                                    </td>
                                                                </tr>
                                                            @empty
                                                                <tr>
                                                                    <td colspan="6" class="text-center text-muted">No beds found.</td>
                                                                </tr>
                                                            @endforelse
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Edit Bed Modals -->
                                    @foreach($beds as $bed)
                                        <div class="modal fade" id="editBedModal{{ $bed->id }}" tabindex="-1" aria-labelledby="editBedModalLabel{{ $bed->id }}" aria-hidden="true">
                                            <div class="modal-dialog modal-dialog-centered">
                                                <div class="modal-content">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title">Edit Bed ({{ $bed->bed_number }})</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                                                    </div>
                                                    <form action="{{ route('setting.beds.update', $bed->id) }}" method="POST">
                                                        @csrf
                                                        <div class="modal-body">
                                                            <div class="mb-3">
                                                                <label class="form-label">Bed Number <span class="text-danger">*</span></label>
                                                                <input type="text" name="bed_number" value="{{ $bed->bed_number }}" class="form-control form-control-sm" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Ward <span class="text-danger">*</span></label>
                                                                <input type="text" name="ward" value="{{ $bed->ward }}" class="form-control form-control-sm" required>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Status</label>
                                                                <select name="status" class="form-select form-select-sm">
                                                                    <option value="available" {{ $bed->status == 'available' ? 'selected' : '' }}>Available</option>
                                                                    <option value="occupied" {{ $bed->status == 'occupied' ? 'selected' : '' }}>Occupied</option>
                                                                    <option value="maintenance" {{ $bed->status == 'maintenance' ? 'selected' : '' }}>Maintenance</option>
                                                                </select>
                                                            </div>
                                                            <div class="mb-3">
                                                                <label class="form-label">Price per Day (৳)</label>
                                                                <input type="number" step="0.01" name="price_per_day" value="{{ $bed->price_per_day }}" class="form-control form-control-sm" required>
                                                            </div>
                                                        </div>
                                                        <div class="modal-footer">
                                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-primary">Update Bed</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                            <!-- =============================== Bed section start =============================== -->

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