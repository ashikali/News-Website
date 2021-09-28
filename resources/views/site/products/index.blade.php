@extends('site.layouts.app')
@extends('site.products.common')

@section('product_content')

<div class="row mt-4">

  @foreach($products as $product)
	
    <div class="col-lg-3 col-md-6 mb-4">
      <div class="text-right small">sponsored</div>
      <div class="card h-100">
        <a
          href="{{ route('products.product', [
            $product->categories->first()->parentCategory->parentCategory->slug,
            $product->categories->first()->parentCategory->slug,
            $product->categories->first()->slug,
            $product->slug,
            $product
          ]) }}"
        >
	   @if($media = $product->getFirstMedia())
		  <img class="card-img-top" src="{{basePath($media).$media->getUrl('showcase')}}" height="141px">
	   @else
		  <img class="card-img-top" src="{{static_asset('default-image/default-358x215.png')}}" width="227px" height="141px">
           @endif  
        </a>
        <div class="card-body">
          <h4 class="card-title">
            <a
              href="{{ route('products.product', [
                $product->categories->first()->parentCategory->parentCategory->slug,
                $product->categories->first()->parentCategory->slug,
                $product->categories->first()->slug,
                $product->slug,
                $product
              ]) }}"
            >
              {{ $product->name }}
            </a>
          </h4>
 	  <p class="card-text">{!! Str::limit($product->description, 50) !!}</p>
        </div>
      </div>
    </div>
  @endforeach

</div>

@endsection
