<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>Test Sale Report</title>
    <style>
        /* Landscape A4 landscape*/
        @page { size: A4; margin: 10mm 5mm; }
        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 11px;
            margin: 0;
            padding: 0;
            background: #fff;
            color: #000;
        }

        h2, h4 { margin: 0; padding: 0; }
        h2 { font-size: 16px; }
        h4 { font-size: 14px; margin-top: 3px; }

        /* Header */
        .header { text-align: center; margin-bottom: 10px; }
        .header p { margin: 1px 0; font-size: 12px; }

        /* Table */
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 5px;
            font-size: 10.5px;
        }
        table th, table td {
            border: 1px solid #000;
            padding: 4px 6px;
        }
        table th {
            background-color: #f2f2f2;
            text-align: center;
        }
        table td { text-align: center; }
        table td.text-start { text-align: left; }
        table td.text-end { text-align: right; }

        /* Totals */
        .totals {
            margin-top: 5px;
            width: 100%;
            font-size: 11px;
        }
        .totals td {
            padding: 4px 6px;
        }
        .totals td:first-child { text-align: left; }
        .totals td:last-child { text-align: right; }

        /* Footer */
        .footer {
            text-align: center;
            margin-top: 10px;
            font-size: 9px;
        }

        /* Page break for multiple pages */
        .page-break { page-break-after: always; }
    </style>
</head>
<body>

    {{-- Header --}}
    <div class="header">
        <h2>{{ $company->name ?? 'Hospital / Lab Name' }}</h2>
        <p>{{ $company->address ?? '' }}</p>
        <p>Phone: {{ $company->phone ?? '' }}</p>
        <h4><strong>Test Sale Report</strong></h4>
        @if(request()->filled('startDate') || request()->filled('endDate'))
            <p>
                Period: {{ request('startDate') ?? 'Start' }} 
                to {{ request('endDate') ?? 'End' }}
            </p>
        @endif
    </div>

    {{-- Table --}}
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Date</th>
                <th>Patient Name</th>
                <th>Doctor</th>
                <th>Reference</th>
                <th>Total (৳)</th>
                <th>Discount (৳)</th>
                <th>Due (৳)</th>
                <th>Paid (৳)</th>
            </tr>
        </thead>
        <tbody>
            @php
                $grandTotal = $grandDiscount = $grandDue = $grandPay = 0;
            @endphp

            @forelse($datas as $index => $data)
                @php
                    $grandTotal += $data->total;
                    $grandDiscount += $data->discount;
                    $grandDue += $data->due;
                    $grandPay += $data->pay;
                @endphp
                <tr>
                    <td>{{ $index + 1 }}</td>
                    <td>{{ \Carbon\Carbon::parse($data->date)->format('d-M-Y') }}</td>
                    <td class="text-start">
                        <strong>{{ $data->name }}</strong><br><small>{{ $data->reg ?? '-' }}</small>
                    </td>
                    <td class="text-start">{{ $data->doctor->name ?? '-' }}</td>
                    <td class="text-start">{{ $data->reference->name ?? '-' }}</td>
                    <td>{{ number_format($data->total, 2) }}</td>
                    <td>{{ number_format($data->discount, 2) }}</td>
                    <td>{{ number_format($data->due, 2) }}</td>
                    <td>{{ number_format($data->pay, 2) }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="9">No data found for this period</td>
                </tr>
            @endforelse
        </tbody>
        <tfoot>
            <tr>
                <th colspan="5" class="text-end">Grand Total</th>
                <th>{{ number_format($grandTotal, 2) }}</th>
                <th>{{ number_format($grandDiscount, 2) }}</th>
                <th>{{ number_format($grandDue, 2) }}</th>
                <th>{{ number_format($grandPay, 2) }}</th>
            </tr>
        </tfoot>
    </table>

    {{-- Footer --}}
    <div class="footer">
        <p>Developed by <strong>SAMIM HOSSAIN</strong> | +880 1533-021557</p>
    </div>

    <script>
        window.onload = function() {
            window.print();
            setTimeout(() => window.close(), 800);
        };
    </script>
</body>
</html>
