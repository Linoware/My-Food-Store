<?php

use Illuminate\Http\Request;

Route::group(['prefix' => 'auth'], function ($router) {

    Route::post('register', 'CustomerController@customerRegister');
    Route::post('login', 'CustomerController@customerLogin');
    Route::post('logout', 'CustomerController@customerLogout');
    Route::post('re_login', 'CustomerController@reLogin');

    
});

Route::post('update_customer_profiles', 'CustomerController@updateCustomerProfiles');
Route::post('upload_image', 'UploadImageController@uploadImage');
Route::get('home', 'HomeController@index');

Route::resource('customers', 'CustomerController');

// Order api
Route::post('customer_create_order', 'OrderController@create');

// Item api
Route::group(['prefix' => 'item'], function($router){
   Route::post('view/{id}', 'ItemController@show');
});
