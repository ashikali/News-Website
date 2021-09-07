 <tr role="row" id="row_{{ $productCategory->id }}" class="odd">

    <td class="sorting_1">
        {{ $productCategory->id }}
    </td>
    <td>
        {{ $prefix ?? '' }} {{ $productCategory->name ?? '' }}
    </td>
    <td>
        {{ $productCategory->description ?? '' }}
    </td>
    <td>
        {{ $productCategory->parentCategory->name ?? '' }}
    </td>
    <td>
        {{ $productCategory->slug ?? '' }}
    </td>
    <td>
	<div class="dropdown">
             <button class="btn bg-primary dropdown-toggle btn-select-option"
                     type="button" data-toggle="dropdown">... <span
                     class="caret"></span>
             </button>
             <ul class="dropdown-menu options-dropdown">

                <li>
                <a href="{{route('mng.product.categories.edit',[$productCategory->id])}}">
                         <i class="fa fa-edit option-icon"></i>{{ __('edit') }}
                </a>
                </li>
             </ul>
         </div>
    </td>

</tr>
