<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Patient Details - HMS</title>

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

            <div class="page-heading">
                <h3>Patient Details</h3>
            </div>
            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">
                            <div class="card-header">
                                <h4>Today's Patients ({{ \Carbon\Carbon::today()->format('d M Y') }})</h4>
                            </div>
                            <div class="card-body table-responsive">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Reg</th>
                                            <th>Name</th>
                                            <th>Phone</th>
                                            <th>Date</th>
                                            <th>Total</th>
                                            <th>Discount</th>
                                            <th>Payable</th>
                                            <th>Received</th>
                                            <th>Due</th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        @forelse($patientData as $key => $patient)
                                        <tr style="{{ $patient->due > 0 ? 'background-color: #fff8e1;' : '' }}">
                                            <td>{{ $key + 1 }}</td>
                                            <td><a href="{{url('/patients/invoice/details/'.$patient->reg)}}">{{ $patient->reg ?? '-' }}</a></td>
                                            <td><a href="{{url('/patients/invoice/details/'.$patient->reg)}}">{{ $patient->name ?? '-' }}</a></td>
                                            <td>0{{ $patient->phone ?? '-' }}</td>
                                            <td>{{ \Carbon\Carbon::parse($patient->date)->format('d-M-Y') }}</td>
                                            <td>৳{{ number_format($patient->total, 2) }}/-</td>
                                            <td>৳{{ number_format($patient->discount, 2) }}/-</td>
                                            <td>৳{{ number_format($patient->payable, 2) }}/-</td>
                                            <td>৳{{ number_format($patient->pay, 2) }}/-</td>
                                            <td>৳{{ number_format($patient->due, 2) }}/-</td>
                                            <td class="text-center"><a href="{{url('/patients/print-invoice/'.$patient->reg)}}" target="_blank"><i class="fa-solid fa-print"></i></a></td>
                                        </tr>                                        
                                        @empty
                                        <tr>
                                            <td colspan="10" class="text-center">No patients found for today.</td>
                                        </tr>
                                        @endforelse
                                        <tr>
                                            <td style="text-align: center;" colspan="5">Total :</td>
                                            <td>৳{{$total}}/-</td>
                                            <td>৳{{$discount}}/-</td>
                                            <td>৳{{$payable}}/-</td>
                                            <td>৳{{$pay}}/-</td>
                                            <td>৳{{$due}}/-</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="mt-3">
                                    {{ $patientData->links('pagination::bootstrap-5') }}
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