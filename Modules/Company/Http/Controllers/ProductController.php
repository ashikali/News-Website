<?php

namespace Modules\Company\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Company\Entities\ProductCategory;
use Modules\Company\Entities\ProductTag;
use Modules\Company\Entities\Product;
use Modules\Company\Entities\Company;
use Modules\Common\Http\Controllers\Traits\MediaUploadingTrait;
use Modules\Company\Http\Requests\StoreProductRequest;
use Cviebrock\EloquentSluggable\Services\SlugService;
use Spatie\MediaLibrary\Models\Media;
use Illuminate\Support\Facades\Auth;
use Validator;
use Debugbar;
use Sentinel;


class ProductController extends Controller {

    use MediaUploadingTrait;
 	
    public function index(){

       $products = Product::with(['company','categories','tags'])->paginate(15);
       return view('company::product.index',compact('products'));

    }

    public function create(){

	$categories = ProductCategory::with('parentCategory.parentCategory')
            ->whereHas('parentCategory.parentCategory')
            ->get();

        $tags = ProductTag::all()->pluck('name','id');
	
        return view('company::product.create',compact('categories','tags'));

    }

    public function store(StoreProductRequest $request){

        $product = Product::create($request->all());
        $product->categories()->sync($request->input('categories', []));
        $product->tags()->sync($request->input('tags', []));
	
	$files = explode(",",$request->input('files'));

	$id = Sentinel::getUser()->id;

	foreach($files as $in => $file)
            $product->addMedia(storage_path("tmp/uploads/{$id}/{$file}"))->toMediaCollection();

	$attributes = $request->input('attributes',[]);

	$attributes_arr = Array();
	foreach($attributes as $in => $pair){

		$key_value = explode(",",$pair);
		$attributes_arr[] = Array( "field_name" => $key_value[0],
					   "value" => $key_value[1] );
		
	}

	$product->attributes()->createMany($attributes_arr);

	return redirect()->route('mng.products.list');


    }
  	

    public function show($id){

        return view('company::show');

    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit($id){

        return view('company::edit');

    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request, $id){


    }

    /**
     * Remove the specified resource from storage.
     * @param int $id
     * @return Response
     */
    public function destroy($id){

    }
     	
    public function checkSlug(Request $request){

        $slug = SlugService::createSlug(Product::class, 'slug', $request->name);
        return response()->json(['slug' => $slug]);

    }


}
