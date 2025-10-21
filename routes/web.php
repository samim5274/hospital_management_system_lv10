<?php

use Illuminate\Support\Facades\Route;

Auth::routes();

// 🔹 Authentication
Route::get('/login', [App\Http\Controllers\AuthController::class, 'login'])->name('login');
Route::post('/login', [App\Http\Controllers\AuthController::class, 'authenticate'])->name('login.post');
Route::get('/register', [App\Http\Controllers\AuthController::class, 'register'])->name('register');
Route::post('/register', [App\Http\Controllers\AuthController::class, 'store'])->name('register.post');
Route::get('/logout', [App\Http\Controllers\AuthController::class, 'logout'])->name('logout');

Route::middleware(['admin'])->group(function () {

    Route::get('/', function () {
        return redirect('/dashboard');
    });

    Route::get('/dashboard', function () {
        return view('welcome');
    });

    // 🔹 Outdoor Management
    Route::prefix('patients')->group(function () {
        Route::get('/', [App\Http\Controllers\Outdoor\OutdoorController::class, 'index'])->name('patients.index');
        
        Route::get('/outdoor', [App\Http\Controllers\Outdoor\OutdoorController::class, 'outdoor'])->name('patients.outdoor');
        Route::post('/store', [App\Http\Controllers\Outdoor\OutdoorController::class, 'store'])->name('patients.store');
        Route::get('/print-invoice/{invoice}', [App\Http\Controllers\Outdoor\OutdoorController::class, 'printInvoice'])->name('patients.invoice.print');
        Route::get('/invoice/details/{invoice}', [App\Http\Controllers\Outdoor\OutdoorController::class, 'testDetails'])->name('patients.invoice.details'); 
    });

    // 🔹 Indoor Management
    Route::prefix('indoors')->group(function () {
        Route::get('/', [App\Http\Controllers\Indoor\IndoorController::class, 'index'])->name('indoor.index');
        Route::get('/admit', [App\Http\Controllers\Indoor\IndoorController::class, 'indoor'])->name('patients.indoor');
        Route::post('/register', [App\Http\Controllers\Indoor\IndoorController::class, 'admit'])->name('admit.indoor.patients');
        Route::get('/edit/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'edit'])->name('indoor.patient.edit.view');
        Route::post('/edit/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'modify'])->name('indoor.patient.modify');
        Route::get('/print/patient/concern/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'printConcern'])->name('indoor.print.concern.paper');

        Route::get('/bill/prepared', [App\Http\Controllers\Indoor\IndoorController::class, 'billPrepared'])->name('indoor.patient.bill.prepared');
        Route::get('/patient/bill-prepared/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'billPreparedView'])->name('indoor.patient.bill.prepared.view');
        Route::get('/advance/bill/pay', [App\Http\Controllers\Indoor\IndoorController::class, 'advanceBillPayView'])->name('indoor.advance.bill.pay.view');
        Route::get('/patient/advance/bill/pay/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'advanceBillPayPatient'])->name('indoor.advance.bill.pay.patient');
        Route::post('/advance/bill/pay/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'advanceBillPay'])->name('indoor.advance.bill.pay');
        Route::post('/bill/prepared/create/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'billCreate'])->name('bil.prepared');
        Route::post('/bill/prepared/modify/{id}', [App\Http\Controllers\Indoor\IndoorController::class, 'billModify'])->name('bil.modify');
        Route::get('/print-admit/bill/{reg}', [App\Http\Controllers\Indoor\IndoorController::class, 'printBill'])->name('print.admit.bill');
        Route::get('/patient-discharge-list', [App\Http\Controllers\Indoor\IndoorController::class, 'patientDisList'])->name('patient.dischange.list');
        Route::get('/patient-discharge/{reg}', [App\Http\Controllers\Indoor\IndoorController::class, 'patientViewDis'])->name('discharge.patient.view');
        Route::post('/discharge/patient/{reg}', [App\Http\Controllers\Indoor\IndoorController::class, 'dischargePatient'])->name('discharge.patient');
    });

    Route::prefix('settings')->group(function () {
        Route::get('/', [App\Http\Controllers\Setting\SettingController::class, 'setting'])->name('setting.view');
        Route::post('/add/refer', [App\Http\Controllers\Setting\SettingController::class, 'createRefer'])->name('setting.add.refer');
        Route::post('/edit/refer/{id}', [App\Http\Controllers\Setting\SettingController::class, 'editRefer'])->name('setting.edit.refer');
        Route::post('/add/doctor', [App\Http\Controllers\Setting\SettingController::class, 'createDoctor'])->name('setting.add.doctor');
        Route::post('/edit/doctor/{id}', [App\Http\Controllers\Setting\SettingController::class, 'editDoctor'])->name('setting.edit.doctor');
        Route::post('/add/duty/doctor', [App\Http\Controllers\Setting\SettingController::class, 'createDutyDoctor'])->name('setting.add.duty.doctor');
        Route::post('/edit/duty/doctor/{id}', [App\Http\Controllers\Setting\SettingController::class, 'editDutyDoctor'])->name('setting.edit.duty.doctor');
        Route::post('/indoors/setting/diseases/store', [App\Http\Controllers\Setting\SettingController::class, 'store'])->name('setting.diseases.store');
        Route::post('/indoors/setting/diseases/update/{id}', [App\Http\Controllers\Setting\SettingController::class, 'update'])->name('setting.diseases.update');
        Route::post('/indoors/setting/beds/store', [App\Http\Controllers\Setting\SettingController::class, 'bedStore'])->name('setting.beds.store');
        Route::post('/indoors/setting/beds/update/{id}', [App\Http\Controllers\Setting\SettingController::class, 'bedUpdate'])->name('setting.beds.update');
    });

    Route::prefix('labs')->group(function(){
        Route::get('/', [App\Http\Controllers\Lab\LabController::class, 'index'])->name('lab.test.list');
        Route::get('/test/report/generate/{id}', [App\Http\Controllers\Lab\LabController::class, 'reportView'])->name('test.report.generate.view');
        Route::post('/test/report/part/add/{id}', [App\Http\Controllers\Lab\LabController::class, 'addPart'])->name('test.report.part.add');
        Route::post('/test/report/edit/{id}', [App\Http\Controllers\Lab\LabController::class, 'reportEdit'])->name('test.report.edit');

        Route::get('/reports', [App\Http\Controllers\Lab\LabController::class, 'reportTestView'])->name('test.lab.report');
        Route::get('/test/report/{reg}', [App\Http\Controllers\Lab\LabController::class, 'patientLabTest'])->name('lab.test.report');
        Route::post('/patient/test/report/modify/{id}', [App\Http\Controllers\Lab\LabController::class, 'patientReport'])->name('patient.test.report.modify');
        Route::get('/print/patient/report/{reg}', [App\Http\Controllers\Lab\LabController::class, 'printPatientReport'])->name('print.patient.report');
    });

    // // 🔹 Accounts
    // Route::prefix('accounts')->group(function () {
    //     Route::get('/invoices', [App\Http\Controllers\AccountController::class, 'invoices'])->name('accounts.invoices');
    //     Route::get('/expenses', [App\Http\Controllers\AccountController::class, 'expenses'])->name('accounts.expenses');
    //     Route::get('/payments', [App\Http\Controllers\AccountController::class, 'payments'])->name('accounts.payments');
    //     Route::get('/report', [App\Http\Controllers\AccountController::class, 'report'])->name('accounts.report');
    // });


    // // 🔹 Staff Management
    // Route::prefix('staff')->group(function () {
    //     Route::get('/', [App\Http\Controllers\StaffController::class, 'index'])->name('staff.index');
    //     Route::get('/roles', [App\Http\Controllers\StaffController::class, 'roles'])->name('staff.roles');
    //     Route::get('/salary', [App\Http\Controllers\StaffController::class, 'salary'])->name('staff.salary');
    // });


    // // 🔹 Reports
    // Route::prefix('reports')->group(function () {
    //     Route::get('/daily', [App\Http\Controllers\ReportController::class, 'daily'])->name('reports.daily');
    //     Route::get('/monthly', [App\Http\Controllers\ReportController::class, 'monthly'])->name('reports.monthly');
    //     Route::get('/financial', [App\Http\Controllers\ReportController::class, 'financial'])->name('reports.financial');
    // });


});
