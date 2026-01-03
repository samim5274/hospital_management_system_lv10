

<div class="page-content">
    <section class="row">
        <div class="col-12 col-lg-9">
            <div class="row">
                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row align-items-center">
                                <div class="col-12 col-md-4 text-center mb-2 mb-md-0">
                                    <div class="stats-icon purple">
                                        <i class="iconly-boldActivity"></i>
                                    </div>
                                </div>
                                <div class="col-12 col-md-8 text-center text-md-start">
                                    <h6 class="text-muted font-semibold">Test Sale</h6>
                                    <h6 class="font-extrabold mb-0">
                                        ৳ {{ number_format($totalTestSale, 2) }}
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row align-items-center">
                                <div class="col-12 col-md-4 text-center mb-2 mb-md-0">
                                    <div class="stats-icon blue">
                                        <i class="iconly-boldTicket"></i>
                                    </div>
                                </div>
                                <div class="col-12 col-md-8 text-center text-md-start">
                                    <h6 class="text-muted font-semibold">Ticket Sale</h6>
                                    <h6 class="font-extrabold mb-0">
                                        ৳ {{ number_format($totalTicketSale, 2) }}
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row align-items-center">
                                <div class="col-12 col-md-4 text-center mb-2 mb-md-0">
                                    <div class="stats-icon green">
                                        <i class="iconly-boldWallet"></i>
                                    </div>
                                </div>
                                <div class="col-12 col-md-8 text-center text-md-start">
                                    <h6 class="text-muted font-semibold">Expenses</h6>
                                    <h6 class="font-extrabold mb-0">
                                        ৳ {{ number_format($totalExpenses, 2) }}
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-6 col-lg-3 col-md-6">
                    <div class="card">
                        <div class="card-body px-3 py-4-5">
                            <div class="row align-items-center">
                                <div class="col-12 col-md-4 text-center mb-2 mb-md-0">
                                    <div class="stats-icon red">
                                        <i class="iconly-boldGraph"></i>
                                    </div>
                                </div>
                                <div class="col-12 col-md-8 text-center text-md-start">
                                    <h6 class="text-muted font-semibold">Income</h6>
                                    <h6 class="font-extrabold mb-0">
                                        ৳ {{ number_format($totalIncome, 2) }}
                                    </h6>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-header">
                            <h4>Yearly Test Sale Report</h4>
                        </div>
                        <div class="card-body">
                            <div id="chart-profile-visit" data-sales='@json($monthlySales)'></div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12 col-xl-4">
                    <div class="card">
                        <div class="card-header">
                            <h4>Profile Visit</h4>
                        </div>                        
                        <div class="card-body">
                            <div class="row">
                                <div class="col-6">
                                    <div class="d-flex align-items-center">
                                        <svg class="bi text-primary" width="32" height="32" fill="blue"
                                            style="width:10px">
                                            <use
                                                xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
                                        </svg>
                                        <h5 class="mb-0 ms-3">Europe</h5>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <h5 class="mb-0">862</h5>
                                </div>
                                <div class="col-12">
                                    <div id="chart-europe"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="d-flex align-items-center">
                                        <svg class="bi text-success" width="32" height="32" fill="blue"
                                            style="width:10px">
                                            <use
                                                xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
                                        </svg>
                                        <h5 class="mb-0 ms-3">America</h5>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <h5 class="mb-0">375</h5>
                                </div>
                                <div class="col-12">
                                    <div id="chart-america"></div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-6">
                                    <div class="d-flex align-items-center">
                                        <svg class="bi text-danger" width="32" height="32" fill="blue"
                                            style="width:10px">
                                            <use
                                                xlink:href="assets/vendors/bootstrap-icons/bootstrap-icons.svg#circle-fill" />
                                        </svg>
                                        <h5 class="mb-0 ms-3">Indonesia</h5>
                                    </div>
                                </div>
                                <div class="col-6">
                                    <h5 class="mb-0">1025</h5>
                                </div>
                                <div class="col-12">
                                    <div id="chart-indonesia"></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-xl-8">
                    <div class="card">
                        <div class="card-header">
                            <h4>Latest Comments</h4>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
                                <table class="table table-hover table-lg">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Comment</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="assets/images/faces/5.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Cantik</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">Congratulations on your graduation!</p>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="col-3">
                                                <div class="d-flex align-items-center">
                                                    <div class="avatar avatar-md">
                                                        <img src="assets/images/faces/2.jpg">
                                                    </div>
                                                    <p class="font-bold ms-3 mb-0">Si Ganteng</p>
                                                </div>
                                            </td>
                                            <td class="col-auto">
                                                <p class=" mb-0">Wow amazing design! Can you make another
                                                    tutorial for
                                                    this design?</p>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-12 col-lg-3">
            <div class="card">
                <div class="card-body py-4 px-5">
                    <div class="d-flex align-items-center">
                        <div class="avatar avatar-xl">
                            <img src="assets/images/faces/4.jpg" alt="Face 1">
                        </div>
                        <div class="ms-3 name">
                            <h5 class="font-bold">{{ Auth::guard('admin')->user()->name }}</h5>
                            <h6 class="text-muted mb-0">{{ Auth::guard('admin')->user()->email }}</h6>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card shadow-sm">
                <div class="card-header bg-light">
                    <h4 class="mb-0">Today's Banking Transaction</h4>
                </div>
                <div class="card-body p-0">
                    <!-- Total Deposit -->
                    <div class="d-flex align-items-center px-4 py-3 border-bottom">
                        <div class="rounded-circle bg-primary d-flex justify-content-center align-items-center" style="width: 60px; height: 60px;">
                            <i class="iconly-boldActivity text-white fs-3"></i>
                        </div>
                        <div class="ms-4">
                            <h5 class="mb-1">Total Deposit</h5>
                            <h6 class="text-muted mb-0">৳ {{ number_format($totalBankDiposit, 2) }}</h6>
                        </div>
                    </div>

                    <!-- Total Withdraw -->
                    <div class="d-flex align-items-center px-4 py-3 border-bottom">
                        <div class="rounded-circle bg-danger d-flex justify-content-center align-items-center" style="width: 60px; height: 60px;">
                            <i class="iconly-boldChart text-white fs-3"></i>
                        </div>
                        <div class="ms-4">
                            <h5 class="mb-1">Total Withdraw</h5>
                            <h6 class="text-muted mb-0">৳ {{ number_format($totalBankWithdraw, 2) }}</h6>
                        </div>
                    </div>

                    <!-- Balance -->
                    <div class="d-flex align-items-center px-4 py-3 border-bottom">
                        <div class="rounded-circle bg-success d-flex justify-content-center align-items-center" style="width: 60px; height: 60px;">
                            <i class="iconly-boldWallet text-white fs-3"></i>
                        </div>
                        <div class="ms-4">
                            <h5 class="mb-1">Balance</h5>
                            <h6 class="text-muted mb-0">৳ {{ number_format($totalBankBalance, 2) }}</h6>
                        </div>
                    </div>

                    <!-- See all Transactions Button -->
                    <div class="px-4 py-3">
                        <a href="{{ route('money-diposit-withdraw-view') }}" class="btn btn-light-primary w-100 fw-bold">See all Transactions</a>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h4>Patient Profile</h4>
                </div>
                <div class="card-body">
                    <div id="chart-visitors-profile" 
                        data-male="{{ $male }}"
                        data-female="{{ $female }}"></div>
                </div>
            </div>
        </div>
    </section>
</div>