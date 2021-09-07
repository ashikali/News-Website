<?php

namespace Modules\Company\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Http\Response;
use Illuminate\Routing\Controller;
use Modules\Company\Entities\Company;
use Modules\Company\Entities\Address;
use PragmaRX\Countries\Package\Countries;
use Modules\Language\Entities\Language;
use Carbon\Carbon;
use Validator;
use Image;
use Debugbar;
use Sentinel;

class AddressController extends Controller {

    /**
     * Display a listing of the resource.
     * @return Response
     */

    public function index(){

	$addresses   = Address::with('company')->orderBy('id', 'desc')->paginate(15);
	return view('company::address.index',[ 'addresses' => $addresses ]);

    }

    /**
     * Show the form for creating a new resource.
     * @return Response
     */
    public function create(){

	$countries      = Countries::all();
        $activeLang     = Language::where('status', 'active')->orderBy('name', 'ASC')->get();
        return view('company::address.create',[ 'countries'  => $countries,
                			        'activeLang' => $activeLang ]);

    }

    /**
     * Store a newly created resource in storage.
     * @param Request $request
     * @return Response
     */
    public function store(Request $request){

	Validator::make($request->all(), [
            'company_id'      => 'required|integer',
            'full_address'    => 'required',
            'city'    => 'required',
	    'state'   => 'required',
	    'country' => 'required'
        ])->validate();

	Address::create($request->except('_token'));
	
        return redirect()->route('mng.addresses.list')->with('success',__('successfully_added'));

    }

    /**
     * Show the form for editing the specified resource.
     * @param int $id
     * @return Response
     */
    public function edit(Address $address){

	$countries      = Countries::all();
        $activeLang     = Language::where('status', 'active')->orderBy('name', 'ASC')->get();
	return view('company::address.edit',[ 'address' => $address,
					      'countries'  => $countries,
                			      'activeLang' => $activeLang ]);

    }

    /**
     * Update the specified resource in storage.
     * @param Request $request
     * @param int $id
     * @return Response
     */
    public function update(Request $request,$id){


	Validator::make($request->all(), [
            'full_address'    => 'required',
            'city'    => 'required',
	    'state'   => 'required',
	    'country' => 'required'
        ])->validate();

	$company = Address::find($id);

	$company->full_address = $request->full_address;
	$company->city = $request->city;
	$company->state = $request->state;
	$company->country = $request->country;
	$company->update();

        return redirect()->route('mng.addresses.list')->with('success',__('successfully_updated'));

    }


}
