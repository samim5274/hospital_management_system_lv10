<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modify Patient - HMS</title>

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
                <h3 class="text-primary">Modify Admit Patient -> <span class="text-md">{{$patient->reg}}</span></h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item"><a href="{{url('/indoors')}}">Admit patient</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit</li>
                    </ol>
                </nav>
            </div>

            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <form action="{{ url('/indoors/edit/'.$patient->id) }}" method="POST">
                            @csrf
                            <div class="row g-4">
                                <!-- LEFT COLUMN -->
                                <div class="col-xl-7 col-lg-6 col-md-12">
                                    
                                    <!-- Patient Information -->
                                    <div class="card shadow-sm border-0 mb-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Patient Information</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="row g-3">
                                                <div class="col-md-6">
                                                    <label class="form-label">Patient Name</label>
                                                    <input type="text" name="txtName" value="{{$patient->name}}" class="form-control form-control-sm" required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Date of Birth</label>
                                                    <input type="date" name="dtpDob" value="{{$patient->dob}}" class="form-control form-control-sm" required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Gender</label>
                                                    <select name="cbxGender" class="form-select form-select-sm" required>
                                                        <option disabled>-- Select Gender --</option>
                                                        <option value="Male" {{ $patient->gender == 'Male' ? 'selected' : '' }}>Male</option>
                                                        <option value="Female" {{ $patient->gender == 'Female' ? 'selected' : '' }}>Female</option>
                                                        <option value="Other" {{ $patient->gender == 'Other' ? 'selected' : '' }}>Other</option>
                                                    </select>

                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Mobile</label>
                                                    <input type="number" name="txtPhone" value="{{$patient->mobile}}" class="form-control form-control-sm" placeholder="+880..." required>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Father/Husband</label>
                                                    <input type="text" name="txtFatherHusband" value="{{$patient->father_husband}}" class="form-control form-control-sm">
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Guardian</label>
                                                    <input type="text" name="txtGuardian" value="{{$patient->guardian}}" class="form-control form-control-sm" required>
                                                </div>
                                                <div class="col-12">
                                                    <label class="form-label">Address</label>
                                                    <textarea name="txtAddres" class="form-control form-control-sm" rows="2" required>{{$patient->address}}</textarea>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">Religion</label>
                                                    <select name="cbxReligion" class="form-select form-select-sm">
                                                        <option selected disabled>-- Select Religion --</option>
                                                        <option {{ $patient->religion == 'Islam' ? 'selected' : '' }}>Islam</option>
                                                        <option {{ $patient->religion == 'Hindu' ? 'selected' : '' }}>Hindu</option>
                                                        <option {{ $patient->religion == 'Christian' ? 'selected' : '' }}>Christian</option>
                                                        <option {{ $patient->religion == 'Buddhism' ? 'selected' : '' }}>Buddhism</option>
                                                        <option {{ $patient->religion == 'Other' ? 'selected' : '' }}>Other</option>
                                                    </select>
                                                </div>
                                                <div class="col-md-6">
                                                    <label class="form-label">NID No</label>
                                                    <input type="text" name="txtNID" value="{{$patient->nid}}" class="form-control form-control-sm" required>
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
                                            {{-- Contract Type --}}
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Contract Type:</label>
                                                <div class="d-flex gap-4">
                                                    <div class="form-check">
                                                        <input type="radio" 
                                                            name="contractType" 
                                                            id="contract" 
                                                            value="Contract" 
                                                            class="form-check-input" 
                                                            {{ $patient->contract_type == 'Contract' ? 'checked' : '' }}>
                                                        <label for="contract" class="form-check-label">Contract</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="radio" 
                                                            name="contractType" 
                                                            id="nonContract" 
                                                            value="NonContract" 
                                                            class="form-check-input" 
                                                            {{ $patient->contract_type == 'NonContract' ? 'checked' : '' }}>
                                                        <label for="nonContract" class="form-check-label">Non-Contract</label>
                                                    </div>
                                                </div>
                                            </div>
                                            {{-- Contract Amount --}}
                                            <div class="mb-3" id="contractAmountContainer">
                                                <label for="contractAmount" class="form-label fw-semibold">Contract Amount:</label>
                                                <input type="number" 
                                                    name="contractAmount" 
                                                    id="contractAmount" 
                                                    class="form-control form-control-sm" 
                                                    value="{{ $patient->contract_amount }}">
                                            </div>
                                            {{-- Procedure Type --}}
                                            <div class="mb-3">
                                                <label class="form-label fw-semibold">Procedure Type:</label>
                                                <div class="d-flex gap-4">
                                                    <div class="form-check">
                                                        <input type="radio" 
                                                            name="procedureType" 
                                                            id="operative" 
                                                            value="Operative" 
                                                            class="form-check-input" 
                                                            {{ $patient->procedure_type == 'Operative' ? 'checked' : '' }}>
                                                        <label for="operative" class="form-check-label">Operative</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="radio" 
                                                            name="procedureType" 
                                                            id="conservative" 
                                                            value="Conservative" 
                                                            class="form-check-input" 
                                                            {{ $patient->procedure_type == 'Conservative' ? 'checked' : '' }}>
                                                        <label for="conservative" class="form-check-label">Conservative</label>
                                                    </div>
                                                </div>
                                            </div>
                                            {{-- Medicine Package --}}
                                            <div class="mb-3" id="medicinePackageContainer">
                                                <label class="form-label fw-semibold">Medicine Package:</label>
                                                <div class="d-flex gap-4">
                                                    <div class="form-check">
                                                        <input type="radio" 
                                                            name="medicinePackage" 
                                                            id="package" 
                                                            value="Package" 
                                                            class="form-check-input" 
                                                            {{ $patient->medicine_package == 'Package' ? 'checked' : '' }}>
                                                        <label for="package" class="form-check-label">Package</label>
                                                    </div>
                                                    <div class="form-check">
                                                        <input type="radio" 
                                                            name="medicinePackage" 
                                                            id="nonPackage" 
                                                            value="nonPackage" 
                                                            class="form-check-input" 
                                                            {{ $patient->medicine_package == 'nonPackage' ? 'checked' : '' }}>
                                                        <label for="nonPackage" class="form-check-label">Non-Package</label>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    
                                </div>

                                <!-- RIGHT COLUMN -->
                                <div class="col-xl-5 col-lg-6 col-md-12">

                                    <!-- Treatment Assignment -->
                                    <div class="card shadow-sm border-0 mb-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Treatment & Assignment</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="mb-3">
                                                <label class="form-label">Refer Person</label>
                                                <select name="cbxRefer" class="form-select form-select-sm" required>
                                                    <option disabled {{ !$patient->refer_id ? 'selected' : '' }}>-- Select Refer --</option>
                                                    @foreach($refer as $val)
                                                        <option value="{{ $val->id }}" {{ $patient->refer_id == $val->id ? 'selected' : '' }}>
                                                            {{ $val->name }}
                                                        </option>
                                                    @endforeach
                                                </select>
                                            </div>
                                            {{-- Treatment Under --}}
                                                <div class="mb-3">
                                                    <label class="form-label fw-semibold">Treatment Under</label>
                                                    <select name="cbxTreatmentUnder" class="form-select form-select-sm" required>
                                                        <option disabled {{ !$patient->treatment_under_id ? 'selected' : '' }}>-- Select Treatment Under --</option>
                                                        @foreach($doctors as $val)
                                                            <option value="{{ $val->id }}" {{ $patient->treatment_under_id == $val->id ? 'selected' : '' }}>
                                                                {{ $val->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                {{-- Duty Doctors --}}
                                                <div class="mb-3">
                                                    <label class="form-label fw-semibold">Duty Doctors</label>
                                                    <select name="cbxDutyDoctor" class="form-select form-select-sm" required>
                                                        <option disabled {{ !$patient->duty_doctor_id ? 'selected' : '' }}>-- Select Doctors --</option>
                                                        @foreach($dutyDoctors as $val)
                                                            <option value="{{ $val->id }}" {{ $patient->duty_doctor_id == $val->id ? 'selected' : '' }}>
                                                                {{ $val->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                                {{-- Diseases --}}
                                                <div class="mb-3">
                                                    <label class="form-label fw-semibold">Diseases</label>
                                                    <select name="cbxDiseas" class="form-select form-select-sm" required>
                                                        <option disabled {{ !$patient->disease_id ? 'selected' : '' }}>-- Select Diseases --</option>
                                                        @foreach($diseases as $val)
                                                            <option value="{{ $val->id }}" {{ $patient->disease_id == $val->id ? 'selected' : '' }}>
                                                                {{ $val->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>
                                            <div class="mb-3">
                                                <label class="form-label">Duty Nurse</label>
                                                <input type="text" value="{{$patient->duty_nurse}}" name="txtNurse" class="form-control form-control-sm">
                                            </div>
                                        </div>
                                    </div>                                    

                                    <!-- Bed Booking -->
                                    <div class="card shadow-sm mt-3 border-0">
                                        <div class="card-header bg-primary text-center py-2 rounded-top">
                                            <h6 class="mb-0 text-white fw-semibold">Bed Booking</h6>
                                        </div>
                                        <div class="card-body py-3">
                                            <div class="row g-3 align-items-end">
                                                
                                                <!-- Bed Booked Date -->
                                                <div class="col-md-4">
                                                    <label class="form-label fw-semibold mb-1">Bed Booked Date</label>
                                                    <input 
                                                        type="date" 
                                                        name="dtpBedBookedDate" 
                                                        class="form-control form-control-sm shadow-sm" 
                                                        value="{{ $patient->bed_booked_date }}">
                                                </div>

                                                <!-- Bed Number -->
                                                <div class="col-md-4">
                                                    <label class="form-label fw-semibold mb-1">Bed Number</label>
                                                    <select 
                                                        name="cbxBed" 
                                                        id="bedSelect" 
                                                        class="form-select form-select-sm shadow-sm" 
                                                        required>
                                                        <option disabled {{ !$patient->bed_id ? 'selected' : '' }}>-- Select Bed --</option>
                                                        @foreach($beds as $val)
                                                            <option 
                                                                value="{{ $val->id }}" 
                                                                data-price="{{ $val->price_per_day }}" 
                                                                {{ $patient->bed_id == $val->id ? 'selected' : '' }}>
                                                                {{ $val->bed_number }} - {{ $val->ward }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Bed Cost -->
                                                <div class="col-md-4">
                                                    <label class="form-label fw-semibold mb-1">Bed Cost (৳)</label>
                                                    <input 
                                                        type="number" 
                                                        name="txtBedCost" 
                                                        id="bedPrice" 
                                                        class="form-control form-control-sm shadow-sm bg-light fw-bold text-end" 
                                                        value="{{ $patient->bed_cost ?? '0' }}" 
                                                        readonly>
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
                                                <div class="col-md-12">
                                                    <input type="submit" class="form-control form-control-sm btn btn-outline-primary" value="Modify patient">
                                                </div>
                                                <div class="col-md-12">
                                                    <a href="{{url('/indoors/print/patient/concern/'.$patient->id)}}" target="_blank" class="form-control form-control-sm btn btn-outline-info"><i class="fa-solid fa-print"></i> Print Concern Paper</a>
                                                </div>
                                            </div>
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