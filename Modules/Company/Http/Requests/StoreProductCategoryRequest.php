<?php

namespace Modules\Company\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductCategoryRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(){

	/*
        return [
            'name'      => 'required|unique:product_categories|string',
            'category_id'    => 'sometimes|integer',
	]; */

	return [
            'name' => [
                'required'],
	    'category_id' => [ 'sometimes','integer' ],
            'slug' => [
                'required',
                'unique:product_categories'],
        ];
 
    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */

    public function authorize(){

        return true;


    }


}
