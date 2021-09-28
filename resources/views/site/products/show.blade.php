@extends('site.layouts.app')
@extends('site.products.common')

@section('product_content')

<div class="row mt-4">

<div class="card my-4">
  @if($media = $product->getFirstMedia())
  	<img class="card-img-top" src="{{basePath($media).$media->getUrl()}}" width="900px" height="523px">
  @else
  	<img class="card-img-top" src="http://placehold.it/900x400">
  @endif
  <div class="card-body">
    <h3 class="card-title">{{ $product->name }}</h3>
    <p class="card-text">{{ $product->description }}</p>
  </div>

</div>

</div>

@endsection
