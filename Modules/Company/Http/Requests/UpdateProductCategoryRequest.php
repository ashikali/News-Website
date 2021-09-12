<?php

namespace Modules\Company\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductCategoryRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(){


	 return [
            'name' => [
                'required'],
            'category_id' => [ 'sometimes','integer' ],
            'slug' => [
                'required',
                'unique:product_categories,slug,'.$this->productCategory->id ]
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
