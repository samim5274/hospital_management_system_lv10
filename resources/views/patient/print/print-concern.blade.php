<!DOCTYPE html>
<html lang="bn">
<head>
    <meta charset="UTF-8">
    <title>ভর্তি রোগীর চিকিৎসা / অপারেশন করার সম্মতিপত্র</title>
    <style>
        @page { size: A4; margin: 20mm; }
        body {
            font-family: 'DejaVu Sans', sans-serif;
            font-size: 13px;
            line-height: 1.6;
            color: #000;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 100%;
            margin: 0 auto;
            padding: 10px 15px;
        }

        /* Header */
        .header {
            text-align: center;
            border-bottom: 2px solid #000;
            padding-bottom: 5px;
            margin-bottom: 15px;
        }
        .header h2 {
            font-size: 20px;
            margin: 2px 0;
        }
        .header p {
            margin: 2px 0;
            font-size: 13px;
        }

        h3.title {
            text-align: center;
            font-size: 18px;
            margin: 10px 0;
            text-decoration: underline;
        }

        p.content {
            text-align: justify;
            margin-bottom: 12px;
        }

        /* Patient Info Table */
        table.info-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 5px;
            font-size: 13px;
        }
        table.info-table td {
            padding: 6px;
            vertical-align: top;
        }

        /* Signature Table */
        table.signature {
            width: 100%;
            margin-top: 60px;
        }
        table.signature td {
            text-align: center;
            padding-top: 40px;
        }
    </style>
</head>
<body>

<div class="container">

    {{-- Hospital Header --}}
    <div class="header">
        <h2>{{ $company->name ?? 'Hospital Name' }}</h2>
        <p>{{ $company->address ?? 'Address Here' }}</p>
        <p>Phone: {{ $company->phone ?? 'N/A' }} | Email: {{ $company->email ?? 'N/A' }}</p>
        <p>Website: 
            @if(!empty($company->website))
                <a href="{{ $company->website }}" target="_blank">{{ $company->website }}</a>
            @else
                N/A
            @endif
        </p>
    </div>

    <h3 class="title">ভর্তি রোগীর চিকিৎসা / অপারেশন করার সম্মতিপত্র</h3>

    <p class="content">
        আমি আমার রোগের / আমার রোগের চিকিৎসা / অপারেশনের এবং সম্ভাব্য সকল প্রকার ঝুঁকি সম্পর্কে ডাক্তার কর্তৃক অবহিত হলাম। অতঃপর আমাকে / আমার রোগীকে আংশিক / সম্পূর্ণ অজ্ঞান করে অপারেশন করতে / করাতে সুস্থ মস্তিষ্কে, স্বজ্ঞানে, স্বেচ্ছায় সম্মতি প্রদান করলাম। অপারেশন / চিকিৎসা সময়ে কোন নতুন / জটিল পরিস্থিতির সৃষ্টি হলে রোগীর স্বার্থে যে কোন রকম ব্যবস্থা গ্রহণ করার জন্য কর্তব্যরত ডাক্তার / সার্জন / এনেস্থেটিস্টকে সম্মতি দিলাম। চিকিৎসা / অপারেশন বা অজ্ঞান করার সময় কোন রকম দুর্ঘটনা ঘটলে ক্লিনিক কর্তৃপক্ষ বা ডাক্তারগণ কোন প্রকার দায়ী থাকবেন না।
    </p>

    {{-- Patient Info --}}
    <table class="info-table">
        <tr>
            <td>১। রোগীর নাম: {{ $patient->name ?? '-' }}</td>
            <td>বয়স: 
                @if(!empty($patient->dob))
                    @php
                        $dob = \Carbon\Carbon::parse($patient->dob);
                        $today = \Carbon\Carbon::today();

                        $years = $today->diffInYears($dob);
                        $months = $today->copy()->subYears($years)->diffInMonths($dob);
                        $days = $today->copy()->subYears($years)->subMonths($months)->diffInDays($dob);
                    @endphp
                    {{ $years }} বছর {{ $months }} মাস {{ $days }} দিন
                @else
                    -
                @endif
            </td>
        </tr>
        <tr>
            <td>২। পিতা/স্বামী: {{ $patient->father_husband ?? '-' }}</td>
            <td></td>
        </tr>
        <tr>
            <td colspan="2">৩। ঠিকানা: {{ $patient->address ?? '-' }}</td>
        </tr>
        <tr>
            <td>৪। রেজিস্ট্রেশন নং: {{ $patient->reg ?? '-' }}</td>
            <td>তারিখ: {{ \Carbon\Carbon::today()->format('d.m.Y') }}</td>
        </tr>
        <tr>
            <td>৫। অভিভাবকের নাম: {{ $patient->guardian ?? '_________________' }}</td>
            <td></td>
        </tr>
        <tr>
            <td>৬। রোগীর সাথে সম্পর্ক: _______________________</td>
            <td></td>
        </tr>
    </table>

    {{-- Signature --}}
    <table class="signature">
        <tr>
            <td>.........................................<br>অভিভাবকের স্বাক্ষর</td>
            <td>.........................................<br>রোগীর স্বাক্ষর</td>
        </tr>
        <tr>
            <td colspan="2" style="padding-top:20px;">.........................................<br>ডাক্তার / ক্লিনিক কর্তৃপক্ষ</td>
        </tr>
    </table>

</div>

<script>
    window.onload = function() {
        window.print();
        setTimeout(() => window.close(), 1000);
    };
</script>

</body>
</html>
