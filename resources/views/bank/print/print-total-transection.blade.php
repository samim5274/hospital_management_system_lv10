<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Transactions - {{ $company->name }}</title>
    <style>
        @page {
            size: A4;
            margin: 15px;       /* print margin */
        }

        body {
            font-family: "DejaVu Sans", sans-serif;
            font-size: 12px;
            margin: 0;
            padding: 0;
            background: #fff;
            box-sizing: border-box;
        }

        .container {
            width: 100%;
            padding: 5px 10px;
            box-sizing: border-box;
        }

        .header {
            text-align: center;
            margin-bottom: 10px;
        }

        .header h1 {
            font-size: 22px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 12px;
            margin: 2px 0;
        }

        hr {
            border: none;
            border-top: 1px solid #000;
            margin: 8px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            font-size: 12px;
            table-layout: fixed; /* prevent overflow */
        }

        table th, table td {
            border: 1px solid #000;
            padding: 5px 8px;
            vertical-align: middle;
            word-wrap: break-word;
        }

        table th {
            background-color: #f0f0f0;
            text-align: left;
        }

        .text-center { text-align: center; }
        .text-end { text-align: right; }
        .status-deposit { color: green; font-weight: bold; }
        .status-withdraw { color: orange; font-weight: bold; }

        td.status-cell {
            padding-right: 10px;
        }

        tbody tr:nth-child(odd) { background-color: #f9f9f9; }

        .totals-row td {
            font-weight: bold;
            background-color: #e0e0e0;
        }

        .signature-section {
            margin-top: 40px;
            display: flex;
            justify-content: space-between;
        }

        .signature-block {
            text-align: center;
            width: 30%;
        }

        .signature-block .line {
            border-top: 1px solid #000;
            margin: 5px auto 5px auto;
            width: 60%;
        }

        .signature-block small {
            font-size: 12px;
        }

        .footer {
            text-align: center;
            font-size: 10px;
            margin-top: 15px;
        }

        @media print {
            body { margin: 0; }
            .container { page-break-after: always; }
        }
    </style>
</head>
<body>

<div class="container">
    <!-- Header -->
    <div class="header">
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>{{ $company->email }} | Phone: {{ $company->phone }} | Website: {{ $company->website }}</p>
        <hr>
        <h2>All Bank Transactions</h2>
        <p>Total Transactions: {{ $transactions->count() }}</p>
    </div>

    <!-- Transactions Table -->
    <table>
        <thead>
            <tr>
                <th style="width:5%;">#</th>
                <th style="width:12%;">Date</th>
                <th style="width:25%;">Bank</th>
                <!-- <th style="width:25%;">User</th> -->
                <th style="width:13%;">Status</th>
                <th style="width:20%;" class="text-end">Amount</th>
            </tr>
        </thead>
        <tbody>
            @php
                $totalDeposit = 0;
                $totalWithdraw = 0;
            @endphp

            @forelse($transactions as $key => $txn)
                @php
                    if($txn->status === 'deposit') $totalDeposit += $txn->amount;
                    elseif($txn->status === 'withdraw') $totalWithdraw += $txn->amount;
                @endphp
                <tr>
                    <td class="text-center">{{ $key + 1 }}</td>
                    <td>{{ \Carbon\Carbon::parse($txn->date)->format('d M, Y') }}</td>
                    <td>
                        {{ $txn->bank->bank_name ?? 'N/A' }}<br>
                        <small>{{ $txn->bank->branch_name ?? '' }}</small> || 
                        <small>{{ $txn->bank->account_number ?? '' }}</small>
                    </td>
                    <!-- <td>{{ $txn->user->name ?? 'N/A' }}</td>                     -->
                    <td class="status-cell">
                        @if($txn->status === 'deposit')
                            <span class="status-deposit">Deposit</span>
                        @elseif($txn->status === 'withdraw')
                            <span class="status-withdraw">Withdraw</span>
                        @else
                            N/A
                        @endif
                    </td>
                    <td class="text-end">৳ {{ number_format($txn->amount, 2) }}</td>
                </tr>
            @empty
                <tr>
                    <td colspan="6" class="text-center">No transactions found</td>
                </tr>
            @endforelse

            <!-- Totals Row -->
            <tr class="totals-row">
                <td colspan="4" class="text-end">Total Deposit</td>
                <td class="text-end">৳ {{ number_format($totalDeposit, 2) }}</td>
            </tr>
            <tr class="totals-row">
                <td colspan="4" class="text-end">Total Withdraw</td>
                <td class="text-end">৳ {{ number_format($totalWithdraw, 2) }}</td>
            </tr>
            <tr class="totals-row">
                <td colspan="4" class="text-end">Balance</td>
                <td class="text-end">৳ {{ number_format($totalDeposit - $totalWithdraw, 2) }}</td>
            </tr>
        </tbody>
    </table>

    <!-- Signature Section -->
    <div class="signature-section">
        <div class="signature-block">
            <div class="line"></div>
            <small>Prepared By</small>
        </div>
        <div class="signature-block">
            <div class="line"></div>
            <small>Checked By</small>
        </div>
        <div class="signature-block">
            <div class="line"></div>
            <small>Approved By</small>
        </div>
    </div>

    <!-- Footer Note -->
    <div class="footer">
        Developed by <strong>ARS Soft</strong> | Created by <strong>SAMIM-HosseN</strong> | +880 1533-021557
    </div>
</div>

<script>
    window.onload = function () {
        window.print();
        setTimeout(function () { window.close(); }, 500);
    };
</script>

</body>
</html>
