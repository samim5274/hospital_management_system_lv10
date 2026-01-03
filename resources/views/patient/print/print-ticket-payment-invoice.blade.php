<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Ticket - {{ $company->name }}</title>
    <style>
        @page {
            size: A4 landscape;
            margin: 0;
        }

        body {
            font-family: "DejaVu Sans", sans-serif;
            margin: 0;
            padding: 0;
            background: #fff;
            display: flex;
            justify-content: center; /* horizontal center */
            align-items: center;    /* vertical center */
            min-height: 100%;
        }

        .half-page {
            width: 48%; /* half page width */
            padding: 25px;            
            box-sizing: border-box;
            margin-top: 2%;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header img {
            height: 55px;
            margin-bottom: 5px;
        }

        .header h1 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 14px;
            margin: 2px 0;
        }

        hr {
            border: none;
            border-top: 1px solid #000;
            margin: 15px 0;
        }

        .ticket-card {
            border: 1px solid #000;
            border-radius: 5px;
            padding: 15px;
            margin-bottom: 20px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 12px;
        }

        .info-column {
            width: 48%;
        }

        .info-column table {
            width: 100%;
            border-collapse: collapse;
        }

        .info-column td {
            padding: 4px 6px;
        }

        .info-column .title {
            background: #f1f1f1;
            font-weight: bold;
            border-bottom: 1px solid #000;
        }

        .doctor-box {
            border: 1px solid #000;
            padding: 10px;
            font-size: 12px;
            text-align: end;
        }

        .doctor-box h4 {
            margin: 0 0 5px 0;
        }

        .amount-box {
            text-align: center;
            font-size: 1.5rem;
            font-weight: bold;
            margin-top: 15px;
            border-top: 1px dashed #000;
            padding-top: 10px;
        }

        .signature-section {
            display: flex;
            justify-content: space-around;
            margin-top: 25px;
        }

        .signature-block {
            width: 45%;
            text-align: center;
        }

        .signature-block .line {
            border-top: 1px solid #000;
            margin: 5px auto 5px auto;
            width: 60%;
        }

        .signature-block small {
            font-size: 12px;
        }

        .note {
            text-align: center;
            font-size: 10px;
            margin-top: 15px;
        }

        @media print {
            body { margin: 0; }
            .half-page { page-break-after: always; }
        }
    </style>
</head>
<body>

<div class="half-page">
    <!-- Header -->
    <div class="header">
        @if($company->logo)
            <img src="{{ public_path($company->logo) }}" alt="Logo">
        @endif
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>{{ $company->email }} | Phone: {{ $company->phone }} | Website: {{ $company->website }}</p>
        <hr>
        <h2>Ticket Payment Invoice</h2>
    </div>

    <!-- Ticket Card -->
    <div class="ticket-card">
        @php
            use Carbon\Carbon;

            // DOB & Age
            $dobText = '-';
            $ageText = '-';
            if (!empty($patient->dob)) {
                $dob = Carbon::parse($patient->dob);
                $dobText = $dob->format('d M Y');
                $diff = $dob->diff(Carbon::now());
                $ageText = "{$diff->y}Y {$diff->m}M {$diff->d}D";
            }
        @endphp


        <div class="info-row">
            <!-- Patient Info -->
            <div class="info-column">
                <table>
                    <tr class="title">
                        <td colspan="2">Patient Info</td>
                    </tr>
                    <tr><td><strong>Name</strong></td><td>{{ $patient->name }}</td></tr>
                    <tr><td><strong>Reg No</strong></td><td>{{ $patient->reg }}</td></tr>
                    <tr><td><strong>Gender</strong></td><td>{{ $patient->gender }}</td></tr>
                    <tr><td><strong>DOB</strong></td><td>{{ $dobText }}</td></tr>
                    <tr><td><strong>Age</strong></td><td>{{ $ageText }}</td></tr>
                    <tr><td><strong>Phone</strong></td><td>+880{{ $patient->phone }}</td></tr>
                    <tr><td><strong>Address</strong></td><td>{{ $patient->address }}</td></tr>
                    <tr><td><strong>Refer</strong></td><td>{{ $patient->reference->name }}</td></tr>
                </table>
            </div>

            <!-- Doctor Info -->
            <div class="info-column doctor-box">
                <h4>Consulting Doctor</h4>
                <strong>{{ $patient->doctor->name ?? '-' }}</strong><br>
                {{ $patient->doctor->specialization ?? '' }}<br>
                Fee: ৳ {{ number_format($patient->doctor->fees ?? 0, 2) }}<br>
                Fee Status: <strong>{{ $patient->duestatus == 1 ? 'Full Paid' : 'Due' }}</strong><br><br>

                <!-- Payment Details -->
                <strong>Payment Summary:</strong><br>
                Total: ৳{{ $patient->total }}<br>
                Paid: ৳{{ $patient->pay }}<br>
                Discount: ৳{{ $patient->discount }}<br>
                Return: ৳{{ $patient->return }}<br>
                Due Amount: ৳{{ $patient->due }}
            </div>
        </div>

        <!-- Signature Section -->
        <div class="signature-section">
            <div class="signature-block">
                <div class="line"></div>
                <small>Prepared By</small>
            </div>
            <div class="signature-block">
                <div class="line"></div>
                <small>Authorized Signature</small>
            </div>
        </div>
    </div>

    <!-- Note -->
    <div class="note">
        Developed by <strong>ARS Soft</strong> | Created by <strong>SAMIM-HosseN</strong> | +880 1533-021557
    </div>
</div>

<script>
    window.onload = function () {
        window.print();
        setTimeout(() => window.close(), 800);
    }
</script>

</body>
</html>
