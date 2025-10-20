<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admit Patient - HMS</title>

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
                        <li class="breadcrumb-item active" aria-current="page">Admit Patient</li>
                    </ol>
                </nav>
            </div>

            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <form action="{{ route('admit.indoor.patients') }}" method="POST">
                            @csrf
                            <div class="row g-4">
                                <!-- LEFT COLUMN -->
                                <div class="col-xl-5 col-lg-6 col-md-12">
                                    
                                    <!-- Patient Information -->
                                    <div class="card shadow-sm border-0 mb-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Patient Information</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Patient Name</label>
                                                    <input type="text" name="txtName" value="Shamim Hossain" class="form-control form-control-sm" required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Date of Birth</label>
                                                    <input type="date" name="dtpDob" value="2001-12-31" class="form-control form-control-sm" required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Gender</label>
                                                    <select name="cbxGender" class="form-select form-select-sm" required>
                                                        <option  disabled>-- Select Gender --</option>
                                                        <option selected >Male</option>
                                                        <option>Female</option>
                                                        <option>Other</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Mobile</label>
                                                    <input type="number" name="txtPhone" value="01762164746" class="form-control form-control-sm" placeholder="+880..." required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Father/Husband</label>
                                                    <input type="text" name="txtFatherHusband" value="Jamsher Ali" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Guardian</label>
                                                    <input type="text" name="txtGuardian" value="Jamsher Ali" class="form-control form-control-sm" required>
                                                </div>
                                                <div class="col-12">
                                                    <label class="form-label">Address</label>
                                                    <textarea name="txtAddres" class="form-control form-control-sm" rows="2" required>Kaliakair, Gazipur, Dhaka-1750</textarea>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Religion</label>
                                                    <select name="cbxReligion" class="form-select form-select-sm">
                                                        <option  disabled>-- Select Religion --</option>
                                                        <option selected >Islam</option>
                                                        <option>Hindu</option>
                                                        <option>Christian</option>
                                                        <option>Buddhism</option>
                                                        <option>Other</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">NID No</label>
                                                    <input type="text" name="txtNID" value="568974312" class="form-control form-control-sm" required>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Contract and Medical Info -->
                                    <div class="card shadow-sm mt-3 mb-0 border-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Contract and Medical Information</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="mb-3">
                                                <label class="form-label">Contract Type:</label>
                                                <div class="d-flex gap-3">
                                                    <div class="form-check">
                                                        <input type="radio" name="contractType" id="contract" value="Contract" class="form-check-input" checked>
                                                        <label for="contract" class="form-check-label">Contract</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="radio" name="contractType" value="NonContract" id="nonContract" class="form-check-input">
                                                        <label for="nonContract" class="form-check-label">Non-Contract</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="mb-3" id="contractAmountContainer">
                                                <label class="form-label">Contract Amount:</label>
                                                <input type="number" name="contractAmount" id="contractAmount" class="form-control form-control-sm" value="0">
                                            </div>

                                            <div class="mb-3">
                                                <label class="form-label">Procedure Type:</label>
                                                <div class="d-flex gap-3">
                                                    <div class="form-check">
                                                        <input type="radio" name="procedureType" value="Operative" id="operative" class="form-check-input" checked>
                                                        <label for="operative" class="form-check-label">Operative</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="radio" name="procedureType" value="Conservative" id="conservative" class="form-check-input">
                                                        <label for="conservative" class="form-check-label">Conservative</label>
                                                    </div>
                                                </div>
                                            </div>

                                            <div id="medicinePackageContainer">
                                                <label class="form-label">Medicine Package:</label>
                                                <div class="d-flex mb-2">
                                                    <div class="form-check me-4">
                                                        <input type="radio" name="medicinePackage" value="Package" id="package" class="form-check-input" checked>
                                                        <label for="package" class="form-check-label">Package</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="radio" name="medicinePackage" value="nonPackage" id="nonPackage" class="form-check-input">
                                                        <label for="nonPackage" class="form-check-label">Non-Package</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <!-- RIGHT COLUMN -->
                                <div class="col-xl-4 col-lg-6 col-md-12">

                                    <!-- Treatment Assignment -->
                                    <div class="card shadow-sm border-0 mb-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Treatment & Assignment</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="mb-3">
                                                <label class="form-label">Refer Person</label>
                                                <select name="cbxRefer" class="form-select form-select-sm" required>
                                                    <option  disabled> -- Select Refer --</option>
                                                    @foreach($refer as $val)
                                                    <option selected value="{{$val->id}}">{{$val->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Treatment Under</label>
                                                <select name="cbxTreatmentUnder" class="form-select form-select-sm" required>
                                                    <option  disabled> -- Select Treatment Under --</option>
                                                    @foreach($doctors as $val)
                                                    <option selected value="{{$val->id}}">{{$val->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Duty Doctors</label>
                                                <select name="cbxDutyDoctor" class="form-select form-select-sm" required>
                                                    <option  disabled> -- Select Doctors --</option>
                                                    @foreach($dutyDoctors as $val)
                                                    <option selected value="{{$val->id}}">{{$val->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Diseases</label>
                                                <select name="cbxDiseas" class="form-select form-select-sm" required>
                                                    <option  disabled> -- Select Diseases --</option>
                                                    @foreach($diseases as $val)
                                                    <option selected value="{{$val->id}}">{{$val->name}}</option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            <div class="mb-3">
                                                <label class="form-label">Duty Nurse</label>
                                                <input type="text" value="Mr. Sabrina Akter" name="txtNurse" class="form-control form-control-sm">
                                            </div>
                                        </div>
                                    </div>                                    

                                    <!-- Bed Booking -->
                                    <div class="card shadow-sm mt-3 mb-0 border-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Bed Booking</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Bed Booked Date</label>
                                                    <input type="date" name="dtpBedBookedDate" class="form-control form-control-sm" value="{{ date('Y-m-d') }}">
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Bed Number</label>
                                                    <select name="cbxBed" class="form-select form-select-sm" id="bedSelect" required>
                                                        <option selected disabled>-- Select Bed --</option>
                                                        @foreach($beds as $val)
                                                        <option value="{{$val->id}}" data-price="{{$val->price_per_day}}">{{$val->bed_number}} - {{$val->ward}}</option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                <div class="col-md-12">
                                                    <label class="form-label">Bed Cost</label>
                                                    <input type="number" name="txtBedCost" id="bedPrice" class="form-control form-control-sm" value="0" readonly>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- button section -->
                                    <div class="card shadow-sm mt-3 border-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Action</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="row g-3">
                                                <div class="col-md-8">
                                                    <input type="submit" class="form-control form-control-sm btn btn-outline-success" value="Admit new patient">
                                                </div>
                                                <div class="col-md-4">
                                                    <input type="button" id="clearBtn" class="form-control form-control-sm btn btn-outline-warning" value="Clear">
                                                </div>                                                
                                                <div class="col-md-12">                                                    
                                                    <input type="button" class="form-control form-control-sm btn btn-outline-info" value="Back">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-xl-3 col-lg-6 col-md-12">
                                    <div class="card shadow-sm border-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Patient's List</h6>
                                        </div>
                                        <div class="card-body p-3" style="max-height: 825px; overflow-y: auto;">
                                            <ul class="list-group list-group-flush">
                                                @forelse($patients as $patient)
                                                    <li class="list-group-item d-flex justify-content-between align-items-center">
                                                        <div>
                                                            <strong>{{ $patient->name }}</strong><br>
                                                            <small class="text-muted">Reg No: {{ $patient->reg }}</small>
                                                        </div>
                                                        <a href="{{url('/indoors/patient/bill-prepared/'.$patient->id)}}" class="btn btn-sm btn-outline-primary">View</a>
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

        // bed select then cost show
        document.getElementById('bedSelect').addEventListener('change', function() {
            var selectedOption = this.options[this.selectedIndex];
            var price = selectedOption.getAttribute('data-price');
            document.getElementById('bedPrice').value = price ? price : 0;
        });

        // contract type visibility
        document.addEventListener('DOMContentLoaded', function() {
            // Contract type visibility
            const contractAmountContainer = document.getElementById('contractAmountContainer');
            const contractRadio = document.getElementById('contract');
            const nonContractRadio = document.getElementById('nonContract');

            function toggleContractAmount() {
                if (contractRadio.checked) {
                    contractAmountContainer.style.display = 'block';
                } else {
                    contractAmountContainer.style.display = 'none';
                }
            }

            contractRadio.addEventListener('change', toggleContractAmount);
            nonContractRadio.addEventListener('change', toggleContractAmount);

            // Initial state
            toggleContractAmount();
        });

        // window.onload = function () {
        //     @if(session('success'))
        //         const reg = "{{ session('reg') }}";
        //         const printUrl = `{{ url('/specific-order-print') }}/${reg}`;
        //         window.open(printUrl, '_blank');
        //     @endif
        // };

    </script>

</body>
</html>