<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Doctor Visit Ticket</title>

    <style>
        @page {
            size: A4;
            margin: 12mm;
        }

        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 11.5px;
            color: #000;
            position: relative;
            min-height: 100%;
        }

        /* ================= HEADER ================= */
        .header {
            display: flex;
            justify-content: space-between;
            border-bottom: 2px solid #000;
            padding-bottom: 8px;
            margin-bottom: 12px;
        }

        .company {
            width: 65%;
        }

        .company img {
            height: 55px;
            margin-bottom: 4px;
        }

        .company h2 {
            margin: 0;
            font-size: 20px;
        }

        .company p {
            margin: 2px 0;
            font-size: 11px;
        }

        .doctor {
            width: 33%;
            text-align: right;
        }

        .doctor h4 {
            margin: 0 0 4px 0;
            font-size: 14px;
        }

        /* ================= COMMON ================= */
        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 5px 6px;
            vertical-align: middle;
        }

        .border td {
            border: 1px solid #000;
        }

        .title {
            background: #f1f1f1;
            font-weight: bold;
        }

        .section {
            margin-top: 12px;
        }

        /* ================= PRESCRIPTION AREA ================= */
        .prescription-wrapper {
            display: flex;
            margin-top: 14px;
            min-height: 300px;
        }

        .left-space {
            width: 30%;
            border-right: 2px dashed #000;
        }

        .right-space {
            width: 70%;
            padding-left: 10px;
        }

        /* ================= FOOTER ================= */
        .footer {
            position: fixed;
            bottom: 0mm;
            left: 12mm;
            right: 12mm;
            font-size: 10px;
            text-align: center;
            border-top: 1px dashed #000;
            padding-top: 5px;
        }
    </style>
</head>

<body>

{{-- ================= HEADER ================= --}}
<div class="header">

    {{-- Company --}}
    <div class="company">
        @if($company->logo)
            <img src="{{ public_path($company->logo) }}" alt="Logo">
        @endif
        <h2>{{ $company->name }}</h2>
        <p>{{ $company->address }}</p>
        <p>
            {{ $company->email }} |
            {{ $company->phone }} |
            {{ $company->website }}
        </p>
    </div>

    {{-- Doctor --}}
    <div class="doctor">
        <h4>Consulting Doctor</h4>
        <strong>{{ $patient->doctor->name ?? '-' }}</strong><br>
        {{ $patient->doctor->specialization ?? '' }}<br>
        Fee: ৳ {{ number_format($patient->doctor->fees ?? 0, 2) }} <br>
        Status:{{ $patient->duestatus == 1 ? 'Full Paid' : 'Due' }}
    </div>

</div>

{{-- ================= PATIENT INFO ================= --}}
<div class="section">
    <table class="border">
        <tr class="title">
            <td colspan="3"><strong>Patient Information</strong></td>
            <td colspan="3" style="text-align: right;"><strong>Date:</strong> {{ \Carbon\Carbon::parse($patient->date)->format('d M Y') }}</td>
        </tr>

        <tr>
            <td><strong>Name</strong></td>
            <td colspan="3">{{ $patient->name }}</td>

            <td><strong>Reg</strong></td>
            <td>{{ $patient->reg }}</td>
        </tr>
        <tr>
            <td><strong>Gender</strong></td>
            <td>{{ $patient->gender }}</td>

            <td><strong>Date of Birth</strong></td>
            <td>{{ $patient->dob ? \Carbon\Carbon::parse($patient->dob)->format('d M Y') : '-' }}</td>
                @php
                    use Carbon\Carbon;
                    $dobText = '-';
                    $ageText = '-';
                    if (!empty($patient->dob)) {
                        $dob = Carbon::parse($patient->dob);
                        $dobText = $dob->format('d M Y');
                        $now = Carbon::now();
                        $diff = $dob->diff($now);
                        $ageText = "{$diff->y}Y - {$diff->m}M - {$diff->d}D"; 
                    }
                    @endphp
            <td><strong>Age</strong></td>
            <td>{{ $ageText }}</td>
        </tr>
        <tr>
            <td><strong>Phone</strong></td>
            <td>+880{{ $patient->phone }}</td>

            <td><strong>Address</strong></td>
            <td colspan="3">{{ $patient->address }}</td>
        </tr>
    </table>
</div>

{{-- ================= PRESCRIPTION SPACE ================= --}}
<div class="prescription-wrapper">

    {{-- Left 30% blank --}}
    <div class="left-space">
        {{-- Intentionally blank for notes --}}
    </div>

    {{-- Right 70% --}}
    <div class="right-space">
        <strong>Doctor's Notes / Prescription:</strong>
        <br><br><br><br><br><br><br><br><br><br>
    </div>

</div>


{{-- ================= FOOTER (FIXED BOTTOM) ================= --}}
<div class="footer">
    Developed by <strong>ARS Soft</strong> |
    Created by <strong>SAMIM-HosseN</strong> | +880 1533-021557
</div>

<script>
    window.onload = function () {
        window.print();
        setTimeout(() => window.close(), 800);
    }
</script>

</body>
</html>
