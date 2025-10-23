<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raw Metreals - HMS</title>

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
                <h3 class="text-primary">Raw Metreals</h3>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="/">Home</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Raw Metreals</li>
                    </ol>
                </nav>
            </div>

            <div class="page-content">
                <section class="row">
                    <div class="col-12">                        
                        <div class="row g-4"> 
                            <div class="col-xl-12">
                                <div class="card shadow-sm border-0">
                                    <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center py-2 rounded-top">
                                        <h6 class="mb-0 fw-semibold text-white">Patient's List</h6>
                                        <button type="button" class="btn btn-outline-light btn-sm" data-bs-toggle="modal" data-bs-target="#exampleModalCenter">Add New</button>
                                    </div>

                                    <div class="card-body p-3" style="max-height: 700px; overflow-y: auto;">
                                        <ul class="list-group list-group-flush">
                                            @forelse($reagents as $val)
                                                <li class="list-group-item d-flex justify-content-between align-items-center">
                                                    <div data-bs-toggle="modal" data-bs-target="#exampleModalCenter{{$val->id}}">
                                                        <strong>{{$val->name}} - Qty:</strong> {{$val->min_qty}}, <strong>Price: </strong>৳{{$val->purchase_price}}/-,<br>
                                                        <small class="text-muted">{{$val->generic->name}} - {{$val->presentation->name}} - {{$val->unit->name}}</small>
                                                    </div>
                                                    <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModalCenter{{$val->id}}"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
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

            
            <!-- modal Modal -->
            <div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-centered modal-dialog-scrollable"
                    role="document">
                    <form action="{{route('create.new.reagent')}}" method="POST">
                        @csrf
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalCenterTitle">Create new Reagent</h5>
                                <button type="button" class="close" data-bs-dismiss="modal"
                                    aria-label="Close">
                                    <i data-feather="x"></i>
                                </button>
                            </div>
                            <div class="modal-body">                                    
                                <!-- Patient Information -->
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Name</label>
                                        <input type="text" name="txtName" class="form-control form-control-sm" required>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Unit</label>
                                        <select name="cbxUnit" class="form-select form-select-sm" required>
                                            <option selected disabled>-- Select Unit --</option>
                                            @foreach($units as $val)
                                            <option value="{{$val->id}}">{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>                                               
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Generic</label>
                                        <select name="cbxGeneric" class="form-select form-select-sm" required>
                                            <option selected disabled>-- Select Generic --</option>
                                            @foreach($generics as $val)
                                            <option value="{{$val->id}}">{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>
                                    <div class="col-md-6">
                                        <label class="form-label">Presentation</label>
                                        <select name="cbxPresentation" class="form-select form-select-sm" required>
                                            <option selected disabled>-- Select Presentation --</option>
                                            @foreach($presentaions as $val)
                                            <option value="{{$val->id}}">{{$val->name}}</option>
                                            @endforeach
                                        </select>
                                    </div>                                               
                                </div>
                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Purchase Price (৳)</label>
                                        <input type="number" name="txtPurchasePrice" class="form-control form-control-sm" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Minimum Qty</label>
                                        <input type="number" name="txtMinQty" class="form-control form-control-sm" required>
                                    </div>
                                </div>                                         
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-light-secondary"
                                    data-bs-dismiss="modal">
                                    <i class="bx bx-x d-block d-sm-none"></i>
                                    <span class="d-none d-sm-block">Close</span>
                                </button>
                                <button type="submit" class="btn btn-primary ml-1" onclick="return confirm('Are you sure you want to save this reagent?');">
                                    <i class="bx bx-check d-block d-sm-none"></i>
                                    <span class="d-none d-sm-block">Save</span>
                                </button>
                            </div>
                        </div>
                    </form> 
                </div>
            </div>

            @forelse($reagents as $val)
            <div class="modal fade" id="exampleModalCenter{{ $val->id }}" tabindex="-1" role="dialog"
                aria-labelledby="exampleModalCenterTitle{{ $val->id }}" aria-hidden="true">
                <div class="modal-dialog modal-dialog-centered modal-dialog-scrollable" role="document">
                    <form action="{{route('modify.reagent', $val->id)}}" method="POST">
                        @csrf

                        <div class="modal-content">
                            <div class="modal-header bg-primary text-white">
                                <h5 class="modal-title text-white" id="exampleModalCenterTitle{{ $val->id }}">
                                    Modify <strong>({{ $val->name }})</strong> Reagent
                                </h5>
                                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal" aria-label="Close"></button>
                            </div>

                            <div class="modal-body">
                                <!-- Reagent Information -->
                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Name</label>
                                        <input type="text" name="txtName" value="{{ $val->name }}"
                                            class="form-control form-control-sm" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Unit</label>
                                        <select name="cbxUnit" class="form-select form-select-sm" required>
                                            <option selected disabled>-- Select Unit --</option>
                                            @foreach($units as $unit)
                                                <option value="{{ $unit->id }}" 
                                                    {{ $val->unit_id == $unit->id ? 'selected' : '' }}>
                                                    {{ $unit->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="row g-3 mt-2">
                                    <div class="col-md-6">
                                        <label class="form-label">Generic</label>
                                        <select name="cbxGeneric" class="form-select form-select-sm" required>
                                            <option selected disabled>-- Select Generic --</option>
                                            @foreach($generics as $gen)
                                                <option value="{{ $gen->id }}" 
                                                    {{ $val->generic_id == $gen->id ? 'selected' : '' }}>
                                                    {{ $gen->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Presentation</label>
                                        <select name="cbxPresentation" class="form-select form-select-sm" required>
                                            <option selected disabled>-- Select Presentation --</option>
                                            @foreach($presentaions as $pren)
                                                <option value="{{ $pren->id }}" 
                                                    {{ $val->presentation_id == $pren->id ? 'selected' : '' }}>
                                                    {{ $pren->name }}
                                                </option>
                                            @endforeach
                                        </select>
                                    </div>
                                </div>

                                <div class="row mt-3">
                                    <div class="col-md-6">
                                        <label class="form-label">Purchase Price (৳)</label>
                                        <input type="number" step="0.01" name="txtPurchasePrice" 
                                            value="{{ $val->purchase_price }}" 
                                            class="form-control form-control-sm" required>
                                    </div>

                                    <div class="col-md-6">
                                        <label class="form-label">Minimum Qty</label>
                                        <input type="number" name="txtMinQty" value="{{ $val->min_qty }}" 
                                            class="form-control form-control-sm" required>
                                    </div>
                                </div>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-light-secondary" data-bs-dismiss="modal">
                                    <i class="bx bx-x d-block d-sm-none"></i>
                                    <span class="d-none d-sm-block">Close</span>
                                </button>
                                <button type="submit" class="btn btn-primary" onclick="return confirm('Are you sure you want to modify this reagent?');">
                                    <i class="bx bx-check d-block d-sm-none"></i>
                                    <span class="d-none d-sm-block">Modify</span>
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            @empty
            <li class="list-group-item text-center text-muted">
                No patients admitted yet.
            </li>
            @endforelse

            @include('layouts.footer')
        </div>
    </div>

    
    <!-- JS Files -->
    <script src="{{ asset('assets/vendors/perfect-scrollbar/perfect-scrollbar.min.js') }}"></script>
    <script src="{{ asset('assets/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('assets/js/main.js') }}"></script>  


</body>
</html>