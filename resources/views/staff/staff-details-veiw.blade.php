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
            <div class="page-heading">
                <h3>Staff Details - {{ $staff->name }}</h3>
            </div>            
            <div class="page-content">
                <section class="my-5">
                    <!-- Profile Header -->
                    <div class="card mb-4 shadow-sm border-0 position-relative" style="background-color: #e3f2fd;">    
                        <!-- Back Button -->
                        <a href="{{ url()->previous() }}" 
                        class="position-absolute top-0 start-0 m-3 btn btn-sm btn-outline-secondary d-flex align-items-center">
                            <i class="bi bi-arrow-left me-1"></i> Back
                        </a>

                        <div class="card-body text-center py-5">
                            <!-- Profile Image -->
                            <div class="mx-auto mb-3" style="width: 160px; height: 160px;">
                                <img src="{{ $staff->photo ? asset('img/staff/'.$staff->photo) : asset('img/default.png') }}"
                                    alt="{{ $staff->name }}"
                                    class="rounded-circle border border-3 border-secondary shadow"
                                    style="width: 100%; height: 100%; object-fit: cover;">
                            </div>

                            <!-- Name & Email -->
                            <h2 class="card-title fw-bold mb-1">{{ $staff->name }}</h2>
                            <p class="text-muted mb-2">{{ $staff->email }}</p>

                            <!-- Role Badge -->
                            <span class="badge fs-6 
                                {{ $staff->role === 'superadmin' ? 'bg-danger' : ($staff->role === 'admin' ? 'bg-warning text-dark' : ($staff->role === 'manager' ? 'bg-primary' : 'bg-success')) }}
                                py-2 px-3">
                                {{ ucfirst($staff->role) }}
                            </span>

                            <!-- Optional Last Login -->
                            @if($staff->last_login_at)
                            <p class="text-muted mt-2 mb-0 small">
                                Last login: {{ \Carbon\Carbon::parse($staff->last_login_at)->diffForHumans() }}
                            </p>
                            @endif
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


                    <!-- Father Information -->
                    <div class="card mb-4 shadow-sm border-0">
                        <!-- Header -->
                        <div class="card-header fw-bold text-dark" style="background-color: #fff3cd; font-size: 1.1rem;">
                            <i class="bi bi-person-fill me-2"></i> Father Information
                        </div>

                        <!-- Body -->
                        <div class="card-body mt-3">
                            <div class="row align-items-center g-3">
                                <!-- Photo -->
                                <div class="col-md-4 text-center">
                                    <div class="mx-auto mb-2" style="width: 130px; height: 130px;">
                                        <img src="{{ $staff->father_photo ? asset('img/father/'.$staff->father_photo) : asset('img/default.png') }}"
                                            alt="Father Photo"
                                            class="rounded-circle border border-secondary shadow-sm"
                                            style="width: 100%; height: 100%; object-fit: cover;">
                                    </div>
                                    <p class="text-muted small mb-0">Father Photo</p>
                                </div>

                                <!-- Details -->
                                <div class="col-md-8">
                                    <p class="mb-1"><strong>Name:</strong> {{ $staff->father_name ?? '-' }}</p>
                                    <p class="mb-1"><strong>Profession:</strong> {{ $staff->father_profession ?? '-' }}</p>
                                    <p class="mb-1"><strong>Contact:</strong> {{ $staff->father_contact ?? '-' }}</p>
                                    <p class="mb-1"><strong>Email:</strong> {{ $staff->father_email ?? '-' }}</p>
                                </div>
                            </div>
                        </div>
                    </div>


                    <!-- Mother Information -->
                    <div class="card mb-4 shadow-sm border-0">
                        <!-- Header -->
                        <div class="card-header fw-bold text-dark" style="background-color: #f8d7da; font-size: 1.1rem;">
                            <i class="bi bi-person-fill me-2"></i> Mother Information
                        </div>

                        <!-- Body -->
                        <div class="card-body mt-3">
                            <div class="row align-items-center g-3">
                                <!-- Photo -->
                                <div class="col-md-4 text-center">
                                    <div class="mx-auto mb-2" style="width: 130px; height: 130px;">
                                        <img src="{{ $staff->mother_photo ? asset('img/mother/'.$staff->mother_photo) : asset('img/default.png') }}"
                                            alt="Mother Photo"
                                            class="rounded-circle border border-secondary shadow-sm"
                                            style="width: 100%; height: 100%; object-fit: cover;">
                                    </div>
                                    <p class="text-muted small mb-0">Mother Photo</p>
                                </div>

                                <!-- Details -->
                                <div class="col-md-8">
                                    <p class="mb-1"><strong>Name:</strong> {{ $staff->mother_name ?? '-' }}</p>
                                    <p class="mb-1"><strong>Profession:</strong> {{ $staff->mother_profession ?? '-' }}</p>
                                    <p class="mb-1"><strong>Contact:</strong> {{ $staff->mother_contact ?? '-' }}</p>
                                    <p class="mb-1"><strong>Email:</strong> {{ $staff->mother_email ?? '-' }}</p>
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

</body>

</html>