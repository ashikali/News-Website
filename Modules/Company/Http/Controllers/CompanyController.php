<?php

namespace Modules\Company\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Company\Entities\Company;
use Cviebrock\EloquentSluggable\Services\SlugService;
use Carbon\Carbon;
use Validator;
use Image;
use Sentinel;

class CompanyController extends Controller {

    /**
     * Display a listing of the resource.
     * @return Response
     */

    public function index(){

        $companies   = Company::orderBy('id', 'desc')->paginate(15);
        return view('company::company.index',compact('companies'));

    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create(){

        return view('company::company.create');

    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request){


        $regex = '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';

	Validator::make($request->all(), [
            'name'            => 'required',
            'website'         => "required|regex:{$regex}",
            'profile_image'         => 'sometimes|mimes:jpg,JPG,JPEG,jpeg,gif,png,ico|max:5120',
        ])->validate();

	$company = new Company();
	
	$image = $request->file('profile_image');

        if(isset($image)):
		//make unique name for image
                $currentDate = Carbon::now()->toDateString();
                $imageName  = $request->first_name.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

                if (strpos(php_sapi_name(), 'cli') !== false  || defined('LARAVEL_START_FROM_PUBLIC')) :

                    $directory              = 'images/';
                else:
                    $directory              = 'public/images/';
                endif;

                $profileImgUrl             = $directory . $imageName;

                if (strpos(php_sapi_name(), 'cli') !== false || defined('LARAVEL_START_FROM_PUBLIC')) {
                    $path = '';
                }else{
                    $path = 'public/';
                }

                Image::make($image)->fit(260, 200)->save($profileImgUrl);

                $company->profile_image    = str_replace("public/","",$profileImgUrl);
	endif;

	$company->user_id = Sentinel::getUser()->id;
	$company->name = $request->name;
	$company->website = $request->website;
	$company->additional_info = $request->additional_info;
	$response = $company->save();
	
        return redirect()->back()->with('success',__('successfully_added'));
 


    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit(Company $company){

        return view('company::company.edit',compact('company'));

    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request,Company $company){


        $regex = '/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/';

	Validator::make($request->all(), [
            'name'            => 'required',
            'website'         => "required|regex:{$regex}",
            'profile_image'         => 'sometimes|mimes:jpg,JPG,JPEG,jpeg,gif,png,ico|max:5120',
        ])->validate();

	$image = $request->file('profile_image');

        if(isset($image)):
		//make unique name for image
                $currentDate = Carbon::now()->toDateString();
                $imageName  = $request->first_name.'-'.$currentDate.'-'.uniqid().'.'.$image->getClientOriginalExtension();

                if (strpos(php_sapi_name(), 'cli') !== false  || defined('LARAVEL_START_FROM_PUBLIC')) :

                    $directory              = 'images/';
                else:
                    $directory              = 'public/images/';
                endif;

                $profileImgUrl             = $directory . $imageName;

                if (strpos(php_sapi_name(), 'cli') !== false || defined('LARAVEL_START_FROM_PUBLIC')) {
                    $path = '';
                }else{
                    $path = 'public/';
                }

                Image::make($image)->fit(260, 200)->save($profileImgUrl);

                $company->profile_image    = str_replace("public/","",$profileImgUrl);
	endif;

	$company->user_id = Sentinel::getUser()->id;
	$company->name = $request->name;
	$company->website = $request->website;
	$company->additional_info = $request->additional_info;
	$company->is_active = $request->is_active;
	$response = $company->update();
	

        return redirect()->route('mng.companies.list')->with('success',__('successfully_updated'));

    }

    public function searchCompany(Request $request){

        $post       = Company::select('id', 'name as text');

        if ($search = $request->get('search')) :
            $post->where('name', 'like', '%' . $search . '%');
        endif;

        $posts      = $post->take(10)->get()->toArray();

        return response()->json($posts);

    }


     public function checkSlug(Request $request){

        $slug = SlugService::createSlug(Company::class, 'slug', $request->name);
        return response()->json(['slug' => $slug]);

    }
 	
  


}
