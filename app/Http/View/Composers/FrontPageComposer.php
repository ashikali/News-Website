<?php

namespace App\Http\View\Composers;

use Modules\Company\Entities\ProductCategory;
use Illuminate\View\View;
use Debugbar;

class FrontPageComposer
{
    private $frontCategories;

    public function __construct(){

       # $this->frontCategories = cache()->remember('frontCategories',1, function () {
           $this->frontCategories =  ProductCategory::whereNull('category_id')
                ->with(['childCategories.childCategories' => function ($query) {
                    $query->withCount('products');
                }])
                ->get();
           # });

        foreach ($this->frontCategories as $parentCategory) {
            foreach($parentCategory->childCategories as $category) {
                $category->products_count = $category->childCategories->sum('products_count');
            }
            $parentCategory->products_count = $parentCategory->childCategories->sum('products_count');
        }


    }

    public function compose(View $view){

        $view->with('frontCategories', $this->frontCategories);

    }

}
