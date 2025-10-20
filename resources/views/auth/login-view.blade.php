<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login - HMS</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
</head>
<body class="bg-light d-flex align-items-center" style="height: 100vh;">

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-5 col-md-7 col-12">

                <div class="card shadow-sm rounded-4">
                    <div class="card-body p-5">

                        <!-- Logo -->
                        <div class="text-center mb-4">
                            <img src="assets/images/logo/logo.png" alt="Logo" style="height: 60px;">
                        </div>

                        <!-- Title -->
                        <h3 class="text-center fw-bold mb-2 text-primary">Admin Login</h3>
                        <p class="text-center text-muted mb-4">Sign in with your credentials</p>

                        <!-- Login Form -->
                        <form action="{{ route('login.post') }}" method="POST">
                            @csrf
                            <div class="mb-3 position-relative">
                                <input type="text" name="email"  class="form-control form-control-lg rounded-3 ps-5" placeholder="Username" value="samim@gmail.com">
                                <i class="bi bi-person position-absolute top-50 translate-middle-y ms-3 text-muted"></i>
                                @error('email')
                                    <span class="invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>

                            <div class="mb-3 position-relative">
                                <input type="password" name="password" class="form-control form-control-lg rounded-3 ps-5" placeholder="Password" value="123456789">
                                <i class="bi bi-shield-lock position-absolute top-50 translate-middle-y ms-3 text-muted"></i>
                                @error('password')
                                    <span class="invalid-feedback">{{ $message }}</span>
                                @enderror
                            </div>

                            <div class="form-check mb-4">
                                <input class="form-check-input" type="checkbox" name="remember" id="rememberMe">
                                <label class="form-check-label" for="rememberMe">
                                    Keep me logged in
                                </label>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 btn-lg rounded-3">Log In</button>
                        </form>

                        <!-- Footer Links -->
                        <div class="text-center mt-4">
                            <p class="mb-1">Don't have an account? <a href="#" class="text-primary fw-bold">Sign Up</a></p>
                            <p><a href="#" class="text-primary fw-bold">Forgot password?</a></p>
                        </div>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
