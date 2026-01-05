<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>{{ $staff->name }} - {{ $company->name ?? 'HMS' }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.css') }}">
    <!-- <link rel="stylesheet" href="{{ asset('assets/vendors/iconly/bold.css') }}"> -->
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
            <div class="page-heading">
                <h3>Modify <strong>{{ $staff->name }}</strong> Details</h3>
            </div>            
            <div class="page-content">
                <section class="my-5">
                    <form action="{{ route('staff.update', $staff->id) }}" method="POST" enctype="multipart/form-data">
                        @csrf

                        <!-- Profile Header -->
                        <div class="card mb-4 shadow-sm border-0 position-relative overflow-hidden"
                            style="background: linear-gradient(135deg, #e3f2fd, #ffffff);">

                            <div class="card-body p-0">
                                <div class="row g-0 align-items-stretch">

                                    <!-- LEFT : Profile Image -->
                                    <div class="col-md-4 d-flex justify-content-center align-items-center position-relative"
                                        style="background: #f5faff; min-height: 320px;">

                                        <!-- Back Button -->
                                        <a href="{{ url()->previous() }}"
                                        class="btn btn-sm btn-outline-secondary position-absolute top-0 start-0 m-3 d-flex align-items-center gap-1"
                                        style="z-index: 10;">
                                            <i class="bi bi-arrow-left"></i>
                                            <span>Back</span>
                                        </a>

                                        <div class="position-relative text-center" style="width: 220px;">
                                            <img id="profilePreview" src="{{ $staff->photo ? asset('img/staff/'.$staff->photo) : asset('img/default.png') }}"
                                                alt="Staff Photo"
                                                class="rounded-circle border border-4 border-white shadow mb-2"
                                                style="width: 220px; height: 220px; object-fit: cover;">

                                            <input type="file" name="photo" class="form-control form-control-sm mt-2" onchange="previewImage(event, 'profilePreview')">
                                            <small class="text-muted d-block">Change profile photo</small>
                                        </div>

                                    </div>

                                    <!-- RIGHT : Details -->
                                    <div class="col-md-8 p-4 p-lg-5">

                                        <div class="mb-3">
                                            <label for="name" class="form-label fw-bold">Full Name</label>
                                            <input type="text" name="name" id="name" class="form-control" value="{{ $staff->name }}">
                                        </div>

                                        <div class="mb-3">
                                            <label for="email" class="form-label fw-bold">Email</label>
                                            <input type="email" name="email" id="email" class="form-control" value="{{ $staff->email }}">
                                        </div>

                                        <div class="mb-3">
                                            <label for="role" class="form-label fw-bold">Role</label>
                                            <select name="role" id="role" class="form-select">
                                                <option value="superadmin" {{ $staff->role==='superadmin'?'selected':'' }}>Superadmin</option>
                                                <option value="admin" {{ $staff->role==='admin'?'selected':'' }}>Admin</option>
                                                <option value="manager" {{ $staff->role==='manager'?'selected':'' }}>Manager</option>
                                                <option value="staff" {{ $staff->role==='staff'?'selected':'' }}>Staff</option>
                                            </select>
                                        </div>

                                        <div class="row g-3">
                                            <div class="col-md-6">
                                                <label class="form-label fw-bold">Last Login</label>
                                                <span class="form-control">{{ $staff->last_login_at ? \Carbon\Carbon::parse($staff->last_login_at)->format('d-M-Y H:i') : 'Never' }}</span>
                                            </div>
                                            <div class="col-md-6">
                                                <label class="form-label fw-bold">Last Activity</label>
                                                <span class="form-control">{{ $staff->last_activity ? \Carbon\Carbon::parse($staff->last_activity)->diffForHumans() : '-' }}</span>
                                            </div>
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Personal Information -->
                         <div class="card mb-4 shadow-sm border-0" style="background-color: #e6f4ea;">
                            <div class="card-header fw-bold text-white mb-4" style="background-color: #28a745; font-size: 1.1rem;">
                                <i class="bi bi-person-lines-fill me-2"></i> Personal Information
                            </div>                            
                            <div class="card-body">
                                <div class="row g-3">

                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Present Address</label>
                                        <input type="text" name="address1" class="form-control" value="{{ $staff->address1 }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Permanent Address</label>
                                        <input type="text" name="address2" class="form-control" value="{{ $staff->address2 }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Date of Birth</label>
                                        <input type="date" name="dob" class="form-control" value="{{ $staff->dob }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Gender</label>
                                        <select name="gender" class="form-select">
                                            <option value="Male" {{ $staff->gender==='Male'?'selected':'' }}>Male</option>
                                            <option value="Female" {{ $staff->gender==='Female'?'selected':'' }}>Female</option>
                                            <option value="Other" {{ $staff->gender==='Other'?'selected':'' }}>Other</option>
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Blood Group</label>
                                        <input type="text" name="blood_group" class="form-control" value="{{ $staff->blood_group }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Religion</label>
                                        <input type="text" name="religion" class="form-control" value="{{ $staff->religion }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Nationality</label>
                                        <input type="text" name="nationality" class="form-control" value="{{ $staff->nationality }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">National ID</label>
                                        <input type="text" name="national_id" class="form-control" value="{{ $staff->national_id }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Contact Number</label>
                                        <input type="text" name="contact_number" class="form-control" value="{{ $staff->contact_number }}">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Parent Information -->
                        <div class="card mb-4 shadow-sm border-0">
                            <div class="card-header fw-bold text-dark mb-4" style="background: linear-gradient(135deg, #fff3cd, #ffffff);">
                                <i class="bi bi-people-fill me-2 text-danger"></i> Parent Information
                            </div>
                            <div class="card-body">
                                <div class="row g-4">

                                    <!-- Father -->
                                    <div class="col-md-6">
                                        <div class="border rounded-3 p-3">
                                            <h6 class="fw-bold mb-3 text-primary"><i class="bi bi-person-fill me-1"></i> Father</h6>

                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Name</label>
                                                <input type="text" name="father_name" class="form-control" value="{{ $staff->father_name }}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Profession</label>
                                                <input type="text" name="father_profession" class="form-control" value="{{ $staff->father_profession }}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Contact</label>
                                                <input type="text" name="father_contact" class="form-control" value="{{ $staff->father_contact }}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Email</label>
                                                <input type="email" name="father_email" class="form-control" value="{{ $staff->father_email }}">
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Photo</label>
                                                <input type="file" name="father_photo" class="form-control form-control-sm" onchange="previewImage(event, 'fatherPreview')">
                                                <img id="fatherPreview" src="{{ $staff->father_photo ? asset('img/father/'.$staff->father_photo) : asset('img/default.png') }}" class="img-fluid mt-2 rounded-circle" style="width: 100px; height: 100px; object-fit: cover;">
                                            </div>

                                        </div>
                                    </div>

                                    <!-- Mother -->
                                    <div class="col-md-6">
                                        <div class="border rounded-3 p-3">
                                            <h6 class="fw-bold mb-3 text-primary"><i class="bi bi-person-fill me-1"></i> Mother</h6>

                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Name</label>
                                                <input type="text" name="mother_name" class="form-control" value="{{ $staff->mother_name }}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Profession</label>
                                                <input type="text" name="mother_profession" class="form-control" value="{{ $staff->mother_profession }}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Contact</label>
                                                <input type="text" name="mother_contact" class="form-control" value="{{ $staff->mother_contact }}">
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Email</label>
                                                <input type="email" name="mother_email" class="form-control" value="{{ $staff->mother_email }}">
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label fw-bold">Photo</label>
                                                <input type="file" name="mother_photo" class="form-control form-control-sm" onchange="previewImage(event, 'motherPreview')">
                                                <img id="motherPreview" src="{{ $staff->mother_photo ? asset('img/mother/'.$staff->mother_photo) : asset('img/default.png') }}" class="img-fluid mt-2 rounded-circle" style="width: 100px; height: 100px; object-fit: cover;">
                                            </div>

                                        </div>
                                    </div>

                                </div>
                            </div>
                        </div>

                        <!-- Guardian Information -->
                        <div class="card mb-4 shadow-sm border-0">
                            <div class="card-header fw-bold text-dark mb-4" style="background-color: #d6d8d9; font-size: 1.1rem;">
                                <i class="bi bi-shield-fill-check me-2"></i> Guardian Information
                            </div>
                            <div class="card-body">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Name</label>
                                        <input type="text" name="guardian_name" class="form-control" value="{{ $staff->guardian_name }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Relationship</label>
                                        <input type="text" name="guardian_relationship" class="form-control" value="{{ $staff->guardian_relationship }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Contact</label>
                                        <input type="text" name="guardian_contact" class="form-control" value="{{ $staff->guardian_contact }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">Email</label>
                                        <input type="email" name="guardian_email" class="form-control" value="{{ $staff->guardian_email }}">
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label fw-bold">NID</label>
                                        <input type="text" name="guardian_nid" class="form-control" value="{{ $staff->guardian_nid }}">
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="text-end mb-4">
                            <button type="submit" class="btn btn-primary btn-lg">
                                <i class="bi bi-save me-1"></i> Update Staff
                            </button>
                        </div>

                    </form> 
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
    <!-- Image preview JS -->
    <script>
        function previewImage(event, previewId) {
            const reader = new FileReader();
            reader.onload = function(){
                const output = document.getElementById(previewId);
                output.src = reader.result;
            }
            reader.readAsDataURL(event.target.files[0]);
        }
    </script>
</body>

</html>