<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Total Transactions Report</title>
    <style>
        /* A4 Print Setup */
        @page {
            size: A4 portrait;
            margin: 15mm;
        }

        body {
            font-family: "DejaVu Sans", Arial, sans-serif;
            font-size: 14px;
            color: #000;
            margin: 0;
            padding: 0;
            background: #fff;
        }

        .invoice-header {
            text-align: center;
            margin-bottom: 15px;
        }

        .invoice-header h2 {
            margin: 0;
            font-size: 18pt;
        }

        .invoice-header p {
            margin: 2px 0;
            font-size: 12pt;
        }

        h1 {
            text-align: center;
            font-size: 16pt;
            margin: 15px 0;
            text-decoration: underline;
        }

        .card {
            border: 1px solid #000;
            border-radius: 4px;
            margin-bottom: 20px;
            page-break-inside: avoid;
        }

        .card-header {
            background-color: #f0f0f0;
            font-weight: bold;
            padding: 8px 12px;
            border-bottom: 1px solid #000;
        }

        /* .card-body {
            padding: 8px 12px;
        } */

        table {
            width: 100%;
            border-collapse: collapse;
        }

        table th, table td {
            border: 1px solid #000;
            padding: 6px 8px;
        }

        table th {
            background-color: #e0e0e0;
            text-align: left;
        }

        .amount {
            text-align: right;
            font-weight: bold;
        }

        /* Signature section */
        .signature-section {
            margin-top: 100px;
            display: flex;
            justify-content: space-between;
            padding: 0 50px;
        }

        .signature-left div,
        .signature-right div {
            text-align: center;
            border-top: 1px solid #000;
            width: 200px;
            padding-top: 5px;
        }


        /* ================= FOOTER ================= */
        .footer {
            position: fixed;
            bottom: 0mm;
            left: 12mm;
            right: 12mm;
            font-size: 10px;
            text-align: center;
            border-top: 1px dashed #000;
            padding-top: 5px;
        }

        /* Print optimization */
        @media print {
            body { margin: 0; }
            .card { page-break-inside: avoid; }
        }
    </style>
