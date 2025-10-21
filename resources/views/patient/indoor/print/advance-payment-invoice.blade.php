<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>Advance Payment Invoice</title>
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
            border-bottom: 2px solid #000;
            padding-bottom: 10px;
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

        .highlight {
            background: #f3f3f3;
            font-weight: 600;
        }
    </style>
</head>
<body>

<div class="invoice-container">

    {{-- Header --}}
    <div class="invoice-header">
        <h2>{{ $company->name ?? 'Hospital Name' }}</h2>
        <p>{{ $company->address ?? 'Address' }}</p>
        <p>Phone: {{ $company->phone ?? '' }} | Email: {{ $company->email ?? '' }}</p>
        <h4><strong>Advance Payment Invoice</strong></h4>
    </div>

    {{-- Patient Info --}}
    <table class="patient-info">
        <tr>
            <td><strong>Reg No:</strong> {{ $data->reg ?? '-' }}</td>
            <td><strong>Date:</strong> {{ \Carbon\Carbon::parse($data->billing_date ?? now())->format('d M Y') }}</td>
        </tr>
        <tr>
            <td><strong>Patient:</strong> {{ $data->patient->name ?? '-' }}</td>
            <td><strong>Prepared By:</strong> {{ $data->user->name ?? 'N/A' }}</td>
        </tr>
        <tr>
            <td colspan="2"><strong>Remarks:</strong> {{ $data->remarks ?? '-' }}</td>
        </tr>
    </table>

    {{-- Advance Payment Table --}}
    @php
        $totalCost = ($data->general_bed ?? 0) 
                + ($data->cabin_fee ?? 0) 
                + ($data->doctor_fee ?? 0) 
                + ($data->service_charge ?? 0) 
                + ($data->ot_medicine ?? 0) 
                + ($data->oral_medicine ?? 0) 
                + ($data->others ?? 0) 
                + ($data->contract_amount ?? 0);

        $payableAmount = $totalCost - ($data->discount ?? 0);
        $remainingDue = $payableAmount - ($data->paid_amount ?? 0) - $data->advance_paid;
    @endphp

    <table class="charges">
        <thead>
            <tr>
                <th>Description</th>
                <th style="width: 30%;">Amount (৳)</th>
            </tr>
        </thead>
        <tbody>
            <tr><td>General Bed</td><td>{{ number_format($data->general_bed ?? 0, 2) }}</td></tr>
            <tr><td>Cabin Fee</td><td>{{ number_format($data->cabin_fee ?? 0, 2) }}</td></tr>
            <tr><td>Doctor Fee</td><td>{{ number_format($data->doctor_fee ?? 0, 2) }}</td></tr>
            <tr><td>Service Charge</td><td>{{ number_format($data->service_charge ?? 0, 2) }}</td></tr>
            <tr><td>OT Medicine</td><td>{{ number_format($data->ot_medicine ?? 0, 2) }}</td></tr>
            <tr><td>Oral Medicine</td><td>{{ number_format($data->oral_medicine ?? 0, 2) }}</td></tr>
            <tr><td>Others</td><td>{{ number_format($data->others ?? 0, 2) }}</td></tr>
            <tr><td>Contract Amount</td><td>{{ number_format($data->contract_amount ?? 0, 2) }}</td></tr>

            <tr class="highlight"><td><strong>Total Cost</strong></td><td><strong>৳{{ number_format($totalCost, 2) }}</strong></td></tr>
            <tr><td>Discount</td><td>৳{{ number_format($data->discount ?? 0, 2) }}</td></tr>
            <tr class="highlight"><td><strong>Payable Amount</strong></td><td><strong>৳{{ number_format($payableAmount, 2) }}</strong></td></tr>
            <tr><td>Advance Paid</td><td>৳{{ number_format($data->advance_paid ?? 0, 2) }}</td></tr>
            <tr class="highlight"><td><strong>Remaining Due</strong></td><td><strong>৳{{ number_format($remainingDue, 2) }}</strong></td></tr>
        </tbody>
    </table>


    {{-- Footer --}}
    <p class="note">
        This invoice is system generated.<br>
        Developed by <strong>SAMIM HOSSAIN</strong> | +8801624209291
    </p>
</div>

<script>
    window.onload = function() {
        window.print();
        setTimeout(() => window.close(), 1000);
    };
</script>

</body>
</html>
