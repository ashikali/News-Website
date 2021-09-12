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
	<a class="btn btn-light active btn-xs"
           href="{{ route('mng.product.categories.edit',[ 'productCategory'=> $productCategory->id] ) }}"><i
           class="fa fa-edit"></i>
                {{ __('edit') }}
        </a> 
    </td>

</tr>
