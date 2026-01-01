<?php

use Illuminate\Support\Facades\Route;

use App\Http\Controllers\AuthController;
use App\Http\Controllers\Outdoor\OutdoorController;
use App\Http\Controllers\Indoor\IndoorController;
use App\Http\Controllers\Setting\SettingController;
use App\Http\Controllers\Lab\LabController;
use App\Http\Controllers\Reagent\ReagentController;
use App\Http\Controllers\Expenses\ExpensesController;
use App\Http\Controllers\Income\IncomeController;
use App\Http\Controllers\Bank\BankController;

Auth::routes();

// 🔹 Authentication
Route::get('/login', [AuthController::class, 'login'])->name('login');
Route::post('/login', [AuthController::class, 'authenticate'])->name('login.post');
Route::get('/register', [AuthController::class, 'register'])->name('register');
Route::post('/register', [AuthController::class, 'store'])->name('register.post');
Route::get('/logout', [AuthController::class, 'logout'])->name('logout');

Route::get('/forget-password', [AuthController::class, 'forgetPassView'])->name('forget.password.view');
Route::post('/find-forget-account', [AuthController::class, 'findAccount'])->name('find-account');
Route::get('/otp-confirm', [AuthController::class, 'otpConfirm'])->name('otp.form');
Route::post('/otp-verify', [AuthController::class, 'verifyOTP'])->name('verify.otp');
Route::get('/create-new-password', [AuthController::class, 'newPassword'])->name('new.password.form');
Route::post('/update-password', [AuthController::class, 'updatePass'])->name('update-password');


