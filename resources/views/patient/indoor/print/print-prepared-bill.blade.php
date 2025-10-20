<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>Patient Admission Bill</title>
    <style>
        @page { size: A4; margin: 20mm; }

        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 12px;
            background: #fff;
            color: #000;
        }

        .invoice-container {
            width: 100%;
            margin: 0 auto;
        }

        h2, h3, h4 {
            margin: 0;
            text-align: center;
        }

        h2 { font-size: 18px; }
        h4 { font-size: 13px; margin-bottom: 4px; }
        p { margin: 2px 0; }

        /* Header */
        .invoice-header {
            text-align: center;
            margin-bottom: 15px;
            border-bottom: 1px dashed #000;
            padding-bottom: 8px;
        }

        /* Patient Info */
        .patient-info {
            width: 100%;
            margin-bottom: 12px;
            border: 1px solid #000;
            border-collapse: collapse;
        }

        .patient-info td {
            border: 1px solid #000;
            padding: 6px;
        }

        /* Charges Table */
        table.charges {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table.charges th, table.charges td {
            border: 1px solid #000;
            padding: 6px;
        }

        table.charges th {
            background: #f3f3f3;
            text-align: left;
        }

        table.charges td:last-child {
            text-align: right;
        }

        /* Totals */
        .totals {
            width: 100%;
            border-top: 2px solid #000;
            margin-top: 10px;
        }

        .totals td {
            padding: 6px;
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
            font-size: 10px;
            border-top: 1px dashed #000;
            margin-top: 20px;
            padding-top: 6px;
        }
    </style>
</head>
<body>

<div class="invoice-container">

    {{-- Header --}}
    <div class="invoice-header">
        <h2>{{ $company->name ?? 'Hospital Name' }}</h2>
        <p>{{ $company->address ?? 'Address' }}</p>
        <p>Phone: {{ $company->phone ?? '' }}</p>
        <h4><strong>Patient Admission Bill</strong></h4>
    </div>

    {{-- Patient Info --}}
    <table class="patient-info">
        <tr>
            <td><strong>Reg No:</strong> {{ $data->reg ?? '-' }}</td>
            <td><strong>Billing Date:</strong> {{ \Carbon\Carbon::parse($data->billing_date ?? now())->format('d M Y') }}</td>
        </tr>
        <tr>
            <td><strong>Patient ID:</strong> {{ $data->patient->name ?? '-' }}</td>
            <td><strong>Prepared By:</strong> {{ $data->user->name ?? 'N/A' }}</td>
        </tr>
        <tr>
            <td colspan="2"><strong>Remarks:</strong> {{ $data->remarks ?? '-' }}</td>
        </tr>
    </table>

    {{-- Bill Breakdown --}}
    <table class="charges">
        <thead>
            <tr>
                <th>Charge Description</th>
                <th style="width: 30%;">Amount (৳)</th>
            </tr>
        </thead>
        <tbody>
            <tr><td>General Bed</td><td>{{ number_format($data->general_bed, 2) }}</td></tr>
            <tr><td>Cabin Fee</td><td>{{ number_format($data->cabin_fee, 2) }}</td></tr>
            <tr><td>Doctor Fee</td><td>{{ number_format($data->doctor_fee, 2) }}</td></tr>
            <tr><td>Service Charge</td><td>{{ number_format($data->service_charge, 2) }}</td></tr>
            <tr><td>OT Medicine</td><td>{{ number_format($data->ot_medicine, 2) }}</td></tr>
            <tr><td>Oral Medicine</td><td>{{ number_format($data->oral_medicine, 2) }}</td></tr>
            <tr><td>Others</td><td>{{ number_format($data->others, 2) }}</td></tr>
            <tr><td>Contract Amount</td><td>{{ number_format($data->contract_amount, 2) }}</td></tr>
        </tbody>
    </table>

    {{-- Totals --}}
    <table class="totals">
        <tr><td><strong>Total Cost</strong></td><td><strong>৳{{ number_format($data->total_cost, 2) }}</strong></td></tr>
        <tr><td>Discount</td><td>৳{{ number_format($data->discount, 2) }}</td></tr>
        <tr><td>Advance Paid</td><td>৳{{ number_format($data->advance_paid, 2) }}</td></tr>
        <tr><td><strong>Payable Amount</strong></td><td><strong>৳{{ number_format($data->payable_amount, 2) }}</strong></td></tr>
        <tr><td>Paid Amount</td><td>৳{{ number_format($data->paid_amount, 2) }}</td></tr>
        <tr><td><strong>Remaining Due</strong></td><td><strong>৳{{ number_format($data->remaining_due, 2) }}</strong></td></tr>
    </table>

    {{-- Footer --}}
    <p class="note">
        Developed by <strong>SAMIM HOSSAIN</strong><br>
        +8801624209291
    </p>
</div>

<!-- Optional Auto Print -->

<script>
    window.onload = function() {
        window.print();
        setTimeout(() => window.close(), 1000);
    };
</script>


</body>
</html>
