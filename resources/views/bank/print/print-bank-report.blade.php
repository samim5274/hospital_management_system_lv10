<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Bank Report - {{ $company->name }}</title>

<style>
    @page { size: A4; margin: 20px; }

    body {
        font-family: Arial, Helvetica, sans-serif;
        font-size: 12px;
        color: #000;
        margin: 0;
        background: #fff;
    }

    .container { width: 100%; padding: 15px 20px; box-sizing: border-box; }

    hr { border: none; border-top: 1px solid #000; margin: 8px 0; }

    /* Header */
    .header h1 { text-align: center; font-size: 22px; margin: 0; }
    .header p { text-align: center; font-size: 12px; color: #555; margin: 2px 0; }

    .report-title {
        text-align: center;
        font-size: 16px;
        font-weight: bold;
        margin: 12px 0 6px;
        text-decoration: underline;
    }

    .sub-title {
        text-align: center;
        font-size: 11px;
        color: #555;
        margin-bottom: 10px;
    }

    /* Table */
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

    .muted { font-size: 10px; color: #555; }

    .total-row { background: #e6e6e6; font-weight: bold; }

    tr { page-break-inside: avoid; }

    .footer {
        text-align: center;
        font-size: 10px;
        color: #555;
        margin-top: 15px;
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
    <div class="report-title">Bank Transaction Report</div>

    <div class="sub-title">
        @if(request('start_date') && request('end_date'))
            Date Between:
            <strong>{{ \Carbon\Carbon::parse(request('start_date'))->format('d M, Y') }}</strong>
            —
            <strong>{{ \Carbon\Carbon::parse(request('end_date'))->format('d M, Y') }}</strong>
        @else
            Generated on {{ now()->format('d M, Y') }}
        @endif
    </div>

    <!-- Table -->
    <table>
        <thead>
            <tr>
                <th width="4%" class="text-center">#</th>
                <th width="10%">Date</th>
                <th width="20%">Bank</th>
                <th width="15%">User</th>
                <th width="12%">Type</th>
                <th width="27%">Remarks</th>
                <th width="12%" class="text-end">Amount</th>
            </tr>
        </thead>

        <tbody>
            @forelse($transactions as $key => $row)
                <tr>
                    <td class="text-center">{{ $key + 1 }}</td>
                    <td>{{ \Carbon\Carbon::parse($row->date)->format('d M, Y') }}</td>
                    <td>{{ $row->bank->bank_name ?? 'N/A' }}</td>
                    <td>{{ $row->user->name ?? 'N/A' }}</td>
                    <td>{{ ucfirst($row->status) }}</td>
                    <td>{{ $row->remarks ?? '-' }}</td>
                    <td class="text-end">
                        ৳ {{ number_format($row->amount, 2) }}
                    </td>
                </tr>
            @empty
                <tr>
                    <td colspan="7" class="text-center muted">
                        No bank transactions found
                    </td>
                </tr>
            @endforelse
        </tbody>

        <!-- Summary -->
        <tfoot>
            <tr class="total-row">
                <td colspan="6" class="text-end">Total Deposit</td>
                <td class="text-end">
                    ৳ {{ number_format($totalDepositAll, 2) }}
                </td>
            </tr>

            <tr class="total-row">
                <td colspan="6" class="text-end">Total Withdraw</td>
                <td class="text-end">
                    ৳ {{ number_format($totalWithdrawAll, 2) }}
                </td>
            </tr>

            <tr class="total-row">
                <td colspan="6" class="text-end">Net Balance</td>
                <td class="text-end">
                    ৳ {{ number_format($totalBalanceAll, 2) }}
                </td>
            </tr>
        </tfoot>
    </table>

    <!-- Footer -->
    <div class="footer">
        Developed by <strong>ARS Soft</strong> | Created by <strong>SAMIM-HOSSAIN</strong>
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
