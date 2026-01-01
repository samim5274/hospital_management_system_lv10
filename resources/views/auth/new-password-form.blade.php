<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="{{ asset('assets/images/logo/main-logo.png') }}">
    <title>Confirm OTP - {{ $company->name ?? 'HMS' }}</title>

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        .otp-input {
            width: 52px;
            height: 58px;
            text-align: center;
            font-size: 1.5rem;
            font-weight: 600;
            border-radius: 10px;
        }

        .otp-input:focus {
            border-color: #0d6efd;
            box-shadow: 0 0 0 .2rem rgba(13,110,253,.25);
        }
    </style>

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
                        <h3 class="text-center fw-bold mb-2 mb-4 text-primary">Confirm OTP</h3>

                        <!-- Login Form -->
                        <form id="changePasswordForm" action="{{ route('update-password') }}" method="POST">
                            @csrf
                            <div class="mb-3">
                                <label class="form-label fw-semibold">New Password</label>
                                <input type="password" id="new_password" name="new_password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Confirm Password</label>
                                <input type="password" id="confirm_password" name="confirm_password" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <ul class="list-unstyled small">
                                    <li id="rule-length" class="text-danger">
                                        <i class="bi bi-x-circle me-1"></i> Minimum 6 characters
                                    </li>
                                    <li id="rule-upper" class="text-danger">
                                        <i class="bi bi-x-circle me-1"></i> At least 1 capital letter
                                    </li>
                                    <li id="rule-lower" class="text-danger">
                                        <i class="bi bi-x-circle me-1"></i> At least 1 small letter
                                    </li>
                                    <li id="rule-number" class="text-danger">
                                        <i class="bi bi-x-circle me-1"></i> At least 1 number
                                    </li>
                                    <li id="rule-special" class="text-danger">
                                        <i class="bi bi-x-circle me-1"></i> At least 1 special character
                                    </li>
                                    <li id="rule-match" class="text-danger">
                                        <i class="bi bi-x-circle me-1"></i> Passwords match
                                    </li>
                                </ul>
                            </div>

                            <button type="submit" id="submitBtn" class="btn btn-primary w-100" disabled>
                                Update Password
                            </button>

                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        const newPassword = document.getElementById('new_password');
        const confirmPassword = document.getElementById('confirm_password');
        const submitBtn = document.getElementById('submitBtn');

        const rules = {
            length: document.getElementById('rule-length'),
            upper: document.getElementById('rule-upper'),
            lower: document.getElementById('rule-lower'),
            number: document.getElementById('rule-number'),
            special: document.getElementById('rule-special'),
            match: document.getElementById('rule-match'),
        };

        function updateRule(rule, passed) {
            rule.classList.remove('text-danger', 'text-success');
            rule.classList.add(passed ? 'text-success' : 'text-danger');
            rule.querySelector('i').className =
                passed ? 'bi bi-check-circle me-1' : 'bi bi-x-circle me-1';
        }

        function validateLive() {
            const pwd = newPassword.value;
            const confirm = confirmPassword.value;

            const checks = {
                length: pwd.length >= 6,
                upper: /[A-Z]/.test(pwd),
                lower: /[a-z]/.test(pwd),
                number: /[0-9]/.test(pwd),
                special: /[!@#$%^&*(),.?":{}|<>]/.test(pwd),
                match: pwd && pwd === confirm
            };

            updateRule(rules.length, checks.length);
            updateRule(rules.upper, checks.upper);
            updateRule(rules.lower, checks.lower);
            updateRule(rules.number, checks.number);
            updateRule(rules.special, checks.special);
            updateRule(rules.match, checks.match);

            submitBtn.disabled = !Object.values(checks).every(Boolean);
        }

        newPassword.addEventListener('keyup', validateLive);
        confirmPassword.addEventListener('keyup', validateLive);
    </script>


</body>
</html>
