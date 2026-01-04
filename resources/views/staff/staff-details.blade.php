<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Staff Details - {{ $company->name ?? 'HMS' }}</title>

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
            <div class="d-flex flex-column flex-md-row justify-content-between align-items-center mb-4">
                <!-- Title -->
                <h3 class="mb-3 mb-md-0 text-primary fw-bold">
                    <i class="bi bi-people-fill me-2"></i> Staff Details
                </h3>

                <!-- Create Button -->
                <button class="btn btn-success d-flex align-items-center" data-bs-toggle="modal" data-bs-target="#createStaffModal">
                    <i class="bi bi-calendar2-plus me-2"></i> Create New Staff
                </button>
            </div>
           
            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card m-0">                            
                            <div class="card-body p-0">
                                <div class="mb-3">
                                    <div class="input-group shadow-sm rounded overflow-hidden" style="border: 1px solid #ced4da;">
                                        <button class="btn" id="searchBtn" type="button">
                                            <i class="bi bi-search"></i>
                                        </button>
                                        <input type="text" 
                                            id="searchInput" 
                                            class="form-control" 
                                            placeholder="Search by name, email or phone..." 
                                            style="height: 48px;">
                                    </div>
                                </div>


                                <div class="table-responsive" style="max-height: 700px; overflow-y: auto;">
                                    <table class="table table-bordered table-hover mb-0 align-middle" id="staffTable">
                                        <thead class="table-light sticky-top">
                                            <tr class="text-center">
                                                <th width="5%">#</th>
                                                <th class="text-center" width="10%">Photo</th>
                                                <th class="text-start" width="60%">Name</th>
                                                <th width="15%">Other</th>
                                                <th width="5%">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse($staffs as $key => $staff)
                                            <tr>
                                                <td class="text-center">{{ $loop->iteration }}</td>
                                                <td class="text-center">
                                                    <img src="{{ $staff->photo ? asset('img/staff/'.$staff->photo) : asset('img/default.png') }}" 
                                                        alt="{{ $staff->name }}" class="rounded-circle" width="40" height="40">
                                                </td>
                                                <td>
                                                    <strong>{{ $staff->name }}</strong><br><small class="text-muted">{{ $staff->email ?? '-' }}</small>, 
                                                    <small class="text-muted">{{ $staff->contact_number ?? '-' }}</small>
                                                </td>
                                                <td class="text-center">
                                                    @if($staff->role === 'superadmin')
                                                        <span class="badge bg-danger">Super Admin</span>
                                                    @elseif($staff->role === 'admin')
                                                        <span class="badge bg-warning text-dark">Admin</span>
                                                    @elseif($staff->role === 'manager')
                                                        <span class="badge bg-primary text-white">Manager</span>
                                                    @else
                                                        <span class="badge bg-success">Staff</span>
                                                    @endif
                                                </td>
                                                <td class="text-center">
                                                    <a href="{{ route('staff.details.view', $staff->id) }}" class="btn btn-sm btn-outline-primary">View</a>
                                                </td>
                                            </tr>
                                            @empty
                                            <tr>
                                                <td colspan="5" class="text-center py-4 text-muted">No staff found.</td>
                                            </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>

                            </div>                                                   
                        </div>
                    </div>
                </section>
            </div>

            @include('layouts.footer')
        </div>
    </div>    




