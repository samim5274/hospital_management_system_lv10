<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Outdoor\OutdoorController;
use App\Http\Controllers\Indoor\IndoorController;
use App\Http\Controllers\Setting\SettingController;
use App\Http\Controllers\Lab\LabController;
use App\Http\Controllers\Reagent\ReagentController;

Auth::routes();

// 🔹 Authentication
Route::get('/login', [AuthController::class, 'login'])->name('login');
Route::post('/login', [AuthController::class, 'authenticate'])->name('login.post');
Route::get('/register', [AuthController::class, 'register'])->name('register');
Route::post('/register', [AuthController::class, 'store'])->name('register.post');
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

Route::middleware(['admin'])->group(function () {

    Route::get('/', function () {
        return redirect('/dashboard');
    });

    Route::get('/dashboard', function () {
        return view('welcome');
    });

    // 🔹 Outdoor Management
    Route::prefix('patients')->group(function () {
        Route::get('/', [OutdoorController::class, 'index'])->name('patients.index');
        
        Route::get('/outdoor', [OutdoorController::class, 'outdoor'])->name('patients.outdoor');
        Route::post('/store', [OutdoorController::class, 'store'])->name('patients.store');
        Route::get('/print-invoice/{invoice}', [OutdoorController::class, 'printInvoice'])->name('patients.invoice.print');
        Route::get('/invoice/details/{invoice}', [OutdoorController::class, 'testDetails'])->name('patients.invoice.details'); 
    });

    // 🔹 Indoor Management
    Route::prefix('indoors')->group(function () {
        Route::get('/', [IndoorController::class, 'index'])->name('indoor.index');
        Route::get('/admit', [IndoorController::class, 'indoor'])->name('patients.indoor');
        Route::post('/register', [IndoorController::class, 'admit'])->name('admit.indoor.patients');
        Route::get('/edit/{id}', [IndoorController::class, 'edit'])->name('indoor.patient.edit.view');
        Route::post('/edit/{id}', [IndoorController::class, 'modify'])->name('indoor.patient.modify');
        Route::get('/print/patient/concern/{id}', [IndoorController::class, 'printConcern'])->name('indoor.print.concern.paper');

        Route::get('/bill/prepared', [IndoorController::class, 'billPrepared'])->name('indoor.patient.bill.prepared');
        Route::get('/patient/bill-prepared/{id}', [IndoorController::class, 'billPreparedView'])->name('indoor.patient.bill.prepared.view');
        Route::get('/advance/bill/pay', [IndoorController::class, 'advanceBillPayView'])->name('indoor.advance.bill.pay.view');
        Route::get('/patient/advance/bill/pay/{id}', [IndoorController::class, 'advanceBillPayPatient'])->name('indoor.advance.bill.pay.patient');
        Route::get('/print-advance/bill/{reg}', [IndoorController::class, 'printAdvancePayInvoice'])->name('print.advance.payment.invoice');
        Route::post('/advance/bill/pay/{id}', [IndoorController::class, 'advanceBillPay'])->name('indoor.advance.bill.pay');
        Route::post('/bill/prepared/create/{id}', [IndoorController::class, 'billCreate'])->name('bil.prepared');
        Route::post('/bill/prepared/modify/{id}', [IndoorController::class, 'billModify'])->name('bil.modify');
        Route::get('/print-admit/bill/{reg}', [IndoorController::class, 'printBill'])->name('print.admit.bill');
        Route::get('/patient-discharge-list', [IndoorController::class, 'patientDisList'])->name('patient.dischange.list');
        Route::get('/patient-discharge/{reg}', [IndoorController::class, 'patientViewDis'])->name('discharge.patient.view');
        Route::post('/discharge/patient/{reg}', [IndoorController::class, 'dischargePatient'])->name('discharge.patient');
    });

    Route::prefix('settings')->group(function () {
        Route::get('/', [SettingController::class, 'setting'])->name('setting.view');
        Route::post('/add/refer', [SettingController::class, 'createRefer'])->name('setting.add.refer');
        Route::post('/edit/refer/{id}', [SettingController::class, 'editRefer'])->name('setting.edit.refer');
        Route::post('/add/doctor', [SettingController::class, 'createDoctor'])->name('setting.add.doctor');
        Route::post('/edit/doctor/{id}', [SettingController::class, 'editDoctor'])->name('setting.edit.doctor');
        Route::post('/add/duty/doctor', [SettingController::class, 'createDutyDoctor'])->name('setting.add.duty.doctor');
        Route::post('/edit/duty/doctor/{id}', [SettingController::class, 'editDutyDoctor'])->name('setting.edit.duty.doctor');
        Route::post('/indoors/setting/diseases/store', [SettingController::class, 'store'])->name('setting.diseases.store');
        Route::post('/indoors/setting/diseases/update/{id}', [SettingController::class, 'update'])->name('setting.diseases.update');
        Route::post('/indoors/setting/beds/store', [SettingController::class, 'bedStore'])->name('setting.beds.store');
        Route::post('/indoors/setting/beds/update/{id}', [SettingController::class, 'bedUpdate'])->name('setting.beds.update');
    });

    Route::prefix('labs')->group(function(){
        Route::get('/', [LabController::class, 'index'])->name('lab.test.list');
        Route::get('/test/report/generate/{id}', [LabController::class, 'reportView'])->name('test.report.generate.view');
        Route::post('/test/report/part/add/{id}', [LabController::class, 'addPart'])->name('test.report.part.add');
        Route::post('/test/report/edit/{id}', [LabController::class, 'reportEdit'])->name('test.report.edit');

        Route::get('/reports', [LabController::class, 'reportTestView'])->name('test.lab.report');
        Route::get('/test/report/{reg}', [LabController::class, 'patientLabTest'])->name('lab.test.report');
        Route::post('/patient/test/report/modify/{id}', [LabController::class, 'patientReport'])->name('patient.test.report.modify');
        Route::get('/print/patient/report/{reg}', [LabController::class, 'printPatientReport'])->name('print.patient.report');

        // lab reagent controller and reagent section
        Route::get('/raw-materials', [ReagentController::class, 'rawMatrerial'])->name('labs.row.matrerials');
        Route::post('/create/new/regent', [ReagentController::class, 'storeReagent'])->name('create.new.reagent');
        Route::post('/modify/regent/{id}', [ReagentController::class, 'updateReagent'])->name('modify.reagent');
        Route::get('/setting', [ReagentController::class, 'setting'])->name('lab.settings');
        Route::post('/create/new/reagent', [ReagentController::class, 'createUnit'])->name('reagent.create.unit');
        Route::post('/modify/reagent/{id}', [ReagentController::class, 'modifyUnit'])->name('reagent.modify.unit');
        Route::post('/create/new/generics', [ReagentController::class, 'createGenerics'])->name('reagent.create.generics');
        Route::post('/modify/generics/{id}', [ReagentController::class, 'modifyGenerics'])->name('reagent.modify.generics');
        Route::post('/create/new/presentation', [ReagentController::class, 'createPresentation'])->name('reagent.create.presentation');
        Route::post('/modify/presentation/{id}', [ReagentController::class, 'modifyPresentation'])->name('reagent.modify.presentation');
        Route::get('/stock', [ReagentController::class, 'stock'])->name('reagent.stock');
        Route::get('/reagent/test/enrolled', [ReagentController::class, 'reagentTestEnrolled'])->name('reagent.test.enrolled');
        Route::post('/enroll/reagent/test', [ReagentController::class, 'enrollReagentTest'])->name('enroll.reagent.test');
        Route::post('/modify/enrolled/reagent/test/{id}', [ReagentController::class, 'modifyEnrolledReagentTest'])->name('modify.enrolled.reagent.test');
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
