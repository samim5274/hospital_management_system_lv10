<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>Lab Test Invoice</title>
    <style>
        @page { size: 80mm auto; margin: 0; }
        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 11px;
            margin: 0;
            padding: 0;
            width: 80mm;
            background: #fff;
        }
        h2 {
            font-size: 16px;
            margin: 2px 0;
        }
        h4 {
            font-size: 13px;
            margin: 3px 0;
        }
        p {
            margin: 1px 0;
        }
        .center { text-align: center; }

        /* Header */
        .invoice-header {
            text-align: center;
            padding-bottom: 5px;
            margin-bottom: 5px;
        }

        /* Patient Info */
        .invoice-subheader {
            padding: 0 5px;
            margin-bottom: 5px;
        }

        .invoice-subheader table {
            width: 100%;
            font-size: 11px;
            line-height: 1.4;
        }

        /* Test Table */
        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 10.5px;
            margin-top: 5px;
        }

        table th, table td {
            border: 1px dashed #000;
            padding: 3px 5px;
        }

        table th {
            background: #f7f7f7;
            text-align: center;
        }

        table td:last-child {
            text-align: right;
        }

        /* Totals */
        .totals {
            width: 100%;
            margin-top: 6px;
            font-size: 11px;
        }

        .totals td {
            border: none;
            padding: 3px 5px;
        }

        .totals tr td:first-child {
            text-align: left;
        }

        .totals tr td:last-child {
            text-align: right;
        }

        /* Footer */
        .note {
            text-align: center;
            margin-top: 8px;
            font-size: 9px;
            border-top: 1px dashed #000;
            padding-top: 4px;
            line-height: 1.3;
        }
    </style>
</head>
<body>

    {{-- Header --}}
    <div class="invoice-header">
        <h2>{{ $company[0]->name ?? 'Hospital Name' }}</h2>
        <p>{{ $company[0]->address ?? 'Address Here' }}</p>
        <p>{{ $company[0]->phone ?? '' }}</p>
        <h4><strong>Lab Test Invoice</strong></h4>
    </div>

    {{-- Patient Info --}}
    <div class="invoice-subheader">
        <table>
            <tr>
                <td><strong>Reg:</strong> {{ $patientData->reg ?? '' }}</td>
                <td><strong>Date:</strong> {{ \Carbon\Carbon::parse($patientData->created_at ?? now())->format('d M Y, h:i A') }}</td>
            </tr>
            <tr>
                <td colspan="2"><strong>Name:</strong> {{ $patientData->name ?? '' }}</td>
            </tr>
            <tr>
                <td><strong>Phone:</strong> 0{{ $patientData->phone ?? '' }}</td>
                @php
                    use Carbon\Carbon;
                    $dobText = '';
                    $ageText = '';
                    if (!empty($patientData->dob)) {
                        $dob = Carbon::parse($patientData->dob);
                        $dobText = $dob->format('d M Y');
                        $ageYears = $dob->diffInYears();
                        $ageMonths = $dob->diffInMonths() % 12;
                        $ageText = "{$ageYears}Y {$ageMonths}M";
                    }
                @endphp
                <td><strong>DOB:</strong> {{ $dobText ?: '-' }}</td>
            </tr>
            <tr>
                <td><strong>Age:</strong> {{ $ageText ?: '-' }}</td>
                <td><strong>Gender:</strong> {{ ucfirst($patientData->gender ?? '-') }}</td>
            </tr>
        </table>
    </div>

    {{-- Test Table --}}
    <table>
        <thead>
            <tr>
                <th style="width: 10%;">#</th>
                <th>Test Name</th>
                <th style="width: 30%;">৳ Price</th>
            </tr>
        </thead>
        <tbody>
            @forelse($testData as $key => $test)
            <tr>
                <td class="center">{{ $key + 1 }}</td>
                <td>{{ $test->test->testName ?? '' }}</td>
                <td>{{ number_format($test->test->testPrice ?? 0, 2) }}</td>
            </tr>
            @empty
            <tr>
                <td colspan="3" class="center">No Tests Found</td>
            </tr>
            @endforelse
        </tbody>
    </table>

    {{-- Totals --}}
    <table class="totals">
        <tr><td>Subtotal:</td><td>৳{{ number_format($patientData->total ?? 0, 2) }}</td></tr>
        <tr><td>Discount:</td><td>৳{{ number_format($patientData->discount ?? 0, 2) }}</td></tr>
        <tr><td>Payable:</td><td>৳{{ number_format($patientData->payable ?? 0, 2) }}</td></tr>
        <tr><td><strong>Received:<strong></td><td><strong>৳{{ number_format($patientData->pay ?? 0, 2) }}</strong></td></tr>
        <tr><td>Due:</td><td>৳{{ number_format($patientData->due ?? 0, 2) }}</td></tr>
    </table>

    {{-- Footer --}}
    <p class="note">
        Developed by <strong>SAMIM HOSSAIN</strong><br>
        +8801624209291
    </p>

    {{-- Optional Auto Print --}}
    
    <script>
        window.onload = function() {
            window.print();
            setTimeout(() => window.close(), 800);
        };
    </script>
   
</body>
</html>
