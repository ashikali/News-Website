<?php

namespace App\Http\View\Composers;

use Modules\Company\Entities\ProductCategory;
use Illuminate\View\View;
use Debugbar;

class FrontPageCompanyComposer {

    private $frontCompanyCategories;

    public function __construct(){

       # $this->frontCategories = cache()->remember('frontCompanyCategories',1, function () {
           $this->frontCompanyCategories =  ProductCategory::whereNull('category_id')
                ->with(['childCategories.childCategories' => function ($query) {
                    $query->with('products');
                }])
                ->get();
           # });

	
	
        foreach ($this->frontCompanyCategories as $parentCategory) {

            foreach($parentCategory->childCategories as $childcategory) {

		    foreach($childcategory->childCategories as $grandChild) {

			    $companies = Array();
			    foreach($grandChild->products as $product ) 
					$companies[] = $product->company->id;

			    $grandChild->companies_count = count(array_unique($companies)); 
			
		    }
	    }
        }

        foreach ($this->frontCompanyCategories as $parentCategory) {
            foreach($parentCategory->childCategories as $category) {
                $category->companies_count = $category->childCategories->sum('companies_count');
            }
            $parentCategory->companies_count = $parentCategory->childCategories->sum('companies_count');
        }


    }

    public function compose(View $view){

        $view->with('frontCompanyCategories', $this->frontCompanyCategories);

    }

}
