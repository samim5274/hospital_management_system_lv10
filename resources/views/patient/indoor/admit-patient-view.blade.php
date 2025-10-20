<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Indoor Patient Details - HMS</title>

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

            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">
                            <!-- <div class="card-body">
                                <div class="table-responsive shadow-sm rounded mt-3">
                                    <table class="table table-striped table-hover align-middle text-center">
                                        <thead class="table-dark">
                                            <tr>
                                                <th>#</th>
                                                <th>Reg</th>
                                                <th>Name</th>
                                                <th>Phone</th>
                                                <th>DOB</th>
                                                <th>Gender</th>
                                                <th>Father/Husband</th>
                                                <th>Guardian</th>
                                                <th>Address</th>
                                                <th>Religion</th>
                                                <th>NID</th>
                                                <th>Contract Type</th>
                                                <th>Contract Amount</th>
                                                <th>Procedure</th>
                                                <th>Medicine Package</th>
                                                <th>Refer Doctor</th>
                                                <th>Treatment Under</th>
                                                <th>Duty Doctor</th>
                                                <th>Disease</th>
                                                <th>Duty Nurse</th>
                                                <th>Booked Date</th>
                                                <th>Bed Info</th>
                                                <th>Bed Cost</th>
                                                <th>Created By</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            @forelse($indoorPatients as $key => $val)
                                            <tr>
                                                <td>{{ $key + 1 }}</td>
                                                <td><a href="#" class="text-primary fw-semibold">{{ $val->reg ?? '-' }}</a></td>
                                                <td>{{ $val->name ?? '-' }}</td>
                                                <td>{{ $val->mobile ?? '-' }}</td>
                                                <td>{{ \Carbon\Carbon::parse($val->dob)->format('d-M-Y') }}</td>
                                                <td>{{ ucfirst($val->gender) }}</td>
                                                <td>{{ $val->father_husband ?? '-' }}</td>
                                                <td>{{ $val->guardian ?? '-' }}</td>
                                                <td>{{ $val->address ?? '-' }}</td>
                                                <td>{{ $val->religion ?? '-' }}</td>
                                                <td>{{ $val->nid ?? '-' }}</td>
                                                <td>{{ $val->contract_type ?? '-' }}</td>
                                                <td>৳{{ number_format($val->contract_amount, 2) }}</td>
                                                <td>{{ $val->procedure_type ?? '-' }}</td>
                                                <td>{{ $val->medicine_package ?? '-' }}</td>
                                                <td>{{ $val->refer->name ?? '-' }}</td>
                                                <td>{{ $val->treatmentUnder->name ?? '-' }}</td>
                                                <td>{{ $val->dutyDoctor->name ?? '-' }}</td>
                                                <td>{{ $val->disease->name ?? '-' }}</td>
                                                <td>{{ $val->duty_nurse ?? '-' }}</td>
                                                <td>{{ \Carbon\Carbon::parse($val->bed_booked_date)->format('d-M-Y') }}</td>
                                                <td>{{ $val->bed->bed_number ?? '-' }} - {{ $val->bed->ward ?? '-' }}</td>
                                                <td>৳{{ number_format($val->bed_cost, 2) }}</td>
                                                <td>{{ $val->user->name ?? '-' }}</td>
                                                <td>
                                                    <a href="#" class="btn btn-sm btn-outline-secondary" target="_blank">
                                                        <i class="fa-solid fa-print"></i>
                                                    </a>
                                                </td>
                                            </tr>
                                            @empty
                                            <tr>
                                                <td colspan="24" class="text-muted text-center py-3">No patients found for today.</td>
                                            </tr>
                                            @endforelse
                                        </tbody>
                                    </table>
                                </div>

                                <div class="mt-3">
                                    {{ $indoorPatients->links('pagination::bootstrap-5') }}
                                </div>
                            </div>-->
                            <div class="bg-white shadow-lg rounded-2xl p-4 mt-6">
                                <div class="flex justify-between items-center mb-4">
                                    <h2 class="text-lg font-semibold text-gray-800">Indoor Patients List</h2>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page">Admit Patient / <span class="text-sm text-gray-500">Total: {{ $indoorPatients->count() }}</span></li>
                                        </ol>
                                    </nav>
                                </div>

                                <div class="overflow-x-auto">
                                    <div class="table-responsive shadow-sm rounded mt-3">
                                        <table class="table table-striped table-hover align-middle text-center">
                                            <thead class="table-primary text-sm">
                                                <tr>
                                                    <th>#</th>
                                                    <th>Reg</th>
                                                    <th>Name</th>
                                                    <th>Phone</th>
                                                    <th>DOB</th>
                                                    <th>Gender</th>
                                                    <th>Father/Husband</th>
                                                    <th>Guardian</th>
                                                    <th>Address</th>
                                                    <th>Religion</th>
                                                    <th>NID</th>
                                                    <th>Contract Type</th>
                                                    <th>Contract Amount</th>
                                                    <th>Procedure</th>
                                                    <th>Medicine Package</th>
                                                    <th>Refer Doctor</th>
                                                    <th>Treatment Under</th>
                                                    <th>Duty Doctor</th>
                                                    <th>Disease</th>
                                                    <th>Duty Nurse</th>
                                                    <th>Booked Date</th>
                                                    <th>Bed Info</th>
                                                    <th>Bed Cost</th>
                                                    <th>Created By</th>
                                                    <th colspan="2">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @forelse($indoorPatients as $key => $val)
                                                <tr>
                                                    <td>{{ $key + 1 }}</td>
                                                    <td><a href="{{url('/indoors/edit/'.$val->id)}}" class="text-primary fw-semibold">{{ $val->reg ?? '-' }}</a></td>
                                                    <td><a href="{{url('/indoors/edit/'.$val->id)}}">{{ $val->name ?? '-' }}</a></td>
                                                    <td>{{ $val->mobile ?? '-' }}</td>
                                                    <td>{{ \Carbon\Carbon::parse($val->dob)->format('d-M-Y') }}</td>
                                                    <td>{{ ucfirst($val->gender) }}</td>
                                                    <td>{{ $val->father_husband ?? '-' }}</td>
                                                    <td>{{ $val->guardian ?? '-' }}</td>
                                                    <td>{{ $val->address ?? '-' }}</td>
                                                    <td>{{ $val->religion ?? '-' }}</td>
                                                    <td>{{ $val->nid ?? '-' }}</td>
                                                    <td>{{ $val->contract_type ?? '-' }}</td>
                                                    <td>৳{{ number_format($val->contract_amount, 2) }}</td>
                                                    <td>{{ $val->procedure_type ?? '-' }}</td>
                                                    <td>{{ $val->medicine_package ?? '-' }}</td>
                                                    <td>{{ $val->refer->name ?? '-' }}</td>
                                                    <td>{{ $val->treatmentUnder->name ?? '-' }}</td>
                                                    <td>{{ $val->dutyDoctor->name ?? '-' }}</td>
                                                    <td>{{ $val->disease->name ?? '-' }}</td>
                                                    <td>{{ $val->duty_nurse ?? '-' }}</td>
                                                    <td>{{ \Carbon\Carbon::parse($val->bed_booked_date)->format('d-M-Y') }}</td>
                                                    <td>{{ $val->bed->bed_number ?? '-' }} - {{ $val->bed->ward ?? '-' }}</td>
                                                    <td>৳{{ number_format($val->bed_cost, 2) }}</td>
                                                    <td>{{ $val->user->name ?? '-' }}</td>
                                                    <!-- <td>
                                                        <a href="#" class="btn btn-sm btn-outline-secondary" target="_blank">
                                                            <i class="fa-solid fa-print"></i>
                                                        </a>
                                                    </td> -->
                                                    <td>
                                                        <a href="{{url('/indoors/edit/'.$val->id)}}" class="btn btn-sm btn-outline-secondary">
                                                            <i class="fa-solid fa-edit"></i>
                                                        </a>
                                                    </td>
                                                </tr>
                                                @empty
                                                <tr>
                                                    <td colspan="24" class="text-muted text-center py-3">No patients found for today.</td>
                                                </tr>
                                                @endforelse
                                            </tbody>
                                        </table>
                                    </div>

                                    <div class="mt-3">
                                        {{ $indoorPatients->links('pagination::bootstrap-5') }}
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