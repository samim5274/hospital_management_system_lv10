<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Test Report - {{ $patient->name ?? 'Unknown' }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <style>
        body {
            font-size: 0.85rem;
            font-family: Arial, sans-serif;
            color: #333;
            margin: 0;
            padding: 20px;
        }

        .header {
            text-align: center;
            margin-bottom: 15px;
        }

        .header h2 {
            font-size: 1.6rem;
            margin-bottom: 2px;
        }

        .header p {
            margin: 0;
            font-size: 0.8rem;
        }

        .fw-label { font-weight: 600; }

        .table th, .table td {
            padding: 0.35rem;
            vertical-align: middle;
        }

        .card {
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 1rem;
            page-break-inside: avoid;
        }

        .card-header {
            background-color: #6c757d;
            color: #fff;
            font-weight: 600;
            padding: 0.45rem 0.75rem;
        }

        .signature {
            width: 100%;
            margin-top: 40px;
            page-break-inside: avoid;
        }

        .signature td {
            text-align: center;
            padding: 1rem;
            font-weight: 600;
        }

        /* Prevent table row split */
        tr { page-break-inside: avoid; }

        @media print {
            .no-print { display: none; }
        }
    </style>
</head>

<body>

{{-- ================= HEADER (FIRST PAGE ONLY) ================= --}}
<div class="header">
    <h2>{{ $company->name ?? 'Hospital Name' }}</h2>
    <p>{{ $company->address ?? 'Address Here' }}</p>
    <p>
        Phone: {{ $company->phone ?? 'N/A' }} |
        Email: {{ $company->email ?? 'N/A' }}
    </p>
    <p>
        Website:
        {{ $company->website ?? 'N/A' }}
    </p>
</div>

{{-- ================= PATIENT INFO ================= --}}
<div class="card mb-3">
    <div class="card-body p-2">
        <div class="row g-2">
            <div class="col-md-3 col-6"><span class="fw-label">Name:</span> {{ $patient->name ?? '-' }}</div>
            <div class="col-md-3 col-6"><span class="fw-label">DOB:</span> {{ $patient->dob ? \Carbon\Carbon::parse($patient->dob)->format('d-M-Y') : '-' }}</div>
            <div class="col-md-3 col-6"><span class="fw-label">Gender:</span> {{ $patient->gender ?? '-' }}</div>
            <div class="col-md-3 col-6"><span class="fw-label">Phone:</span> 0{{ $patient->phone ?? '-' }}</div>

            <div class="col-md-3 col-6"><span class="fw-label">Address:</span> {{ $patient->address ?? '-' }}</div>
            <div class="col-md-3 col-6"><span class="fw-label">Doctor:</span> {{ $patient->doctor->name ?? '-' }}</div>
            <div class="col-md-3 col-6"><span class="fw-label">Reference:</span> {{ $patient->reference->name ?? '-' }}</div>
            <div class="col-md-3 col-6"><span class="fw-label">Date:</span> {{ \Carbon\Carbon::parse($patient->date)->format('d-M-Y') }}</div>
        </div>
    </div>
</div>

{{-- ================= TEST REPORTS ================= --}}
@foreach($testReports as $testId => $reports)
    <div class="card">
        <div class="card-header">
            {{ optional($reports->first()->storeTest?->test)->testName ?? 'Unknown Test' }}
        </div>

        <div class="card-body p-0">
            <table class="table table-bordered mb-0">
                <thead class="table-light text-center">
                    <tr>
                        <th>#</th>
                        <th class="text-start">Part of Test</th>
                        <th>Result</th>
                        <th>Unit</th>
                        <th>Reference</th>
                        <th>Hormone Ref.</th>
                        <th>Remarks</th>
                    </tr>
                </thead>
                <tbody>
                @foreach($reports as $report)
                    <tr class="text-center">
                        <td>{{ $loop->iteration }}</td>
                        <td class="text-start">{{ $report->part_of_test }}</td>
                        <td>{{ $report->result ?? 'Pending' }}</td>
                        <td>{{ $report->unit ?? '-' }}</td>
                        <td>{{ $report->reference_value ?? '-' }}</td>
                        <td>{{ $report->ref_value_of_hormone ?? '-' }}</td>
                        <td>{{ $report->remarks ?? '-' }}</td>
                    </tr>
                @endforeach
                </tbody>
            </table>
        </div>
    </div>
@endforeach

{{-- ================= SIGNATURE ================= --}}
<table class="signature">
    <tr>
        <td>
            ........................................<br>
            Lab Doctor
        </td>
        <td>
            ........................................<br>
            Consulting Doctor<br>
            {{ $patient->doctor->name ?? '-' }}<br>
            {{ $patient->doctor->specialization ?? '-' }}
        </td>
    </tr>
</table>

<script>
    window.onload = function () {
        window.print();
        setTimeout(() => window.close(), 800);
    };
</script>

</body>
</html>