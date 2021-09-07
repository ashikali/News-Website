<?php

namespace Modules\Company\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class MassDestroyProductCategoryRequest extends FormRequest {

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules(){

	return [
            'ids'   => 'required|array',
            'ids.*' => 'exists:product_categories,id',
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
