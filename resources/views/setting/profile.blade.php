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
                <h3><strong>{{ $staff->name }}</strong> - Profile</h3>
            </div>            
            <div class="page-content">
                <section class="my-5">
                    <!-- Profile Header -->
                    <div class="card mb-4 shadow-sm border-0 position-relative overflow-hidden"
                        style="background: linear-gradient(135deg, #e3f2fd, #ffffff);">

                        <!-- Back Button -->
                        <a href="{{ url()->previous() }}"
                        class="btn btn-sm btn-outline-secondary position-absolute top-0 start-0 m-3 d-flex align-items-center gap-1"
                        style="z-index: 10;">
                            <i class="bi bi-arrow-left"></i>
                            <span>Back</span>
                        </a>

                        <div class="card-body p-0">
                            <div class="row g-0 align-items-stretch">

                                <!-- LEFT : Profile Image (col-4) -->
                                <div class="col-md-4 d-flex justify-content-center align-items-center position-relative"
                                    style="background: #f5faff; min-height: 320px;">

                                    <div class="position-relative" style="width: 220px; height: 220px;">
                                        <img src="{{ $staff->photo ? asset('img/staff/'.$staff->photo) : asset('img/default.png') }}"
                                            alt="{{ $staff->name }}"
                                            class="rounded-circle border border-4 border-white shadow"
                                            style="width: 100%; height: 100%; object-fit: cover;">

                                        {{-- Online / Offline indicator --}}
                                        @if($staff->last_activity && $staff->last_activity->gt(now()->subMinutes(5)))
                                            <span class="position-absolute bottom-0 end-0 translate-middle p-2 bg-success border border-white rounded-circle"
                                                title="Online"></span>
                                        @else
                                            <span class="position-absolute bottom-0 end-0 translate-middle p-2 bg-secondary border border-white rounded-circle"
                                                title="Offline"></span>
                                        @endif
                                    </div>
                                </div>

                                <!-- RIGHT : Details (col-8) -->
                                <div class="col-md-8 p-4 p-lg-5">

                                    <!-- Name -->
                                    <h3 class="fw-bold mb-1">{{ $staff->name }}</h3>

                                    <!-- Email -->
                                    <p class="text-muted mb-3">
                                        <i class="bi bi-envelope me-1"></i>{{ $staff->email }}
                                    </p>

                                    <!-- Role Badge -->
                                    <span class="badge rounded-pill px-4 py-2 fs-6 mb-3 d-inline-block
                                        {{ $staff->role === 'superadmin' ? 'bg-danger' :
                                        ($staff->role === 'admin' ? 'bg-warning text-dark' :
                                        ($staff->role === 'manager' ? 'bg-primary' : 'bg-success')) }}">
                                        <i class="bi bi-shield-lock me-1"></i>
                                        {{ ucfirst($staff->role) }}
                                    </span><br>

                                    <a href="{{ route('staff.edit', $staff->id) }}" class="btn btn-sm btn-outline-success ms-2">
                                        <i class="bi bi-pencil-square me-1"></i> Edit
                                    </a> 

                                    <button type="button" class="btn btn-sm btn-outline-primary ms-2" data-bs-toggle="modal" data-bs-target="#changePasswordModal">
                                        <i class="bi bi-key me-1"></i> Change Password
                                    </button>

                                    <a href="{{ route('logout') }}" class="btn btn-sm btn-outline-danger ms-2">
                                        <i class="bi bi-box-arrow-left me-1"></i> Logout
                                    </a> 

                                    <!-- Divider -->
                                    <hr class="my-4">

                                    <!-- Meta Info -->
                                    <div class="row small text-muted">

                                        @if($staff->last_login_at)
                                        <div class="col-md-6 mb-2">
                                            <i class="bi bi-box-arrow-in-right me-1"></i>
                                            <strong>Last Login:</strong>
                                            {{ \Carbon\Carbon::parse($staff->last_login_at)->diffForHumans() }}
                                        </div>
                                        @endif

                                        <div class="col-md-6 mb-2">
                                            <i class="bi bi-activity me-1"></i>
                                            <strong>Last Activity:</strong>
                                            {{ \Carbon\Carbon::parse($staff->last_activity)->diffForHumans() }}
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Personal Information -->
                    <div class="card mb-4 shadow-sm border-0" style="background-color: #e6f4ea;">
                        <!-- Header -->
                        <div class="card-header fw-bold text-white" style="background-color: #28a745; font-size: 1.1rem;">
                            <i class="bi bi-person-lines-fill me-2"></i> Personal Information
                        </div>

                        <!-- Body -->
                        <div class="card-body">
                            <div class="row g-3 mt-2">
                                <div class="col-md-6">
                                    <i class="bi bi-geo-alt-fill text-success me-1"></i>
                                    <strong>Present Address:</strong> {{ $staff->address1 ?? '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-house-fill text-success me-1"></i>
                                    <strong>Permanent Address:</strong> {{ $staff->address2 ?? '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-calendar-event-fill text-success me-1"></i>
                                    <strong>Date of Birth:</strong> {{ $staff->dob ? \Carbon\Carbon::parse($staff->dob)->format('d-M-Y') : '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-gender-ambiguous text-success me-1"></i>
                                    <strong>Gender:</strong> {{ $staff->gender ?? '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-droplet-fill text-success me-1"></i>
                                    <strong>Blood Group:</strong> {{ $staff->blood_group ?? '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-book-fill text-success me-1"></i>
                                    <strong>Religion:</strong> {{ $staff->religion ?? '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-flag-fill text-success me-1"></i>
                                    <strong>Nationality:</strong> {{ $staff->nationality ?? '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-credit-card-2-front-fill text-success me-1"></i>
                                    <strong>National ID:</strong> {{ $staff->national_id ?? '-' }}
                                </div>
                                <div class="col-md-6">
                                    <i class="bi bi-telephone-fill text-success me-1"></i>
                                    <strong>Contact Number:</strong> {{ $staff->contact_number ?? '-' }}
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Parent Information -->
                    <div class="card mb-4 shadow-sm border-0">
                        <!-- Header -->
                        <div class="card-header fw-bold text-dark" style="background: linear-gradient(135deg, #fff3cd, #ffffff);">
                            <i class="bi bi-people-fill me-2 text-danger"></i> <span class="text-danger"> Parent Information </span>
                        </div>

                        <div class="card-body">
                            <div class="row g-4">

                                <!-- ================= Father ================= -->
                                <div class="col-md-6 pt-4">
                                    <div class="border rounded-3 p-3 h-100">

                                        <h6 class="fw-bold mb-3 text-primary">
                                            <i class="bi bi-person-fill me-1"></i> Father
                                        </h6>

                                        <div class="row align-items-center g-3">

                                            <!-- Photo -->
                                            <div class="col-sm-4 text-center">
                                                <div class="mx-auto" style="width: 120px; height: 120px;">
                                                    <img src="{{ $staff->father_photo ? asset('img/father/'.$staff->father_photo) : asset('img/default.png') }}"
                                                        alt="Father Photo"
                                                        class="rounded-circle border border-3 border-white shadow-sm"
                                                        style="width: 100%; height: 100%; object-fit: cover;">
                                                </div>
                                            </div>

                                            <!-- Details -->
                                            <div class="col-sm-8 small text-muted">
                                                <p class="mb-1"><strong>Name:</strong> {{ $staff->father_name ?? '-' }}</p>
                                                <p class="mb-1"><strong>Profession:</strong> {{ $staff->father_profession ?? '-' }}</p>
                                                <p class="mb-1"><strong>Contact:</strong> {{ $staff->father_contact ?? '-' }}</p>
                                                <p class="mb-1"><strong>Email:</strong> {{ $staff->father_email ?? '-' }}</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                                <!-- ================= Mother ================= -->
                                <div class="col-md-6 pt-4">
                                    <div class="border rounded-3 p-3 h-100">

                                        <h6 class="fw-bold mb-3 text-primary">
                                            <i class="bi bi-person-fill me-1"></i> Mother
                                        </h6>

                                        <div class="row align-items-center g-3">

                                            <!-- Photo -->
                                            <div class="col-sm-4 text-center">
                                                <div class="mx-auto" style="width: 120px; height: 120px;">
                                                    <img src="{{ $staff->mother_photo ? asset('img/mother/'.$staff->mother_photo) : asset('img/default.png') }}"
                                                        alt="Mother Photo"
                                                        class="rounded-circle border border-3 border-white shadow-sm"
                                                        style="width: 100%; height: 100%; object-fit: cover;">
                                                </div>
                                            </div>

                                            <!-- Details -->
                                            <div class="col-sm-8 small text-muted">
                                                <p class="mb-1"><strong>Name:</strong> {{ $staff->mother_name ?? '-' }}</p>
                                                <p class="mb-1"><strong>Profession:</strong> {{ $staff->mother_profession ?? '-' }}</p>
                                                <p class="mb-1"><strong>Contact:</strong> {{ $staff->mother_contact ?? '-' }}</p>
                                                <p class="mb-1"><strong>Email:</strong> {{ $staff->mother_email ?? '-' }}</p>
                                            </div>

                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>
                    </div>



                    <!-- Guardian Information -->
                    <div class="card mb-4 shadow-sm border-0">
                        <!-- Header -->
                        <div class="card-header fw-bold text-dark" style="background-color: #d6d8d9; font-size: 1.1rem;">
                            <i class="bi bi-shield-fill-check me-2"></i> Guardian Information
                        </div>

                        <!-- Body -->
                        <div class="card-body mt-3">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Name:</strong> {{ $staff->guardian_name ?? '-' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Relationship:</strong> {{ $staff->guardian_relationship ?? '-' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Contact:</strong> {{ $staff->guardian_contact ?? '-' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Email:</strong> {{ $staff->guardian_email ?? '-' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>NID:</strong> {{ $staff->guardian_nid ?? '-' }}</p>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- System Information -->
                    <div class="card mb-4 shadow-sm border-0">
                        <!-- Header -->
                        <div class="card-header fw-bold text-dark" style="background-color: #f0f0f0; font-size: 1.1rem;">
                            <i class="bi bi-gear-fill me-2"></i> System Information
                        </div>

                        <!-- Body -->
                        <div class="card-body mt-3">
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <p class="mb-1">
                                        <strong>Status:</strong> 
                                        <span class="{{ $staff->status ? 'text-success fw-semibold' : 'text-danger fw-semibold' }}">
                                            {{ $staff->status ? 'Active' : 'Inactive' }}
                                        </span>
                                    </p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Last Login:</strong> {{ $staff->last_login_at ? \Carbon\Carbon::parse($staff->last_login_at)->diffForHumans() : 'Never' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Last Login IP:</strong> {{ $staff->last_login_ip ?? '-' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Remark:</strong> {{ $staff->remark ?? '-' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Email Verified:</strong> {{ $staff->email_verified_at ? \Carbon\Carbon::parse($staff->email_verified_at)->format('d-M-Y H:i') : 'No' }}</p>
                                </div>
                                <div class="col-md-6">
                                    <p class="mb-1"><strong>Cache & Cookie:</strong><a href="{{ route('clear.cache') }}"> Clear cache & cookie.</a></p>
                                </div>
                            </div>
                        </div>
                    </div>


                </section>
            </div>

            @include('layouts.footer')
        </div>
    </div>    


<!-- Password Change Modal -->
<div class="modal fade" id="changePasswordModal" tabindex="-1" aria-labelledby="changePasswordModalLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">

        <!-- Modal Header -->
        <div class="modal-header bg-primary text-white">
            <h5 class="modal-title text-white" id="changePasswordModalLabel"><i class="bi bi-shield-lock fs-4 me-1"></i> Change Password</h5>
            <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>

        <!-- Modal Body -->
        <div class="modal-body">
            <form id="changePasswordForm" action="{{ route('update.user.password') }}" method="POST">
            @csrf

            <div class="mb-3">
                <label class="form-label fw-semibold">New Password</label>
                <input type="password" id="new_password" name="new_password" class="form-control" required>
                <input type="email" id="email" name="email" class="form-control" value="{{ $staff->email }}" hidden required>
            </div>

            <div class="mb-3">
                <label class="form-label fw-semibold">Confirm Password</label>
                <input type="password" id="confirm_password" name="confirm_password" class="form-control" required>
            </div>

            <div class="mb-3">
                <ul class="list-unstyled small">
                <li id="rule-length" class="text-danger"><i class="bi bi-x-circle me-1"></i> Minimum 6 characters</li>
                <li id="rule-upper" class="text-danger"><i class="bi bi-x-circle me-1"></i> At least 1 capital letter</li>
                <li id="rule-lower" class="text-danger"><i class="bi bi-x-circle me-1"></i> At least 1 small letter</li>
                <li id="rule-number" class="text-danger"><i class="bi bi-x-circle me-1"></i> At least 1 number</li>
                <li id="rule-special" class="text-danger"><i class="bi bi-x-circle me-1"></i> At least 1 special character</li>
                <li id="rule-match" class="text-danger"><i class="bi bi-x-circle me-1"></i> Passwords match</li>
                </ul>
            </div>

            <button type="submit" id="submitBtn" class="btn btn-primary w-100" disabled>Update Password</button>
            </form>
        </div>

        </div>
    </div>
</div>


    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>

    <!-- live password validation -->
    <script>
        const newPassword = document.getElementById('new_password');
        const confirmPassword = document.getElementById('confirm_password');
        const submitBtn = document.getElementById('submitBtn');

        const rules = {
            length: document.getElementById('rule-length'),
            upper: document.getElementById('rule-upper'),
            lower: document.getElementById('rule-lower'),
            number: document.getElementById('rule-number'),
            special: document.getElementById('rule-special'),
            match: document.getElementById('rule-match'),
        };

        function updateRule(rule, passed) {
            rule.classList.remove('text-danger', 'text-success');
            rule.classList.add(passed ? 'text-success' : 'text-danger');
            rule.querySelector('i').className =
                passed ? 'bi bi-check-circle me-1' : 'bi bi-x-circle me-1';
        }

        function validateLive() {
            const pwd = newPassword.value;
            const confirm = confirmPassword.value;

            const checks = {
                length: pwd.length >= 6,
                upper: /[A-Z]/.test(pwd),
                lower: /[a-z]/.test(pwd),
                number: /[0-9]/.test(pwd),
                special: /[!@#$%^&*(),.?":{}|<>]/.test(pwd),
                match: pwd && pwd === confirm
            };

            updateRule(rules.length, checks.length);
            updateRule(rules.upper, checks.upper);
            updateRule(rules.lower, checks.lower);
            updateRule(rules.number, checks.number);
            updateRule(rules.special, checks.special);
            updateRule(rules.match, checks.match);

            submitBtn.disabled = !Object.values(checks).every(Boolean);
        }

        newPassword.addEventListener('keyup', validateLive);
        confirmPassword.addEventListener('keyup', validateLive);
    </script>

</body>

</html>