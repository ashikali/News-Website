<?php

namespace Modules\Company\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductRequest extends FormRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {

	 return [
            'categories.*' => [
                'integer'],
            'categories'   => [
                'array'],
            'tags.*'       => [
                'integer'],
            'tags'         => [
                'array'],
            'slug'         => [
                'required',
                'unique:products,slug,' . request()->route('product')->id ],
        ];
 


    }

    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }
}
