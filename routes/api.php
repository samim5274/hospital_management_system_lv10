<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Admin\AdminController;
use \App\Http\Controllers\Api\Outdoor\OutdoorController;

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});


Route::get('/users/{id?}', [AdminController::class, 'index']);
Route::post('/create/user', [AdminController::class, 'store']);
Route::put('/update/user/{id}', [AdminController::class, 'update']);
Route::delete('/delete/user/{id}', [AdminController::class, 'destroy']);

Route::post('/outdoor/store/test', [OutdoorController::class, 'storeTest']);
Route::delete('/outdoor/delete/test/{id}', [OutdoorController::class, 'deleteTest']);
Route::post('/outdoor/tests/sales', [OutdoorController::class, 'testSales']);