<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Company\Entities\Company;

class CompanyController extends Controller{

	
    public function index(){

	   $companies = Company::has('products.categories.parentCategory.parentCategory')
				  ->inRandomOrder()
			          ->get();
	
           return view('site.companies.index', compact('companies'));
 
    }


}
