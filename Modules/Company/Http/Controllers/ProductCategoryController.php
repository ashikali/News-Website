<?php

namespace Modules\Company\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Company\Entities\ProductCategory;
use Modules\Company\Http\Requests\StoreProductCategoryRequest;
use Modules\Company\Http\Requests\MassDestroyProductCategoryRequest;
use Modules\Company\Http\Requests\UpdateProductCategoryRequest;
use Cviebrock\EloquentSluggable\Services\SlugService;
use Validator;
use Debugbar;


class ProductCategoryController extends Controller {

 
    public function index(){

	 $productCategories = ProductCategory::whereNull('category_id')
            ->with('childCategories.childCategories')
            ->get();
         return view('company::categories.index', compact('productCategories'));

    }

    public function create(){

	$categories = ProductCategory::whereNull('category_id')
            ->with('childCategories')
            ->get();
 
        return view('company::categories.create',compact('categories'));

    }

    public function store(StoreProductCategoryRequest $request){

       $inputs = array_filter($request->all(), 'strlen'); //convert empty to null

       if(ProductCategory::create($inputs))
	      $withMsg = [ 'success',__('Created Successfully') ];
       else 
       	      $withMsg = [ 'error',__('Creation Failed') ];


       return redirect()->route('mng.product.categories.list')->with($withMsg[0],$withMsg[1]);

    }

    public function edit(ProductCategory $productCategory){

        return view('company::categories.edit', compact('productCategory'));
    }


    public function update(UpdateProductCategoryRequest $request,ProductCategory $productCategory){

	  if($productCategory->update($request->all()))
	      $withMsg = [ 'success',__('Updated Successfully') ];
	  else 
       	      $withMsg = [ 'error',__('Updation Failed') ];

	  return redirect()->route('mng.product.categories.list')->with($withMsg[0],$withMsg[1]);

    }

    public function checkSlug(Request $request){

        $slug = SlugService::createSlug(ProductCategory::class, 'slug', $request->name);
        return response()->json(['slug' => $slug]);

    }


}
