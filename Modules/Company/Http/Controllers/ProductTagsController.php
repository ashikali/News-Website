<?php

namespace Modules\Company\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Company\Entities\ProductTag;
 

class ProductTagsController extends Controller
{
    /**
     * Display a listing of the resource.
     * @return Response
     */
    public function index(){

	$product_tags = ProductTag::orderBy('id', 'desc')->paginate(15);
        return view('company::product_tags.index',compact('product_tags'));

    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create(){

        return view('company::product_tags.create');

    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request){

	   if( ProductTag::create($request->input()))
	      $withMsg = [ 'success',__('Created Successfully') ];
       	   else
              $withMsg = [ 'error',__('Creation Failed') ];

       	   return redirect()->route('mng.product_tags.list')->with($withMsg[0],$withMsg[1]);
    }


    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit(ProductTag $productTag){

        return view('company::product_tags.edit',compact("productTag"));

    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request,ProductTag $productTag){


	   if($productTag->update($request->input()))
	      $withMsg = [ 'success',__('Updated Successfully') ];
       	   else
              $withMsg = [ 'error',__('Updation Failed') ];

       	   return redirect()->route('mng.product_tags.list')->with($withMsg[0],$withMsg[1]);
    }

}
