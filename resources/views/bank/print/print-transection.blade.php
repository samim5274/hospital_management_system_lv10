<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Bank Transaction - {{ $company->name }}</title>
    <style>
        @page { size: A4 landscape; margin: 0; }

        body {
            font-family: "DejaVu Sans", sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100%;
            background: #fff;
        }

        .half-page {
            width: 48%;
            padding: 25px;
            box-sizing: border-box;
            margin-top: 2%;
        }

        .header {
            text-align: center;
            margin-bottom: 20px;
        }

        .header h1 {
            font-size: 28px;
            font-weight: bold;
            margin-bottom: 5px;
        }

        .header p {
            font-size: 14px;
            margin: 2px 0;
        }

        hr {
            border: none;
            border-top: 1px solid #000;
            margin: 15px 0;
        }

        .transaction-card {
            border: 1px solid #000;
            border-radius: 5px;
            padding: 20px;
            margin-bottom: 30px;
        }

        .transaction-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 10px;
        }

        .transaction-row div {
            width: 48%;
        }

        .label {
            font-weight: bold;
        }

        .amount-box {
            text-align: center;
            font-size: 1.8rem;
            font-weight: bold;
            margin-top: 15px;
            border-top: 1px dashed #000;
            padding-top: 10px;
        }

        .status-deposit {
            color: green;
            font-weight: bold;
        }

        .status-withdraw {
            color: orange;
            font-weight: bold;
        }

        .signature-section {
            display: flex;
            justify-content: space-around;
            margin-top: 40px;
        }

        .signature-block {
            width: 45%;
            text-align: center;
        }

        .signature-block .line {
            border-top: 1px solid #000;
            margin: 5px auto;
            width: 60%;
        }

        .signature-block small {
            font-size: 12px;
        }

        .note {
            text-align: center;
            font-size: 10px;
            margin-top: 20px;
        }

        @media print {
            body { margin: 0; }
            .half-page { page-break-after: always; }
        }
    </style>
</head>
<body>

    <div class="half-page">
        <!-- Header -->
        <div class="header">
            <h1>{{ $company->name }}</h1>
            <p>{{ $company->address }}</p>
            <p>{{ $company->email }} | Phone: {{ $company->phone }} | Website: {{ $company->website }}</p>
            <hr>
            <h2>Bank Transaction Details</h2>
        </div>

        <!-- Transaction Card -->
        <div class="transaction-card">
            <div class="transaction-row">
                <div><span class="label">Bank Name:</span> {{ $transaction->bank->bank_name ?? 'N/A' }}</div>
                <div><span class="label">Branch:</span> {{ $transaction->bank->branch_name ?? 'N/A' }}</div>
            </div>

            <div class="transaction-row">
                <div><span class="label">Account Name:</span> {{ $transaction->bank->account_name ?? 'N/A' }}</div>
                <div><span class="label">Account Number:</span> {{ $transaction->bank->account_number ?? 'N/A' }}</div>
            </div>

            <div class="transaction-row">
                <div><span class="label">Routing Number:</span> {{ $transaction->bank->routing_number ?? 'N/A' }}</div>
                <div><span class="label">Processed By:</span> {{ $transaction->user->name ?? 'N/A' }}</div>
            </div>

            <div class="transaction-row">
                <div><span class="label">Transaction Date:</span> {{ \Carbon\Carbon::parse($transaction->date)->format('d M, Y') }}</div>
                <div>
                    <span class="label">Status:</span>
                    @if($transaction->status === 'deposit')
                        <span class="status-deposit">Deposit</span>
                    @elseif($transaction->status === 'withdraw')
                        <span class="status-withdraw">Withdraw</span>
                    @else
                        N/A
                    @endif
                </div>
            </div>

            <div><span class="label">Remarks:</span> {{ $transaction->remarks ?? '-' }}</div>

            <div class="amount-box">
                Amount: ৳{{ number_format($transaction->amount, 2) }}/-
            </div>
        </div>

        <!-- Signature Section -->
        <div class="signature-section">
            <div class="signature-block">
                {{ $transaction->user->name ?? '' }}
                <div class="line"></div>
                <small>Prepared By</small>
            </div>
            <div class="signature-block">
                <div class="line"></div>
                <small>Approved By</small>
            </div>
        </div>

        <!-- Footer Note -->
        <div class="note">
            Developed by <strong>ARS Soft</strong> | Created by <strong>SAMIM-HosseN</strong> | +880 1533-021557
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
