<?php

namespace Modules\Company\Http\Controllers;


use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Company\Entities\ProductCategory;
use Modules\Company\Http\Requests\StoreProductCategoryRequest;
use Modules\Company\Http\Requests\MassDestroyProductCategoryRequest;
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
       $productCategory = ProductCategory::create($inputs);
       return redirect()->route('mng.product.categories.list');

    }

    public function edit($id){

        return view('company::categories.edit');

    }

    public function update(Request $request, $id){

    }

    public function destroy($id){

    }

    public function checkSlug(Request $request){

        $slug = SlugService::createSlug(ProductCategory::class, 'slug', $request->name);
        return response()->json(['slug' => $slug]);

    }
    public function massDestroy(MassDestroyProductCategoryRequest $request){

        ProductCategory::whereIn('id', request('ids'))->delete();
        return response(null, Response::HTTP_NO_CONTENT);

    }

  

}
