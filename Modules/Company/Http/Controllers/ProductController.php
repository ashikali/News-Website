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
use Modules\Company\Http\Requests\UpdateProductRequest;
use Cviebrock\EloquentSluggable\Services\SlugService;
use Spatie\MediaLibrary\Models\Media;
use Illuminate\Support\Facades\Auth;
use Validator;
use Debugbar;
use Sentinel;
use File;


class ProductController extends Controller {

    use MediaUploadingTrait;
 	
    public function index(){

       $products = Product::with(['company','categories','tags'])->paginate(15);

       return view('company::product.index',compact('products'));

    }

    public function create(){

	$categories = ProductCategory::has('parentCategory.parentCategory')->get();
        $tags = ProductTag::all()->pluck('name','id');
	$flags = Product::selectFlags();
        return view('company::product.create',compact('categories','tags','flags'));

    }

    public function store(StoreProductRequest $request){

        $product = Product::create($request->all());
        $product->categories()->sync($request->input('categories', []));
        $product->tags()->sync($request->input('tags', []));
	
	$files = explode(",",$request->input('files'));

	$id = Sentinel::getUser()->id;

	$path = storage_path("tmp/uploads/{$id}");
	foreach($files as $in => $file){
            $product->addMedia($path.'/'.$file)->toMediaCollection();
	    File::delete("tmp/uploads/{$id}/{$file}");
	}

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
    public function edit(Product $product){

	$items = $product->getMedia();$images = [];

	foreach($items as $in => $item){

		$images[] = Array( "name" => $item->file_name,
			      "url" => basePath($item).$item->getUrl(),
			      "thumb" => basePath($item).$item->getUrl('showcase'),
			      "size" =>  $item->size,
	       	);
			 
	}
	$categories = ProductCategory::has('parentCategory.parentCategory')
        	      ->get();
        $tags = ProductTag::all()->pluck('name','id');
	$flags = Product::selectFlags();

	return view('company::product.edit',compact('product','tags','flags','categories','images')); 

    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(UpdateProductRequest $request,Product $product){


        $product->update($request->all());
        $product->categories()->sync($request->input('categories', []));
        $product->tags()->sync($request->input('tags', []));

	$id = Sentinel::getUser()->id;

	$files = explode(",",$request->input('files'));
	foreach($files as $in => $file){
	    if(!empty($file)){
            	$product->addMedia(storage_path("tmp/uploads/{$id}/{$file}"))->toMediaCollection();
		File::delete("tmp/uploads/{$id}/{$file}");
	    }
	}

	//delete any removed files 
	if($request->has('dfiles')){
		$dfiles = $request->input('dfiles');
		foreach($dfiles as $in => $file){ //deleted server files
		     $media = $product->getMedia()->where('file_name',$file)->first();
		     $media->delete();
		}
	}

	$attributes = $request->input('attributes',[]);

	$attributes_arr = Array();
	foreach($attributes as $in => $pair){

		$key_value = explode(",",$pair);
		$attributes_arr[] = Array( "field_name" => $key_value[0],
					   "value" => $key_value[1] );
		
	}

	$product->attributes()->delete();
	$product->attributes()->createMany($attributes_arr);

	return redirect()->route('mng.products.list');


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
