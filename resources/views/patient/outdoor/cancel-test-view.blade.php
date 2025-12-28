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
                <h3>Test Cancel View</h3>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">                            
                            <div class="card-body">
                                <!-- Tabs -->
                                <ul class="nav nav-tabs mb-3" id="patientTabs" role="tablist">
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link active" id="today-tab" data-bs-toggle="tab" data-bs-target="#today" type="button" role="tab">Today</button>
                                    </li>
                                    <li class="nav-item" role="presentation">
                                        <button class="nav-link" id="cancelled-tab" data-bs-toggle="tab" data-bs-target="#cancelled" type="button" role="tab">Cancelled</button>
                                    </li>
                                </ul>

                                <div class="tab-content" id="patientTabsContent">
                                    <!-- Today's Patients -->
                                    <div class="tab-pane fade show active" id="today" role="tabpanel">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover table-bordered align-middle">
                                                <thead class="table-dark">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Reg</th>
                                                        <th>Name</th>
                                                        <th>Phone</th>
                                                        <th>Date</th>
                                                        <th class="text-center">Action</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @forelse($patientData as $key => $patient)
                                                    <tr style="{{ $patient->due > 0 ? 'background-color: #fff8e1;' : '' }}">
                                                        <td>{{ $key + 1 }}</td>
                                                        <td><a href="{{ url('/patients/invoice/details/'.$patient->reg) }}">{{ $patient->reg ?? '-' }}</a></td>
                                                        <td><a href="{{ url('/patients/invoice/details/'.$patient->reg) }}">{{ $patient->name ?? '-' }}</a></td>
                                                        <td>0{{ $patient->phone ?? '-' }}</td>
                                                        <td>{{ \Carbon\Carbon::parse($patient->date)->format('d-M-Y') }}</td>
                                                        <td class="text-center">
                                                            <a href="{{ url('/patients/print-invoice/'.$patient->reg) }}" target="_blank" class="btn btn-sm btn-success" title="Print Invoice">
                                                                <i class="fa-solid fa-print"></i>
                                                            </a>
                                                            <a href="{{ url('/patients/test-cancel/'.$patient->reg) }}" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure? Do you want to cancel this test?')" title="Cancel Test">
                                                                <i class="fa-solid fa-rotate-left"></i>
                                                            </a>
                                                        </td>
                                                    </tr>
                                                    @empty
                                                    <tr>
                                                        <td colspan="6" class="text-center">No patients found for today.</td>
                                                    </tr>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                            <div class="mt-3 d-flex justify-content-end">
                                                {{ $patientData->links('pagination::bootstrap-5') }}
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Cancelled Patients -->
                                    <div class="tab-pane fade" id="cancelled" role="tabpanel">
                                        <div class="table-responsive">
                                            <table class="table table-striped table-hover table-bordered align-middle">
                                                <thead class="table-dark">
                                                    <tr>
                                                        <th>#</th>
                                                        <th>Reg</th>
                                                        <th>Name</th>
                                                        <th>Phone</th>
                                                        <th>Date</th>
                                                        <th class="text-center">Status</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    @forelse($cancelData as $key => $patient)
                                                    <tr style="{{ $patient->due > 0 ? 'background-color: #fff8e1;' : '' }}">
                                                        <td>{{ $key + 1 }}</td>
                                                        <td><a href="{{ url('/patients/invoice/details/'.$patient->reg) }}">{{ $patient->reg ?? '-' }}</a></td>
                                                        <td><a href="{{ url('/patients/invoice/details/'.$patient->reg) }}">{{ $patient->name ?? '-' }}</a></td>
                                                        <td>0{{ $patient->phone ?? '-' }}</td>
                                                        <td>{{ \Carbon\Carbon::parse($patient->date)->format('d-M-Y') }}</td>
                                                        <td class="text-center">
                                                            <span class="badge bg-danger">Cancelled</span>
                                                        </td>
                                                    </tr>
                                                    @empty
                                                    <tr>
                                                        <td colspan="6" class="text-center">No cancelled patients found for today.</td>
                                                    </tr>
                                                    @endforelse
                                                </tbody>
                                            </table>
                                            <div class="mt-3 d-flex justify-content-end">
                                                {{ $cancelData->links('pagination::bootstrap-5') }}
                                            </div>
                                        </div>
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

</body>

</html>