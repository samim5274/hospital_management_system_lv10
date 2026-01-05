<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Reports Details - {{ $company->name ?? 'HMS' }}</title>

    <!-- Fonts -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@300;400;600;700;800&display=swap" rel="stylesheet">

    <!-- CSS Files -->
    <link rel="stylesheet" href="{{ asset('assets/css/bootstrap.css') }}">
    <!-- <link rel="stylesheet" href="{{ asset('assets/vendors/iconly/bold.css') }}"> -->
    <link rel="stylesheet" href="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.css') }}">
    <link rel="stylesheet" href="{{ asset('assets/vendors/bootstrap-icons/bootstrap-icons.css') }}">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/7.0.1/css/all.min.css" />
    <link rel="stylesheet" href="{{ asset('assets/css/app.css') }}">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
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
                <h3><i class="bi bi-clipboard2-pulse me-1"></i> Date wise Diagnostic Test Sale Due Report</h3>
            </div>            
            <div class="page-content">
                <div class="card mt-3 shadow-sm">
                    <div class="card-header bg-white border-bottom d-flex justify-content-between align-items-center">
                        <!-- Left text -->
                        <h6 class="mb-0 fw-semibold text-primary">
                            <i class="bi bi-receipt"></i> Test Sale Due Report
                        </h6>

                        <!-- Right button -->
                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#filterModal">
                            <i class="bi bi-funnel"></i> Filter Due Test Sale
                        </button>

                        <!-- Modal -->
                        <div class="modal fade" id="filterModal" tabindex="-1" aria-labelledby="filterModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-lg modal-dialog-centered">
                                <div class="modal-content">
                                    <form method="GET" action="{{ route('filter-due-test-sale') }}">
                                        @php
                                            $today = date('Y-m-d');
                                        @endphp

                                        <div class="modal-header bg-primary">
                                            <h5 class="modal-title fw-semibold text-white" id="filterModalLabel">
                                                <i class="bi bi-funnel fs-3"></i> Due Report Filter
                                            </h5>
                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                        </div>

                                        <div class="modal-body">
                                            <div class="row g-3">

                                                <!-- Start Date -->
                                                <div class="col-md-6">
                                                    <label class="form-label text-muted small">Start Date</label>
                                                    <input type="date"
                                                        class="form-control"
                                                        name="startDate"
                                                        max="{{ $today }}"
                                                        value="{{ request('startDate', $today) }}">
                                                </div>

                                                <!-- End Date -->
                                                <div class="col-md-6">
                                                    <label class="form-label text-muted small">End Date</label>
                                                    <input type="date"
                                                        class="form-control"
                                                        name="endDate"
                                                        max="{{ $today }}"
                                                        value="{{ request('endDate', $today) }}">
                                                </div>

                                                <!-- Doctor -->
                                                <div class="col-md-6">
                                                    <label class="form-label text-muted small">Doctor</label>
                                                    <select name="doctor_id" class="form-select select2">
                                                        <option value="">All Doctors</option>
                                                        @foreach($doctors as $doctor)
                                                            <option value="{{ $doctor->id }}" {{ request('doctor_id') == $doctor->id ? 'selected' : '' }}>
                                                                {{ $doctor->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                                <!-- Reference -->
                                                <div class="col-md-6">
                                                    <label class="form-label text-muted small">Reference</label>
                                                    <select name="refer_id" class="form-select select2">
                                                        <option value="">All References</option>
                                                        @foreach($references as $refer)
                                                            <option value="{{ $refer->id }}" {{ request('refer_id') == $refer->id ? 'selected' : '' }}>
                                                                {{ $refer->name }}
                                                            </option>
                                                        @endforeach
                                                    </select>
                                                </div>

                                            </div>
                                        </div>

                                        <div class="modal-footer">
                                            <button type="submit" class="btn btn-primary px-4">
                                                <i class="bi bi-search"></i> Filter
                                            </button>

                                            <button type="submit"
                                                    name="print"
                                                    value="1"
                                                    formtarget="_blank"
                                                    class="btn btn-outline-secondary px-4">
                                                <i class="bi bi-printer"></i> Print
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>

                    </div>

                    <div class="card-body p-0 bg-light overflow-auto" style="max-height:700px;">
                        <table class="table table-bordered table-hover align-middle mb-0">
                            <thead class="table-primary text-center sticky-top">
                                <tr>
                                    <th style="width:5%">#</th>
                                    <th style="width:10%" class="text-start">Date</th>
                                    <th class="text-start">Patient Name</th>
                                    <th style="width:10%" class="text-center">Total (৳)</th>
                                    <th style="width:10%" class="text-center">Discount (৳)</th>
                                    <th style="width:10%" class="text-center">Due (৳)</th>
                                    <th style="width:10%" class="text-end">Paid (৳)</th>
                                </tr>
                            </thead>

                            <tbody>
                                <tbody>
                                    @forelse($datas as $index => $data)
                                        <tr>
                                            <td class="text-center">{{ $index + 1 }}</td>
                                            <td class="text-start"><span class="fw-semibold">{{ $data->date->format('d-M-Y') }}</span></td>
                                            <td>
                                                <span class="fw-bold">{{ $data->name }}</span><br>
                                                <small class="fw-semibold"><i class="bi bi-heart-pulse-fill text-danger me-2"></i>{{ $data->doctor->name }}</small> - <i class="bi bi-geo-alt-fill text-primary me-1"></i>
                                                <small title="{{ $data->address }}">
                                                    {{ \Illuminate\Support\Str::limit($data->address, 35, '...') }}
                                                </small>

                                            </td>
                                            <td class="text-center fw-semibold">৳ {{ number_format($data->total, 2) }}/-</td>
                                            <td class="text-center fw-semibold">৳ {{ number_format($data->discount, 2) }}/-</td>
                                            <td class="text-center fw-semibold">৳ {{ number_format($data->due, 2) }}/-</td>
                                            <td class="text-end fw-semibold">৳ {{ number_format($data->pay, 2) }}/-</td>
                                        </tr>
                                    @empty
                                        <tr>
                                            <td colspan="4" class="text-center text-muted py-4">
                                                <i class="bi bi-inbox fs-4 d-block mb-1"></i>No test added yet
                                            </td>
                                        </tr>
                                    @endforelse
                                </tbody>

                            </tbody>
                            <tfoot class="table-light">
                                <tr>
                                    <th colspan="3" class="text-end">Total Amount</th>
                                    <th class="text-end fw-bold">৳ {{ number_format($total, 2)  }}/-</th>
                                    <th class="text-end fw-bold">৳ {{ number_format($discount, 2)  }}/-</th>
                                    <th class="text-end fw-bold">৳ {{ number_format($due, 2)  }}/-</th>
                                    <th class="text-end fw-bold">৳ {{ number_format($totalPay, 2)  }}/-</th>
                                </tr>
                            </tfoot>
                        </table>
                    </div>
                </div>

            </div>
            @include('layouts.footer')
        </div>
    </div>    




    
    <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>


    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/vendors/apexcharts/apexcharts.js') }}"></script>
    <script src="{{ asset('assets/js/pages/dashboard.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>   
    
    <script>
         $(document).ready(function() {
            // When modal is shown, initialize select2
            $('#filterModal').on('shown.bs.modal', function () {
                $(this).find('.select2').select2({
                    dropdownParent: $('#filterModal'),
                    width: '100%',
                    placeholder: "Select an option",
                    allowClear: true
                });
            });
        })
    </script>

    
</body>

</html>