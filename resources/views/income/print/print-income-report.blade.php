<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Income Report - {{ $company->name }}</title>

<style>
    /* ===== Page & Body ===== */
    @page {
        size: A4;
        margin: 20px;
    }

    body {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
        color: #000;
        margin: 0;
        padding: 0;
        background: #fff;
    }

    .container {
        width: 100%;
        padding: 15px 20px;
        box-sizing: border-box;
    }

    hr {
        border: none;
        border-top: 1px solid #000;
        margin: 8px 0;
    }

    /* ===== Header ===== */
    .header h1 {
        text-align: center;
        font-size: 22px;
        margin: 0;
    }

    .header p {
        text-align: center;
        font-size: 12px;
        color: #555;
        margin: 2px 0;
    }

    .report-title {
        text-align: center;
        font-size: 16px;
        font-weight: bold;
        margin: 12px 0 6px 0;
        text-decoration: underline;
    }

    .sub-title {
        text-align: center;
        font-size: 11px;
        color: #555;
        margin-bottom: 10px;
    }

    /* ===== Table ===== */
    table {
        width: 100%;
        border-collapse: collapse;
        table-layout: fixed;
        font-size: 12px;
    }

    th, td {
        border: 1px solid #000;
        padding: 6px 8px;
        vertical-align: middle;
        word-wrap: break-word;
    }

    th {
        background: #f0f0f0;
        font-weight: bold;
        text-align: left;
    }

    td.text-end { text-align: right; }
    td.text-center { text-align: center; }

    .muted {
        font-size: 10px;
        color: #555;
        display: block;
    }

    .total-row {
        background: #e6e6e6;
        font-weight: bold;
    }

    tr { page-break-inside: avoid; }

    /* ===== Footer ===== */
    .footer {
        text-align: center;
        font-size: 10px;
        color: #555;
        margin-top: 15px;
    }

    /* ===== Print Settings ===== */
    @media print {
        body { margin: 0; }
        .container { page-break-after: always; }
    }
</style>
</head>

<body>

<div class="container">

    <!-- Company Header -->
    <div class="header">
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>{{ $company->email }} | Phone: {{ $company->phone }} | Website: {{ $company->website }}</p>
        <hr>
    </div>

    <!-- Report Title -->
    <div class="report-title">Incomes Report</div>
    <div class="sub-title">
        Date Between: 
        <strong>{{ \Carbon\Carbon::parse($startDate)->format('d M, Y') }}</strong> 
        || 
        <strong>{{ \Carbon\Carbon::parse($endDate)->format('d M, Y') }}</strong>
    </div>

    <!-- Incomes Table -->
    <table>
        <thead>
            <tr>
                <th width="4%" class="text-center">#</th>
                <th width="10%">Date</th>
                <th width="15%">Category</th>
                <th width="15%">Sub-Category</th>
                <th width="15%">Title</th>
                <th width="15%">User</th>
                <th width="26%">Remark</th>
                <th width="12%" class="text-end">Amount</th>
            </tr>
        </thead>

        <tbody>
            @forelse($inDetails as $key => $expense)
            <tr>
                <td class="text-center">{{ $key + 1 }}</td>
                <td>{{ \Carbon\Carbon::parse($expense->date)->format('d M, Y') }}</td>
                <td>{{ $expense->category->name ?? 'N/A' }}</td>
                <td>{{ $expense->subcategory->name ?? 'N/A' }}</td>
                <td>{{ $expense->title }}</td>
                <td>{{ $expense->user->name ?? 'N/A' }}</td>
                <td>{{ $expense->remark ?? '-' }}</td>
                <td class="text-end">৳ {{ number_format($expense->amount, 2) }}</td>
            </tr>
            @empty
            <tr>
                <td colspan="8" class="text-center muted">No expenses found</td>
            </tr>
            @endforelse
        </tbody>

        <tfoot>
            <tr class="total-row">
                <td colspan="7" class="text-end">Total</td>
                <td class="text-end">৳ {{ number_format($inDetails->sum('amount'), 2) }}</td>
            </tr>
        </tfoot>
    </table>

    <!-- Footer -->
    <div class="footer">
        Developed by <strong>ARS Soft</strong> | Created by <strong>SAMIM-HosseN</strong>
    </div>

</div>

<script>
    window.onload = function () {
        window.print();
        setTimeout(function () {
            window.close();
        }, 500);
    };
</script>

</body>
</html>
