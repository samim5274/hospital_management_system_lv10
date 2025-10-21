{{-- resources/views/lab/print/print-patient-test-report.blade.php --}}
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Patient Test Report - {{ $patient->name ?? 'Unknown' }}</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body { font-size: 0.85rem; font-family: Arial, sans-serif; color: #333; margin-top: 150px; }
        .table th, .table td { vertical-align: middle; padding: 0.3rem; }
        .fw-label { font-weight: 600; }
        .card { border: 1px solid #ddd; border-radius: 4px; margin-bottom: 1rem; }
        .card-header { background-color: #6c757d; color: #fff; font-weight: 600; padding: 0.5rem 0.75rem; }
        .card-body { padding: 0.5rem 0.75rem; }
        .signature { width: 100%; margin-top: 1.5rem; }
        .signature td { text-align: center; padding: 1rem; font-weight: 600; }
        .table tbody tr:nth-child(odd) { background-color: #f9f9f9; }
        .no-print { display: inline-block; margin-bottom: 10px; }

        /* Fixed header for all printed pages */
        .header {
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            height: 140px;
            text-align: center;
            padding-top: 10px;
            border-bottom: 1px solid #ddd;
            background-color: #fff;
        }
        .header h2 { font-size: 1.6rem; margin-bottom: 0; }
        .header p { margin: 0; font-size: 0.8rem; }

        @media print {
            .no-print { display: none; }
            body { margin-top: 150px; }
            .card { page-break-inside: avoid; }
            .header { position: fixed; top: 0; }
        }
    </style>
</head>
<body class="p-3">

    {{-- Persistent Header --}}
    <div class="header">
        <h2>{{ $company->name ?? 'Hospital Name' }}</h2>
        <p>{{ $company->address ?? 'Address Here' }}</p>
        <p>Phone: {{ $company->phone ?? 'N/A' }} | Email: {{ $company->email ?? 'N/A' }}</p>
        <p>Website: 
            @if(!empty($company->website))
                <a href="{{ $company->website }}" target="_blank">{{ $company->website }}</a>
            @else N/A @endif
        </p>
        {{-- Compact Patient Information --}}
        <div class="card mb-2">
            <div class="card-body p-2">
                <div class="row g-2">
                    <div class="col-md-3 col-6"><span class="fw-label">Name:</span> {{ $patient->name ?? '-' }}</div>
                    <div class="col-md-3 col-6"><span class="fw-label">DOB:</span> {{ $patient->dob ? \Carbon\Carbon::parse($patient->dob)->format('d-M-Y') : '-' }}</div>
                    <div class="col-md-3 col-6"><span class="fw-label">Gender:</span> {{ $patient->gender ?? '-' }}</div>
                    <div class="col-md-3 col-6"><span class="fw-label">Phone:</span> 0{{ $patient->phone ?? '-' }}</div>
                    <div class="col-md-3 col-6"><span class="fw-label">Address:</span> {{ $patient->address ?? '-' }}</div>
                    <div class="col-md-3 col-6"><span class="fw-label">Doctor:</span> {{ $patient->doctor->name ?? '-' }}</div>
                    <div class="col-md-3 col-6"><span class="fw-label">Reference:</span> {{ $patient->reference->name ?? '-' }}</div>
                    <div class="col-md-3 col-6"><span class="fw-label">Date:</span> {{ $patient->date ? \Carbon\Carbon::parse($patient->date)->format('d-M-Y') : '-' }}</div>
                </div>
            </div>
        </div>
    </div>

    {{-- Print Button & Title --}}
    <div class="d-flex justify-content-between align-items-center mb-2 no-print">
        <h5 class="mb-0 text-uppercase fw-bold">Patient Test Report</h5>
        <!-- <button class="btn btn-primary btn-sm" onclick="window.print()">Print</button> -->
    </div>

    {{-- Test Reports --}}
    @foreach($testReports as $testId => $reports)
        <div class="card mb-2">
            <div class="card-header">
                {{ optional($reports->first()->test)->testName ?? 'Unknown Test' }}
            </div>
            <div class="card-body p-0">
                <table class="table table-bordered mb-0" style="font-size:0.82rem;">
                    <thead class="table-light text-center">
                        <tr>
                            <th>#</th>
                            <th class="text-start">Part of Test</th>
                            <th>Result</th>
                            <th>Unit</th>
                            <th>Reference Value</th>
                            <th>Hormone Reference</th>
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

    {{-- Signature Section --}}
    <table class="signature">
        <tr>
            <td>........................................<br>Lab Doctor</td>
            <td>........................................<br>Consulting Doctor <br>{{ $patient->doctor->name ?? '-' }} <br>{{ $patient->doctor->specialization ?? '-' }}</td>
        </tr>
    </table>

    <script>
        window.onload = function() {
            window.print();
            setTimeout(() => window.close(), 1000);
        };
    </script>
</body>
</html>