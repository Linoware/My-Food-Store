<?php

use Illuminate\Http\Request;

Route::group(['prefix' => 'auth'], function ($router) {

    Route::post('register', 'CustomerController@customerRegister');
    Route::post('login', 'CustomerController@customerLogin');
    Route::post('logout', 'CustomerController@customerLogout');
    Route::post('re_login', 'CustomerController@reLogin');

});

Route::resource('customers', 'CustomerController');
