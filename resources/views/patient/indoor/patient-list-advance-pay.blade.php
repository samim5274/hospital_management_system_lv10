<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Bill Prepared - HMS</title>

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

            <div class="page-heading mb-3">
                <h3 class="text-primary">Admit Patient</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Patient List</li>
                    </ol>
                </nav>
            </div>

            <div class="page-content">
                <section class="row">
                    <div class="col-12">                        
                        <div class="row g-4">
                            <div class="col-xl-12 col-lg-6 col-md-12">
                                <div class="card shadow-sm border-0">
                                    <div class="card-header bg-primary text-center py-2 rounded-top">
                                        <h6 class="mb-0 text-white fw-semibold">Patient's List</h6>
                                    </div>
                                    <div class="card-body p-3" style="max-height: 700px; overflow-y: auto;">
                                        <ul class="list-group list-group-flush">
                                            @forelse($patients as $patient)
                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <a href="{{url('/indoors/patient/advance/bill/pay/'.$patient->id)}}"><strong>{{ $patient->name }}</strong></a><br>
                                                        <small class="text-muted">Reg No: {{ $patient->reg }}</small>
                                                    </div>
                                                    <a href="{{url('/indoors/patient/advance/bill/pay/'.$patient->id)}}" class="btn btn-sm btn-outline-primary"><i class="fa-solid fa-hand-holding-dollar"></i> Advance</a>
                                                </li>
                                            @empty
                                                <li class="list-group-item text-center text-muted">
                                                    No patients admitted yet.
                                                </li>
                                            @endforelse
                                        </ul>
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