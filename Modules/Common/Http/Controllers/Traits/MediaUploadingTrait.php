<?php

namespace Modules\Common\Http\Controllers\Traits;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Validator;
use Sentinel;


trait MediaUploadingTrait
{
    public function storeMedia(Request $request){


	 Validator::make($request->all(), [
            'file.*'         => 'required|max:5120|mimes:jpg,JPG,JPEG,jpeg,gif,png,ico',
         ])->validate(); 


        $path = storage_path("tmp/uploads/".Sentinel::getUser()->id);

        try {
            if (!file_exists($path)) {
                mkdir($path, 0755, true);
            }
        } catch (\Exception $e) {
		
        }

	$names = Array();
	foreach($request->file('file') as $file ){
        	$name = uniqid() . '_' . trim($file->getClientOriginalName());
        	$file->move($path, $name);
		$names[] = $name;
		
	}

        return response()->json([
            'files'          => $names
        ]);


    }

}
