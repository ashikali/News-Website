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
Route::group(
    [
        'prefix' => LaravelLocalization::setLocale().'mng',
	'middleware' => ['localeSessionRedirect', 'localizationRedirect', 'localeViewPath', 
						'isInstalledCheck','loginCheck','XSS','permissionCheck:companies_write' ]
    ],
    function () {

	     Route::group( [ 'prefix' => 'companies','as' => 'mng.companies.' ],function() {
    	     	Route::get('/', 'CompanyController@index')->name('list');
    	     	Route::get('/create', 'CompanyController@create')->name('create');
    	     	Route::post('/store', 'CompanyController@store')->name('store');
    	     	Route::get('/edit/{company}', 'CompanyController@edit')->name('edit');
    	     	Route::post('/update/{company}', 'CompanyController@update')->name('update');
             	Route::get('/search/company', 'CompanyController@searchCompany')->name('search');
    	     });

	     Route::group( [ 'prefix' => 'addresses','as' => 'mng.addresses.' ],function() {
    	     	Route::get('/', 'AddressController@index')->name('list');
    	     	Route::get('/create', 'AddressController@create')->name('create');
    	     	Route::post('/store', 'AddressController@store')->name('store');
    	     	Route::get('/edit/{address}', 'AddressController@edit')->name('edit');
    	     	Route::post('/update/{id}', 'AddressController@update')->name('update');
    	     });

	     Route::group( [ 'prefix' => 'products','as' => 'mng.products.' ],function() {
    	     	Route::get('/', 'ProductController@index')->name('list');
	     });

	     Route::group( [ 'prefix' => 'product_tags','as' => 'mng.product_tags.' ],function() {
    	     	Route::get('/', 'ProductTagsController@index')->name('list');
	     });

	     Route::group( [ 'prefix' => 'categories','as' => 'mng.product.categories.' ],function() {
    	     	Route::get('/', 'ProductCategoryController@index')->name('list');
    	     	Route::get('/create', 'ProductCategoryController@create')->name('create');
    	     	Route::post('/store', 'ProductCategoryController@store')->name('store');
		Route::get('/edit','ProductCategoryController@edit')->name('edit');
		Route::delete('/delete/{id}','ProductCategoryController@destroy')->name('destroy');
             	Route::get('/check-slug', 'ProductCategoryController@checkSlug')->name('checkSlug');
	        Route::delete('product-categories/destroy', 'ProductCategoryController@massDestroy')->name('massDestroy');
 
	     });



 });
