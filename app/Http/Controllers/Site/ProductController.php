<?php

namespace App\Http\Controllers\Site;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Modules\Company\Entities\Product;
use Modules\Company\Entities\ProductCategory;
use Debugbar;


class ProductController extends Controller {

 public function index(){

        $products = Product::with('categories.parentCategory.parentCategory')
		    ->where('flag','Normal')
            	    ->inRandomOrder()
            	    ->take(16)
            	    ->get();

	$sponsored = Product::with('categories.parentCategory.parentCategory')
		    ->where('flag','Sponsored')
            	    ->inRandomOrder()
            	    ->take(12)
            	    ->get();

        return view('site.products.index', compact('products','sponsored'));

 }	

 public function category(ProductCategory $category, ProductCategory $childCategory = null, $childCategory2 = null){


        $products = null;
        $ids = collect();
        $selectedCategories = [];

        if ($childCategory2) {
            $subCategory = $childCategory->childCategories()->where('slug', $childCategory2)->firstOrFail();
            $ids = collect($subCategory->id);
            $selectedCategories = [$category->id, $childCategory->id, $subCategory->id];
        } elseif ($childCategory) {
            $ids = $childCategory->childCategories->pluck('id');
            $selectedCategories = [$category->id, $childCategory->id];
        } elseif ($category) {
            $category->load('childCategories.childCategories');
            $ids = collect();
            $selectedCategories[] = $category->id;

            foreach ($category->childCategories as $subCategory) {
                $ids = $ids->merge($subCategory->childCategories->pluck('id'));
            }
        }

        $products = Product::whereHas('categories', function ($query) use ($ids) {
                $query->whereIn('id', $ids)->where('flag','Normal');
            })
            ->with('categories.parentCategory.parentCategory')->get();


        $sponsored = Product::whereHas('categories', function ($query) use ($ids) {
                $query->whereIn('id', $ids)->where('flag','Sponsored');
            })
            ->with('categories.parentCategory.parentCategory')->get();

        return view('site.products.index', compact('products', 'sponsored','selectedCategories'));


    }

    public function product($category, $childCategory, $childCategory2, $productSlug, Product $product){

        $product->load('categories.parentCategory.parentCategory');
        $childCategory2 = $product->categories->where('slug', $childCategory2)->first();
        $selectedCategories = [];

        if ($childCategory2 &&
            $childCategory2->parentCategory &&
            $childCategory2->parentCategory->parentCategory
        ) {
            $selectedCategories = [
                $childCategory2->parentCategory->parentCategory->id ?? null,
                $childCategory2->parentCategory->id ?? null,
                $childCategory2->id
            ];
        }

        $ids = $product->categories->pluck('id');
        $adv_products = Product::whereHas('categories', function ($query) use ($ids) {
                $query->whereIn('id', $ids)->where('flag','Advertisment');
            })->with('categories.parentCategory.parentCategory')->get();

	Debugbar::info(count($adv_products));

        return view('site.products.show', compact('product','adv_products','selectedCategories'));
    }
   


}
