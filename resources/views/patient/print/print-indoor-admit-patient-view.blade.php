<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Indoor Patient Report</title>

    <style>
        body {
            font-family: DejaVu Sans, sans-serif;
            font-size: 13px;
            color: #000;
        }

        .container {
            width: 100%;
        }

        .header {
            text-align: center;
            border-bottom: 2px solid #000;
            margin-bottom: 15px;
            padding-bottom: 10px;
        }

        .header h2 {
            margin: 0;
            font-size: 20px;
        }

        .header p {
            margin: 3px 0;
            font-size: 12px;
        }

        .report-info {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
            font-size: 12px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 10px;
        }

        table, th, td {
            border: 1px solid #000;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
            text-align: center;
        }

        th, td {
            padding: 6px;
            vertical-align: middle;
        }

        td {
            text-align: left;
        }

        .text-center {
            text-align: center;
        }

        .footer {
            margin-top: 30px;
            font-size: 12px;
            display: flex;
            justify-content: space-between;
        }

        @media print {
            .no-print {
                display: none;
            }
        }
    </style>
</head>

<body onload="window.print()">

<div class="container">

    <!-- Header -->
    <div class="header">
        <h2>{{ $company->name ?? 'Hospital Management System' }}</h2>
        <p>{{ $company->address ?? '' }}</p>
        <p>Phone: {{ $company->phone ?? '' }}</p>
        <strong>Indoor Admit Patient Report</strong>
    </div>

    <!-- Report Info -->
    <div class="report-info">
        <div>
            <strong>Date Range:</strong>
            {{ \Carbon\Carbon::parse($startDate)->format('d M Y') }}
            -
            {{ \Carbon\Carbon::parse($endDate)->format('d M Y') }}
        </div>
        <div>
            <strong>Total Patients:</strong> {{ $indoorPatients->count() }}
        </div>
    </div>

    <!-- Table -->
    <table>
        <thead>
            <tr>
                <th>#</th>
                <th>Admit Date</th>
                <th>Invoice No</th>
                <th>Patient Name</th>
                <th>Mobile</th>
                <th>Doctor</th>
                <th>Room</th>
            </tr>
        </thead>
        <tbody>
            @forelse($indoorPatients as $key => $patient)
                <tr>
                    <td class="text-center">{{ $key + 1 }}</td>
                    <td class="text-center">
                        {{ \Carbon\Carbon::parse($patient->bed_booked_date)->format('d-M-Y') }}
                    </td>
                    <td class="text-center">{{ $patient->reg ?? '-' }}</td>
                    <td>{{ $patient->name ?? '-' }}</td>
                    <td>{{ $patient->mobile ?? '-' }}</td>
                    <td>{{ $patient->treatmentUnder->name ?? '-' }}</td>
                    <td class="text-center">{{ $patient->bed->bed_number ?? '-' }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="7" class="text-center">No data found</td>
                </tr>
            @endforelse
        </tbody>
    </table>

    <!-- Footer -->
    <div class="footer">
        <div>
            Printed By: {{ Auth::guard('admin')->user()->name ?? 'Admin' }}
        </div>
        <div>
            Printed At: {{ now()->format('d M Y, h:i A') }}
        </div>
    </div>

</div>

<script>
    window.onload = function () {
        window.print();
        setTimeout(() => window.close(), 500);
    };
</script>

</body>
</html>
