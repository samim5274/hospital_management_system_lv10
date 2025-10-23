<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title> Patient Details - HMS</title>

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

            
            <div class="page-content">
                <section class="row">
                    <div class="col-12">
                        <div class="card">                            
                            <div class="bg-white shadow-lg rounded-2xl p-4 mt-6">
                                <div class="flex justify-between items-center mb-4">
                                    <h2 class="text-lg font-semibold text-gray-800">Lab Setting</h2>
                                    <nav aria-label="breadcrumb">
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-item"><a href="/">Home</a></li>
                                            <li class="breadcrumb-item active" aria-current="page"> Setting</li>
                                        </ol>
                                    </nav>
                                </div>
                            </div>

                            <!-- =============================== Units section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Modal -->
                                    <div class="modal fade" id="addUnits" tabindex="-1" aria-labelledby="addUnitsLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addUnitsLabel">Add New Unit</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('reagent.create.unit') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Right Column: Table View -->
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">All Units</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addUnits">
                                                        <i class="fa-solid fa-user-plus"></i> Add New
                                                    </button>
                                                </div> 
                                                <div class="card-body p-3" style="max-height: 700px; overflow-y: auto;">
                                                    <ul class="list-group list-group-flush">
                                                        @forelse($units as $val)
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <div data-bs-toggle="modal" data-bs-target="#modifyUnits{{$val->id}}">
                                                                    <strong>{{$val->name}}</strong>
                                                                </div>
                                                                <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modifyUnits{{$val->id}}"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                                                            </li>
                                                        @empty
                                                            <li class="list-group-item text-center text-muted">
                                                                No data admitted yet.
                                                            </li>
                                                        @endforelse
                                                    </ul>
                                                </div>                                               
                                            </div>
                                        </div>
                                    </div>

                                    <!-- edit model section -->
                                    @forelse($units as $val)
                                    <div class="modal fade" id="modifyUnits{{$val->id}}" tabindex="-1" aria-labelledby="modifyUnitsLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modifyUnitsLabel">Modify Unit - {{$val->name}}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('reagent.modify.unit', $val->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{$val->name}}" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Modify</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @empty
                                        <li class="list-group-item text-center text-muted">
                                            No data admitted yet.
                                        </li>
                                    @endforelse
                                    
                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Units section end =============================== -->

                            <!-- =============================== Generics section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Modal -->
                                    <div class="modal fade" id="addGenerics" tabindex="-1" aria-labelledby="addGenericsLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addGenericsLabel">Add New Generics</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('reagent.create.generics') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Right Column: Table View -->
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">All Generics</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addGenerics">
                                                        <i class="fa-solid fa-user-plus"></i> Add New
                                                    </button>
                                                </div> 
                                                <div class="card-body p-3" style="max-height: 700px; overflow-y: auto;">
                                                    <ul class="list-group list-group-flush">
                                                        @forelse($generics as $val)
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <div data-bs-toggle="modal" data-bs-target="#addGenerics{{$val->id}}">
                                                                    <strong>{{$val->name}}</strong>
                                                                </div>
                                                                <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#addGenerics{{$val->id}}"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                                                            </li>
                                                        @empty
                                                            <li class="list-group-item text-center text-muted">
                                                                No data admitted yet.
                                                            </li>
                                                        @endforelse
                                                    </ul>
                                                </div>                                               
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Modify Generic Modal -->
                                    @forelse($generics as $val)
                                    <div class="modal fade" id="addGenerics{{$val->id}}" tabindex="-1" aria-labelledby="addGenericsLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addGenericsLabel">Modify Generics - {{$val->name}}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('reagent.modify.generics', $val->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{$val->name}}" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Modify</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @empty
                                        <li class="list-group-item text-center text-muted">
                                            No data admitted yet.
                                        </li>
                                    @endforelse
                                    
                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Generics section end =============================== -->

                            <!-- =============================== Presentation section start =============================== -->
                            <div class="m-4">
                                <div class="row g-3">
                                    <!-- Modal -->
                                    <div class="modal fade" id="addPresentations" tabindex="-1" aria-labelledby="addPresentationsLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="addPresentationsLabel">Add New Presentation</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('reagent.create.presentation') }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Save</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Right Column: Table View -->
                                    <div class="col-md-12">
                                        <div class="card shadow-sm">
                                            <div class="card-body p-0">
                                                <div class="d-flex justify-content-between align-items-center p-3">
                                                    <h5 class="card-title mb-0">All Presentation</h5>
                                                    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addPresentations">
                                                        <i class="fa-solid fa-user-plus"></i> Add New
                                                    </button>
                                                </div> 
                                                <div class="card-body p-3" style="max-height: 700px; overflow-y: auto;">
                                                    <ul class="list-group list-group-flush">
                                                        @forelse($presentaions as $val)
                                                            <li class="list-group-item d-flex justify-content-between align-items-center">
                                                                <div data-bs-toggle="modal" data-bs-target="#modifyPresentations{{$val->id}}">
                                                                    <strong>{{$val->name}}</strong>
                                                                </div>
                                                                <button class="btn btn-sm btn-outline-primary" data-bs-toggle="modal" data-bs-target="#modifyPresentations{{$val->id}}"><i class="fa-solid fa-pen-to-square"></i> Edit</button>
                                                            </li>
                                                        @empty
                                                            <li class="list-group-item text-center text-muted">
                                                                No data admitted yet.
                                                            </li>
                                                        @endforelse
                                                    </ul>
                                                </div>                                               
                                            </div>
                                        </div>
                                    </div>


                                    <!-- Modify Modal -->
                                    @forelse($presentaions as $val)
                                    <div class="modal fade" id="modifyPresentations{{$val->id}}" tabindex="-1" aria-labelledby="modifyPresentationsLabel" aria-hidden="true">
                                        <div class="modal-dialog modal-dialog-centered">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <h5 class="modal-title" id="modifyPresentationsLabel">Modify Presentation - {{$val->name}}</h5>
                                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                </div>

                                                <form action="{{ route('reagent.modify.presentation', $val->id) }}" method="POST">
                                                    @csrf
                                                    <div class="modal-body">
                                                        <div class="mb-3">
                                                            <label class="form-label">Name <span class="text-danger">*</span></label>
                                                            <input type="text" name="name" class="form-control" value="{{$val->name}}" required>
                                                        </div>
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <button type="submit" class="btn btn-primary">Modify</button>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    @empty
                                        <li class="list-group-item text-center text-muted">
                                            No data admitted yet.
                                        </li>
                                    @endforelse
                                    
                                </div> <!-- row -->
                            </div> <!-- container -->
                            <!-- =============================== Presentation section end =============================== -->

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