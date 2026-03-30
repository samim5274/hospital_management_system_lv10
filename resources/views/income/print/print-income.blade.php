<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Income Details - {{ $company->name }}</title>

    <style>
        @page {
            size: A4 landscape;
            margin: 0;
        }

        body {
            font-family: "DejaVu Sans", sans-serif;
            margin: 0;
            padding: 0;
            background: #fff;

            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100%;
        }

        .half-page {
            width: 48%;
            padding: 25px;
            box-sizing: border-box;
            margin-top: 2%;
        }

        .header {
            text-align: center;
            margin-bottom: 15px;
        }

        .header h1 {
            font-size: 26px;
            margin-bottom: 4px;
        }

        .header p {
            font-size: 13px;
            margin: 2px 0;
        }

        hr {
            border: none;
            border-top: 1px solid #000;
            margin: 10px 0;
        }

        .income-card {
            border: 1px solid #000;
            padding: 18px;
            border-radius: 5px;
        }

        .row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 8px;
        }

        .row div {
            width: 48%;
        }

        .label {
            font-weight: bold;
        }

        .remark {
            margin-top: 8px;
            font-size: 13px;
        }

        .amount-box {
            margin-top: 15px;
            text-align: center;
            font-size: 22px;
            font-weight: bold;
            border-top: 1px dashed #000;
            padding-top: 10px;
        }

        .signature {
            display: flex;
            justify-content: space-between;
            margin-top: 40px;
        }

        .sign {
            width: 45%;
            text-align: center;
        }

        .line {
            border-top: 1px solid #000;
            margin: 5px auto;
            width: 70%;
        }

        .footer {
            margin-top: 20px;
            font-size: 10px;
            text-align: center;
        }

        @media print {
            .half-page {
                page-break-after: always;
            }
        }
    </style>
</head>
<body>

<div class="half-page">

    <!-- Header -->
    <div class="header">
        <h1>{{ $company->name }}</h1>
        <p>{{ $company->address }}</p>
        <p>{{ $company->email }} | {{ $company->phone }}</p>
        <hr>
        <h3>Income Voucher</h3>
    </div>

    <!-- Income Info -->
    <div class="income-card">

        <div class="row">
            <div>
                <span class="label">Title:</span>
                {{ $income->title }}
            </div>
            <div>
                <span class="label">Date:</span>
                {{ \Carbon\Carbon::parse($income->date)->format('d M Y') }}
            </div>
        </div>

        <div class="row">
            <div>
                <span class="label">Category:</span>
                {{ $income->category->name ?? 'N/A' }}
            </div>
            <div>
                <span class="label">Sub-category:</span>
                {{ $income->subcategory->name ?? 'N/A' }}
            </div>
        </div>

        <div class="row">
            <div>
                <span class="label">Created By:</span>
                {{ $income->user->name ?? 'N/A' }}
            </div>
        </div>

        <div class="remark">
            <span class="label">Remark:</span>
            {{ $income->description ?? 'N/A' }}
        </div>

        <div class="amount-box">
            Amount: ৳{{ number_format($income->amount, 2) }}/-
        </div>
    </div>

    <!-- Signature -->
    <div class="signature">
        <div class="sign">
            {{ $income->user->name ?? '' }}
            <div class="line"></div>
            <small>Prepared By</small>
        </div>

        <div class="sign">
            <div class="line"></div>
            <small>Approved By</small>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        Powered by <strong>Mercuvaix</strong> | +880 1533-021557
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
