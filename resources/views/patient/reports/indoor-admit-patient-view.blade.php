<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Indoor Patient Details - {{ $company->name ?? 'HMS' }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.css') }}">
    <!-- <link rel="stylesheet" href="{{ asset('assets/vendors/iconly/bold.css') }}"> -->
    <link rel="stylesheet" href="{{ asset('assets/vendors/bootstrap-icons/bootstrap-icons.css') }}">
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

            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">                            
                            <div class="bg-white shadow-lg rounded-2xl p-4 mt-6">
                                

                                <div class="card-header bg-white border-bottom d-flex justify-content-between align-items-center">
                                    <!-- Left text -->                                   

                                    <div class="flex justify-between items-center mb-4">
                                        <h2 class="text-lg font-semibold text-gray-800">Indoor Admit Patients Reports</h2>
                                        <nav aria-label="breadcrumb">
                                            <ol class="breadcrumb">
                                                <li class="breadcrumb-item"><a href="/">Home</a></li>
                                                <li class="breadcrumb-item"><a href="{{ route('patients.indoor') }}">Admin Patient</a></li>
                                                <li class="breadcrumb-item active" aria-current="page">Report / <span class="text-sm text-gray-500">Total: {{ $indoorPatients->count() }}</span></li>
                                            </ol>
                                        </nav>
                                    </div>

                                    <!-- Right button -->
                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filterModal">
                                        <i class="bi bi-funnel"></i> Admit Patient
                                    </button>

                                    <!-- Modal -->
                                    <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-lg modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="filterModalLabel">Admit Patient</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>
                                                
                                                <div class="modal-body">
                                                    <!-- Filter Form -->
                                                    <form method="GET" action="{{ route('filter.admin.patient') }}" class="row g-3">
                                                        <!-- Start Date -->
                                                        <div class="col-md-4">
                                                            <label for="start_date" class="form-label">Start Date</label>
                                                            <input type="date" id="start_date" name="start_date" class="form-control">
                                                        </div>

                                                        <!-- End Date -->
                                                        <div class="col-md-4">
                                                            <label for="end_date" class="form-label">End Date</label>
                                                            <input type="date" id="end_date" name="end_date" class="form-control">
                                                        </div>

                                                        <!-- Buttons -->
                                                        <div class="col-md-4 d-flex align-items-end gap-2">
                                                            
                                                            <button type="submit" name="submit" class="btn btn-primary w-100">
                                                                <i class="bi bi-funnel"></i> Filter
                                                            </button>
                                                            <button type="submit" class="btn btn-outline-secondary px-4 w-100" value="1" name="print" formtarget="_blank">
                                                                <i class="bi bi-printer"></i> Print
                                                            </button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                    

                                <div class="overflow-x-auto">
                                    <div class="table-responsive shadow-sm rounded mt-3">
                                        <table class="table table-striped table-hover align-middle text-start">                                            
                                            <thead class="table-primary text-sm">
                                                <tr>
                                                    <th class="text-center">#</th>
                                                    <th class="text-center">Admit Date</th>
                                                    <th class="text-center">Invoice No</th>
                                                    <th>Name</th>
                                                    <th>Contact Info</th>
                                                    <th>Doctor</th>
                                                    <th>Room</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse($indoorPatients as $key => $val)
                                                <tr>
                                                    <td class="text-center">{{ $key + 1 }}</td>
                                                    <td class="text-center">{{ \Carbon\Carbon::parse($val->bed_booked_date)->format('d-M-Y') }}</td>
                                                    <td class="text-center"><a href="{{url('/indoors/edit/'.$val->id)}}">{{ $val->reg ?? '-' }}</a></td>
                                                    <td><a href="{{url('/indoors/edit/'.$val->id)}}">{{ $val->name ?? '-' }}</a></td>
                                                    <td>
                                                        <small class="fw-semibold">
                                                            <i class="bi bi-telephone-fill text-primary me-2"></i>
                                                            {{ $val->mobile ?? '-' }}
                                                        </small>
                                                        <small title="{{ $val->address }}">
                                                            <i class="bi bi-geo-alt-fill text-primary me-1"></i>
                                                            {{ \Illuminate\Support\Str::limit($val->address, 40, '...') }}
                                                        </small>
                                                    </td>
                                                    <td>{{ $val->treatmentUnder->name }}</td>
                                                    <td>{{ $val->bed->bed_number }}</td>
                                                </tr>
                                                @empty
                                                <tr>
                                                    <td colspan="24" class="text-muted text-center py-3">No patients found for today.</td>
                                                </tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>
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

    <script>
        const today = new Date().toISOString().split('T')[0];
        const startDateInput = document.getElementById('start_date');
        const endDateInput = document.getElementById('end_date');
        startDateInput.value = today;
        endDateInput.value = today;
        startDateInput.max = today;
        endDateInput.max = today;
    </script>

</body>

</html>