</head>
<body>

    <!-- Header -->
    <div class="invoice-header">
        <h2>{{ $company->name ?? 'Hospital Name' }}</h2>
        <p>{{ $company->address ?? 'Address Here' }}</p>
        <p>{{ $company->phone ?? '' }}</p>
        <h3><strong>Total Transactions Report</strong></h3>
        <p>Report Date: {{ \Carbon\Carbon::now()->format('l, d F Y, h:i:s A') }}</p>
    </div>

    <!-- Outdoor Test Sales -->
    <div class="card">
        <div class="card-header">Outdoor Test Sales</div>
        <div class="card-body">
            <table>
                <tr><td>Total Sale</td><td class="amount">৳{{ number_format($totalTestSale,2) }}</td></tr>
                <tr><td>Total Discount</td><td class="amount">৳{{ number_format($totalTestDiscount,2) }}</td></tr>
                <tr><td>Total Payable</td><td class="amount">৳{{ number_format($totalTestPayable,2) }}</td></tr>
                <tr><td>Total Paid</td><td class="amount">৳{{ number_format($totalTestPay,2) }}</td></tr>
                <tr><td>Total Due</td><td class="amount">৳{{ number_format($totalTestDue,2) }}</td></tr>
                <tr><td>Total Return</td><td class="amount">৳{{ number_format($totalReturn,2) }}</td></tr>
            </table>
        </div>
    </div>

    <!-- Ticket Sales -->
    <div class="card">
        <div class="card-header">Ticket Sales</div>
        <div class="card-body">
            <table>
                <tr><td>Total Amount</td><td class="amount">৳{{ number_format($totalTicketAmount,2) }}</td></tr>
                <tr><td>Total Discount</td><td class="amount">৳{{ number_format($totalTicketDiscount,2) }}</td></tr>
                <tr><td>Total Payable</td><td class="amount">৳{{ number_format($totalTicketPayable,2) }}</td></tr>
                <tr><td>Total Paid</td><td class="amount">৳{{ number_format($totalTicketPay,2) }}</td></tr>
                <tr><td>Total Due</td><td class="amount">৳{{ number_format($totalTicketDue,2) }}</td></tr>
                <tr><td>Total Return</td><td class="amount">৳{{ number_format($totalTicketReturn,2) }}</td></tr>
            </table>
        </div>
    </div>

    <!-- Expenses & Income -->
    <div class="card">
        <div class="card-header">Expenses & Income</div>
        <div class="card-body">
            <table>
                <tr><td>Total Expenses</td><td class="amount">৳{{ number_format($totalExpenses,2) }}</td></tr>
                <tr><td>Total Extra Income</td><td class="amount">৳{{ number_format($totalIncome,2) }}</td></tr>
            </table>
        </div>
    </div>

    <!-- Banking Transactions -->
    <div class="card">
        <div class="card-header">Banking Transactions</div>
        <div class="card-body">
            <table>
                <tr><td>Total Deposit</td><td class="amount">৳{{ number_format($totalBankDiposit,2) }}</td></tr>
                <tr><td>Total Withdraw</td><td class="amount">৳{{ number_format($totalBankWithdraw,2) }}</td></tr>
                <tr><td>Bank Balance</td><td class="amount">৳{{ number_format($totalBankBalance,2) }}</td></tr>
            </table>
        </div>
    </div>

    <!-- Indoor Transactions -->
    <div class="card">
        <div class="card-header">Indoor Transactions</div>
        <div class="card-body">
            <table>
                <tr><td>Total Cost</td><td class="amount">৳{{ number_format($totalIndoorCost,2) }}</td></tr>
                <tr><td>Total Contract</td><td class="amount">৳{{ number_format($totalIndoorContract,2) }}</td></tr>
                <tr><td>Total Discount</td><td class="amount">৳{{ number_format($totalIndoorDiscount,2) }}</td></tr>
                <tr><td>Total Advance Paid</td><td class="amount">৳{{ number_format($totalIndoorAdvance,2) }}</td></tr>
                <tr><td>Total Payable</td><td class="amount">৳{{ number_format($totalIndoorPayable,2) }}</td></tr>
                <tr><td>Total Paid</td><td class="amount">৳{{ number_format($totalIndoorPaid,2) }}</td></tr>
                <tr><td>Total Due</td><td class="amount">৳{{ number_format($totalIndoorDue,2) }}</td></tr>
            </table>
        </div>
    </div>

    <div class="card">
        <div class="card-header">Balance</div>
        <div class="card-body">
            <table>
                <tr><td>Test</td><td class="amount">+৳{{ number_format($totalTestPay,2) }}</td></tr>
                <tr><td>Teket</td><td class="amount">+৳{{ number_format($totalTicketPay,2) }}</td></tr>
                <tr><td>Indoor</td><td class="amount">+৳{{ number_format($totalIndoorPaid,2) }}</td></tr>
                <tr><td>Income</td><td class="amount">+৳{{ number_format($totalIncome,2) }}</td></tr>
                <tr><td>Bank Withdraw</td><td class="amount">+৳{{ number_format($totalBankWithdraw,2) }}</td></tr>

                <tr><td>Diposit</td><td class="amount">-৳{{ number_format($totalBankDiposit,2) }}</td></tr>
                <tr><td>Expenses</td><td class="amount">-৳{{ number_format($totalExpenses,2) }}</td></tr>

                <tr><td><strong>Total Balance</strong></td><td class="amount">৳{{ number_format($totalHandCash,2) }}</td></tr>
            </table>
        </div>
    </div>

    <div class="signature-section">
        <div class="signature-left">
            <div>Prepared By</div>
        </div>
        <div class="signature-right">
            <div>Authorized Signature</div>
        </div>
    </div>


    <div class="footer">
        Powered by <strong>Mercuvaix</strong> | +880 1533-021557
    </div>

    <script>
        window.onload = function() {
            window.print();
            setTimeout(() => window.close(), 800);
        };
    </script>

</body>
</html>
