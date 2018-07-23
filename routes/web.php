<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/
//Route::get('{any}', function () {
//    return view('welcome');
//})->where('any', '.*');


Route::Auth();
Route::get('/','AdminController@index');
Route::get('/map','MapController@index');

Route::prefix('item')->group(function () {
    Route::get('list', 'ItemController@index');
    Route::get('create/', 'ItemController@create');
    Route::post('change_form', 'ItemController@changeForm');
    Route::post('add_info', 'ItemController@addInfo');
    Route::post('remove_item_price', 'ItemController@removeItemPrice');
    Route::post('edit_item_price', 'ItemController@editItemPrice');
});