<div class="modal fade" id="createStaffModal" tabindex="-1" aria-labelledby="createStaffModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered modal-lg">
        <div class="modal-content">

            <form action="{{ route('create.staff') }}" method="POST">
                @csrf

                <div class="modal-header">
                    <h5 class="modal-title" id="createStaffModalLabel">Create New Staff</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                </div>

                <div class="modal-body">
                    <div class="row g-3">

                        {{-- Full Name --}}
                        <div class="col-md-6">
                            <label class="form-label">Full Name <span class="text-danger">*</span></label>
                            <input type="text" 
                                   name="name" 
                                   class="form-control" 
                                   required>
                        </div>

                        {{-- Email --}}
                        <div class="col-md-6">
                            <label class="form-label">Email Address <span class="text-danger">*</span></label>
                            <input type="email" 
                                   name="email" 
                                   class="form-control" 
                                   required>
                        </div>

                        {{-- Phone --}}
                        <div class="col-md-6">
                            <label class="form-label">Phone <span class="text-danger">*</span></label>
                            <input type="number" 
                                   name="number" min="0"
                                   class="form-control" 
                                   required>
                        </div>

                        {{-- Role --}}
                        <div class="col-md-6">
                            <label class="form-label">Role <span class="text-danger">*</span></label>
                            <select name="role" 
                                    class="form-select" 
                                    required>
                                <option value="">Select Role</option>
                                <option value="staff">Staff</option>
                                <option value="manager">Manager</option>
                                <option value="admin">Admin</option>
                            </select>
                        </div>

                        {{-- Password --}}
                        <div class="col-md-6">
                            <label class="form-label">Password <span class="text-danger">*</span></label>
                            <input type="password"
                                name="password"
                                id="password"
                                class="form-control"
                                required>

                            <ul class="small mt-2 mb-0" id="passwordRules">
                                <li id="rule-length" class="text-danger">Minimum 8 characters</li>
                                <li id="rule-upper" class="text-danger">At least 1 capital letter</li>
                                <li id="rule-lower" class="text-danger">At least 1 small letter</li>
                                <li id="rule-number" class="text-danger">At least 1 number</li>
                                <li id="rule-special" class="text-danger">At least 1 special character</li>
                            </ul>
                        </div>

                        {{-- Confirm Password --}}
                        <div class="col-md-6">
                            <label class="form-label">Confirm Password <span class="text-danger">*</span></label>
                            <input type="password"
                                name="password_confirmation"
                                id="confirmPassword"
                                class="form-control"
                                required>
                            <small id="confirmHelp"></small>
                        </div>

                    </div>
                </div>

                <!-- <div class="container-fluid px-3">
                    <div class="row g-4">

                        <div class="col-md-4">
                            <div class="card text-center shadow-sm">
                                <div class="card-body">
                                    <label class="form-label fw-semibold">Staff Photo</label>

                                    <div id="staff_photo_upload" 
                                        class="border border-2 border-dashed rounded p-4">
                                        <div class="text-center text-muted">
                                            <i class="bi bi-image fs-1"></i>
                                            <p class="mb-1">Upload a file or drag & drop</p>
                                            <label for="staff_photo" class="btn btn-sm btn-outline-success">
                                                Choose Photo
                                            </label>
                                            <input type="file" id="staff_photo" name="photo"
                                                class="d-none" accept="image/*">
                                            <small class="d-block mt-2">PNG, JPG up to 2MB</small>
                                        </div>
                                    </div>

                                    <img id="staff_preview"
                                        class="img-thumbnail mt-3 d-none"
                                        style="width:160px;height:160px;object-fit:cover;">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card text-center shadow-sm">
                                <div class="card-body">
                                    <label class="form-label fw-semibold">Father Photo</label>

                                    <div id="father_photo_upload"
                                        class="border border-2 border-dashed rounded p-4">
                                        <div class="text-center text-muted">
                                            <i class="bi bi-image fs-1"></i>
                                            <p class="mb-1">Upload a file or drag & drop</p>
                                            <label for="father_photo" class="btn btn-sm btn-outline-success">
                                                Choose Photo
                                            </label>
                                            <input type="file" id="father_photo" name="father_photo"
                                                class="d-none" accept="image/*">
                                            <small class="d-block mt-2">PNG, JPG up to 2MB</small>
                                        </div>
                                    </div>

                                    <img id="father_preview"
                                        class="img-thumbnail mt-3 d-none"
                                        style="width:160px;height:160px;object-fit:cover;">
                                </div>
                            </div>
                        </div>

                        <div class="col-md-4">
                            <div class="card text-center shadow-sm">
                                <div class="card-body">
                                    <label class="form-label fw-semibold">Mother Photo</label>

                                    <div id="mother_photo_upload"
                                        class="border border-2 border-dashed rounded p-4">
                                        <div class="text-center text-muted">
                                            <i class="bi bi-image fs-1"></i>
                                            <p class="mb-1">Upload a file or drag & drop</p>
                                            <label for="mother_photo" class="btn btn-sm btn-outline-success">
                                                Choose Photo
                                            </label>
                                            <input type="file" id="mother_photo" name="mother_photo"
                                                class="d-none" accept="image/*">
                                            <small class="d-block mt-2">PNG, JPG up to 2MB</small>
                                        </div>
                                    </div>

                                    <img id="mother_preview"
                                        class="img-thumbnail mt-3 d-none"
                                        style="width:160px;height:160px;object-fit:cover;">
                                </div>
                            </div>
                        </div>

                    </div>
                </div> -->

                <div class="modal-footer">
                    <button type="button" class="btn btn-outline-secondary" data-bs-dismiss="modal">
                        Cancel
                    </button>
                    <button type="submit" class="btn btn-success">
                        Create Staff
                    </button>
                </div>

            </form>

        </div>
    </div>
