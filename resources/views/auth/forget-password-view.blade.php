<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Forget Password - {{ $company->name ?? 'HMS' }}</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7 col-12">
                @include('layouts.message')
                <div class="card shadow-sm rounded-4">
                    <div class="card-body p-5">

                        <!-- Logo -->
                        <div class="text-center mb-4">
                            <img src="{{ asset('assets/images/logo/main-logo.png') }}" alt="Logo" style="height: 100px;">
                        </div>

                        <!-- Title -->
                        <h3 class="text-center fw-bold mb-2 mb-4 text-primary">Forget Password</h3>
                        <!-- <p class="text-center text-muted mb-4">Sign in with your credentials</p> -->

                        <!-- Login Form -->
                        <form action="{{ route('find-account') }}" method="POST">
                            @csrf
                            <div class="mb-3 position-relative">
                                <input type="text" name="email"  class="form-control form-control-lg rounded-3 ps-5" placeholder="Enter your email..." value="valobashi.tumake9999@gmail.com">
                                <i class="bi bi-person position-absolute top-50 translate-middle-y ms-3 text-muted"></i>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 btn-lg rounded-3">Find Account</button>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