Route::middleware(['admin'])->group(function () {

    Route::get('/', function () {
        return redirect('/dashboard');
    });

    Route::get('/dashboard', function () {
        $company = App\Models\Company::first();
        return view('welcome', compact('company'));
    });

    // 🔹 Outdoor Management
    Route::prefix('patients')->group(function () {
        Route::get('/', [OutdoorController::class, 'index'])->name('patients.index');
        
        Route::get('/outdoor', [OutdoorController::class, 'outdoor'])->name('patients.outdoor');
        Route::post('/store', [OutdoorController::class, 'store'])->name('patients.store');
        Route::get('/print-invoice/{invoice}', [OutdoorController::class, 'printInvoice'])->name('patients.invoice.print');
        Route::get('/invoice/details/{invoice}', [OutdoorController::class, 'testDetails'])->name('patients.invoice.details'); 
        Route::get('/cancel', [OutdoorController::class, 'cancelTestView'])->name('patients.test.cancel.view');
        Route::post('/cancel/test/{id}', [OutdoorController::class, 'cancelTest'])->name('patients.test.cancel');
        Route::get('/test-cancel/{reg}', [OutdoorController::class, 'cancelTestByReg'])->name('patients.test.cancel.by.reg');
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
        Route::get('/get-subcategories/{categoryId}', [LabController::class, 'getSubcategories']);
        Route::post('/test-store', [LabController::class, 'store'])->name('lab.test.store');
        Route::get('/test/report/generate/{id}', [LabController::class, 'reportView'])->name('test.report.generate.view');
        Route::post('/test/report/part/add/{id}', [LabController::class, 'addPart'])->name('test.report.part.add');
        Route::post('/test/report/edit/{id}', [LabController::class, 'reportEdit'])->name('test.report.edit');
        Route::get('/test/delete/{id}', [LabController::class, 'deleteTest'])->name('test-delete');
        Route::get('/delete/test/report/{id}', [LabController::class, 'deleteTestReport'])->name('delete.test.report');

        Route::get('/setting-test', [LabController::class, 'setting'])->name('lab.test.setting');
        Route::post('/create-category', [LabController::class, 'addCategory'])->name('create.lab.test.category');
        Route::post('/edit-category/{id}', [LabController::class, 'editCategory'])->name('edit.lab.test.category');
        Route::get('/delete-category/{id}', [LabController::class, 'deleteCategory'])->name('delete.lab.test.category');
        Route::post('/create-sub-category', [LabController::class, 'addSubCategory'])->name('create.lab.test.sub.category');
        Route::post('/edit-sub-category/{id}', [LabController::class, 'editSubCategory'])->name('edit.lab.test.sub.category');
        Route::get('/delete-sub-category/{id}', [LabController::class, 'deleteSubCategory'])->name('delete.lab.test.sub.category');
        Route::post('/create-group', [LabController::class, 'addGroup'])->name('create.lab.test.group');
        Route::post('/edit-group/{id}', [LabController::class, 'editGroup'])->name('edit.lab.test.group');
        Route::get('/delete-group/{id}', [LabController::class, 'deleteGroup'])->name('delete.lab.test.group');        
        Route::post('/create-specimen', [LabController::class, 'addSpecimen'])->name('create.lab.test.specimen');
        Route::post('/edit-specimen/{id}', [LabController::class, 'editSpecimen'])->name('edit.lab.test.specimen');
        Route::get('/delete-specimen/{id}', [LabController::class, 'deleteSpecimen'])->name('delete.lab.test.specimen');

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

    // 🔹 Accounts
    Route::prefix('accounts')->group(function () {
        Route::get('/expenses', [ExpensesController::class, 'index'])->name('accounts.expenses');
        Route::get('/get-ex-subcategories/{category_id}', [ExpensesController::class, 'getExSubcategories'])->name('accounts.get.ex.subcategories');
        Route::post('/add/expenses', [ExpensesController::class, 'storeExpenses'])->name('add.expenses');
        Route::get('/expenses/delete/{id}', [ExpensesController::class, 'deleteExpense'])->name('expenses.delete');
        Route::post('/edit/expenses/{id}', [ExpensesController::class, 'editExpenses'])->name('edit.expenses');
        Route::get('/expenses/print/{id}', [ExpensesController::class, 'printExpense'])->name('expenses.print');
        Route::get('/expenses/view/{id}', [ExpensesController::class, 'viewExpenseDetail'])->name('expenses-detail-view');
        Route::get('/expenses-settings', [ExpensesController::class, 'settings'])->name('expenses.settings');
        Route::post('/store/category', [ExpensesController::class, 'storeCategory'])->name('store.category');
        Route::post('/edit/category/{id}', [ExpensesController::class, 'editCategory'])->name('update.category');
        Route::get('/expenses/delete-category/{id}', [ExpensesController::class, 'deleteCategory'])->name('expenses.delete-category');
        Route::post('/store/subcategory', [ExpensesController::class, 'storeSubCategory'])->name('store.subcategory');
        Route::post('/edit/subcategory/{id}', [ExpensesController::class, 'editSubCategory'])->name('update.subcategory');
        Route::get('/delete/subcategory/{id}', [ExpensesController::class, 'deleteSubCategory'])->name('delete.subcategory');

        Route::get('/incomes', [IncomeController::class, 'index'])->name('incomes');
        Route::get('/get-in-subcategories/{category_id}', [IncomeController::class, 'getInSubcategories'])->name('get.in.subcategories');
        Route::post('/add/income', [IncomeController::class, 'storeIncome'])->name('income.store');
        Route::get('/incomes/delete/{id}', [IncomeController::class, 'deleteIncome'])->name('incomes.delete');
        Route::post('/edit/income/{id}', [IncomeController::class, 'editIncome'])->name('incomes.update');
        Route::get('/incomes/print/{id}', [IncomeController::class, 'printIncome'])->name('incomes.print');
        Route::get('/incomes/view/{id}', [IncomeController::class, 'viewIncomeDetail'])->name('incomes-detail-view');
        Route::get('/incomes-settings', [IncomeController::class, 'settings'])->name('income.settings');
        Route::post('/store/category', [IncomeController::class, 'storeCategory'])->name('income.store.category');
        Route::post('/edit/category/{id}', [IncomeController::class, 'editCategory'])->name('income.update.category');
        Route::get('/income/delete-category/{id}', [IncomeController::class, 'deleteCategory'])->name('income.delete-category');
        Route::post('/store/subcategory', [IncomeController::class, 'storeSubCategory'])->name('income.store.subcategory');
        Route::post('/edit/subcategory/{id}', [IncomeController::class, 'editSubCategory'])->name('income.update.subcategory');
        Route::get('/delete/subcategory/{id}', [IncomeController::class, 'deleteSubCategory'])->name('income.delete.subcategory');

        Route::get('/banks', [BankController::class, 'index'])->name('accounts.banks.details');
        Route::post('/bank-store', [BankController::class, 'bankStore'])->name('accounts.store.bank');
        Route::get('/delete-bank/{id}', [BankController::class, 'deleteBank'])->name('delete.bank');
        Route::post('/edit-bank/{id}', [BankController::class, 'editBank'])->name('edit.bank');

        Route::get('/transection', [BankController::class, 'transection'])->name('money-diposit-withdraw-view');
        Route::post('/diposit-store', [BankController::class, 'storeDiposit'])->name('bank.deposit.store');
        Route::post('/withdraw-store', [BankController::class, 'storeWithdraw'])->name('bank.withdraw.store');
        Route::get('/print-transection/{id}', [BankController::class, 'printTransection'])->name('print.transection');
        Route::get('/print-total-transection', [BankController::class, 'printTotalTransection'])->name('print-total-transection');
        Route::get('/summary', [BankController::class, 'summary'])->name('total.transection.seummary');
        Route::get('/bank-transection/{id}', [BankController::class, 'bankTransection'])->name('bank-transection');
        Route::get('/print-bank-total-transection/{id}', [BankController::class, 'printBankTotalTransection'])->name('print-bank-total-transection');

        Route::get('/report', [AccountController::class, 'report'])->name('accounts.report');
    });


    // 🔹 Staff Management
    Route::prefix('staff')->group(function () {
        Route::get('/', [App\Http\Controllers\StaffController::class, 'index'])->name('staff.index');
        Route::get('/roles', [App\Http\Controllers\StaffController::class, 'roles'])->name('staff.roles');
        Route::get('/salary', [App\Http\Controllers\StaffController::class, 'salary'])->name('staff.salary');
    });


    // 🔹 Reports
    Route::prefix('reports')->group(function () {
        Route::get('/daily', [App\Http\Controllers\ReportController::class, 'daily'])->name('reports.daily');
        Route::get('/monthly', [App\Http\Controllers\ReportController::class, 'monthly'])->name('reports.monthly');
        Route::get('/financial', [App\Http\Controllers\ReportController::class, 'financial'])->name('reports.financial');
    });


});
