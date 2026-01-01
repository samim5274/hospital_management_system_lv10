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
            @include('layouts.message')
            <div class="col-lg-5 col-md-7 col-12">

                <div class="card shadow-sm rounded-4">
                    <div class="card-body p-5">

                        <!-- Logo -->
                        <div class="text-center mb-4">
                            <img src="{{ asset('assets/images/logo/main-logo.png') }}" alt="Logo" style="height: 100px;">
                        </div>

                        <!-- Title -->
                        <h3 class="text-center fw-bold mb-2 mb-4 text-primary">Confirm OTP</h3>

                        <!-- Login Form -->
                        <form action="{{ url('/otp-verify') }}" method="POST">
                            @csrf
                            <div class="mb-4 text-center">
                                <label class="form-label fw-semibold mb-3">
                                    Enter 6-Digit OTP
                                </label>

                                <div class="d-flex justify-content-center gap-2">
                                    <input type="text" class="form-control otp-input" maxlength="1" inputmode="numeric">
                                    <input type="text" class="form-control otp-input" maxlength="1" inputmode="numeric">
                                    <input type="text" class="form-control otp-input" maxlength="1" inputmode="numeric">
                                    <input type="text" class="form-control otp-input" maxlength="1" inputmode="numeric">
                                    <input type="text" class="form-control otp-input" maxlength="1" inputmode="numeric">
                                    <input type="text" class="form-control otp-input" maxlength="1" inputmode="numeric">
                                </div>

                                <!-- Final OTP -->
                                <input type="hidden" name="otp" id="otp">

                                <div class="form-text mt-2">
                                    OTP has been sent to your email
                                </div>
                            </div>


                            <button type="submit" class="btn btn-primary w-100 btn-lg rounded-3">Verify</button>
                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

    <script>
        const inputs = document.querySelectorAll('.otp-input');
        const otpField = document.getElementById('otp');

        inputs.forEach((input, index) => {

            input.addEventListener('input', () => {
                input.value = input.value.replace(/[^0-9]/g, '');

                if (input.value && index < inputs.length - 1) {
                    inputs[index + 1].focus();
                }

                collectOTP();
            });

            input.addEventListener('keydown', e => {
                if (e.key === 'Backspace' && !input.value && index > 0) {
                    inputs[index - 1].focus();
                }
            });
        });

        function collectOTP() {
            otpField.value = Array.from(inputs).map(i => i.value).join('');
        }
    </script>

</body>
</html>
