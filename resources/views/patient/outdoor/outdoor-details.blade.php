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
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
    <link rel="shortcut icon" href="{{ asset('assets/images/favicon.svg') }}" type="image/x-icon">
    @livewireStyles
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
                <h3>Outdoor Details</h3>
            </div>
            <div class="page-content bg-white p-4 rounded">
                <section class="row">
                    <!-- Livewire Component for Test Selection / Cart -->
                    <div class="col-12 mb-4">
                        @livewire('lab-invoice')
                    </div>

                    <div class="col-12">
                        <form action="{{ route('patients.store') }}" method="POST" enctype="multipart/form-data">
                            @csrf
                            <div class="row g-3">
                                <div class="col-md-6">
                                    <label for="name" class="form-label">Name</label>
                                    <input type="text" placeholder="Name" value="Shamim Hossain" name="txtName" id="name" class="form-control">
                                </div>
                                <div class="col-md-6">
                                    <label for="dob" class="form-label">Date of Birth</label>
                                    <input type="date" id="dob" value="2001-12-31" name="dtpDob" class="form-control">
                                </div>
                            </div>

                            <div class="row g-3 mt-3">
                                <div class="col-md-6">
                                    <label class="form-label">Gender</label>
                                    <div class="d-flex gap-3 mt-1">
                                        <div class="form-check">
                                            <input type="radio" id="Male" name="slcGender" checked value="Male" class="form-check-input">
                                            <label for="Male" class="form-check-label">Male</label>
                                        </div>
                                        <div class="form-check">
                                            <input type="radio" id="Female" name="slcGender" value="Female" class="form-check-input">
                                            <label for="Female" class="form-check-label">Female</label>
                                        </div>
                                        <div class="form-check">
                                            <input type="radio" id="Other" name="slcGender" value="Other" class="form-check-input">
                                            <label for="Other" class="form-check-label">Other</label>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="phone" class="form-label">Phone</label>
                                    <div class="input-group">
                                        <span class="input-group-text">+880</span>
                                        <input type="number" class="form-control" placeholder="Phone" value="1762164746" name="txtPhone" id="phone">
                                    </div>
                                </div>
                            </div>

                            <div class="mt-3">
                                <label for="address" class="form-label">Address</label>
                                <textarea class="form-control" name="txtAddress" id="address" placeholder="Address" rows="3">Kaliakair, Gazipur, Dhaka, Bangladesh</textarea>
                            </div>

                            <div class="row g-3 mt-3">
                                <div class="col-md-6">
                                    <label for="doctor" class="form-label">Doctor</label>
                                    <select name="cbxDoctor" required class="form-select" id="doctor">
                                        <option selected disabled>--Select Doctor--</option>
                                        @foreach($doctor as $val)
                                            <option value="{{$val->id}}">{{$val->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label for="refer" class="form-label">Reference</label>
                                    <select name="cbxRefer" class="form-select" id="refer">
                                        <option selected disabled>--Select Reference--</option>
                                        @foreach($refer as $val)
                                            <option value="{{$val->id}}">{{$val->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                            </div>

                            <div class="card bg-light mt-4 p-3">
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label display-6 text-info">
                                            Actual: <span id="liveTotal">00</span>/-
                                        </label>
                                        <input type="hidden" id="hiddenTotal" name="txtTotal" value="0">
                                        <p id="result" class="display-6 text-success mt-2">Amount: 00/-</p>
                                    </div>
                                    <div class="col-md-6">
                                        <label for="num3" class="form-label">Discount</label>
                                        <input type="number" placeholder="Discount" onkeyup="sumNumbers()" id="num3" name="txtDiscount" class="form-control" value="0" required>

                                        <label for="num2" class="form-label mt-3">Received</label>
                                        <input type="number" placeholder="Received Amount" onkeyup="sumNumbers()" id="num2" name="txtReceived" class="form-control" required>
                                    </div>
                                </div>
                            </div>


                            <div class="mt-3">
                                <button class="btn btn-success w-100" id="btnSave" disabled>Save</button>
                            </div>
                        </form>
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
        window.onload = function () {
            const searchInput = document.getElementById('search');
            if (searchInput) {
                searchInput.focus();
            }
            @if(session('success'))
                const invoice = "{{ session('invoice') }}";
                const printUrl = `{{ url('/patients/print-invoice') }}/${invoice}`;
                window.open(printUrl, '_blank');
            @endif
        };
    </script>
    @livewireScripts
</body>

</html>