</div>





    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>
    <script>
        const password = document.getElementById('password');
        const confirmPassword = document.getElementById('confirmPassword');
        const submitBtn = document.querySelector('button[type="submit"]');
        const confirmHelp = document.getElementById('confirmHelp');

        const rules = {
            length: document.getElementById('rule-length'),
            upper: document.getElementById('rule-upper'),
            lower: document.getElementById('rule-lower'),
            number: document.getElementById('rule-number'),
            special: document.getElementById('rule-special'),
        };

        function toggleRule(element, condition) {
            if (condition) {
                element.classList.remove('text-danger');
                element.classList.add('text-success');
            } else {
                element.classList.remove('text-success');
                element.classList.add('text-danger');
            }
        }

        function validatePassword() {
            const value = password.value;

            const isLength  = value.length >= 8;
            const isUpper   = /[A-Z]/.test(value);
            const isLower   = /[a-z]/.test(value);
            const isNumber  = /[0-9]/.test(value);
            const isSpecial = /[^A-Za-z0-9]/.test(value);

            toggleRule(rules.length, isLength);
            toggleRule(rules.upper, isUpper);
            toggleRule(rules.lower, isLower);
            toggleRule(rules.number, isNumber);
            toggleRule(rules.special, isSpecial);

            const isValidPassword = isLength && isUpper && isLower && isNumber && isSpecial;

            // confirm password check
            if (confirmPassword.value !== '') {
                if (password.value !== confirmPassword.value) {
                    confirmPassword.classList.add('is-invalid');
                    confirmPassword.classList.remove('is-valid');
                    confirmHelp.classList.add('text-danger');
                    confirmHelp.textContent = 'Passwords do not match';
                } else {
                    confirmPassword.classList.remove('is-invalid');
                    confirmPassword.classList.add('is-valid');
                    confirmHelp.classList.remove('text-danger');
                    confirmHelp.classList.add('text-success');
                    confirmHelp.textContent = 'Passwords match';
                }
            }

            // submit enable / disable
            submitBtn.disabled = !(isValidPassword && password.value === confirmPassword.value);

            // password input style
            password.classList.toggle('is-valid', isValidPassword);
            password.classList.toggle('is-invalid', !isValidPassword && value.length > 0);
        }

        password.addEventListener('keyup', validatePassword);
        confirmPassword.addEventListener('keyup', validatePassword);

        // photo preview
        // function setupImageUpload(inputId, previewId, uploadId) {
        //     const input = document.getElementById(inputId);
        //     const preview = document.getElementById(previewId);
        //     const upload = document.getElementById(uploadId);

        //     input.addEventListener('change', function () {
        //         const file = this.files[0];
        //         if (!file) return;

        //         // Optional size check (2MB)
        //         if (file.size > 2 * 1024 * 1024) {
        //             alert('Image must be less than 2MB');
        //             input.value = '';
        //             return;
        //         }

        //         const reader = new FileReader();
        //         reader.onload = function (e) {
        //             preview.src = e.target.result;
        //             preview.classList.remove('d-none');
        //             upload.classList.add('d-none');
        //         };
        //         reader.readAsDataURL(file);
        //     });
        // }

        // setupImageUpload('staff_photo', 'staff_preview', 'staff_photo_upload');
        // setupImageUpload('father_photo', 'father_preview', 'father_photo_upload');
        // setupImageUpload('mother_photo', 'mother_preview', 'mother_photo_upload');


        document.getElementById('searchInput').addEventListener('keyup', function() {
            let filter = this.value.toLowerCase();
            let rows = document.querySelectorAll('#staffTable tbody tr');

            rows.forEach(row => {
                let nameCell = row.querySelector('td:nth-child(3)'); // Name, email, phone cell
                if(nameCell) {
                    let text = nameCell.textContent.toLowerCase();
                    if(text.includes(filter)) {
                        row.style.display = '';
                    } else {
                        row.style.display = 'none';
                    }
                }
            });
        });

        document.getElementById('searchBtn').addEventListener('click', function() {
            document.getElementById('searchInput').focus();
        });
    </script>

</body>

</html>