@extends('site.layouts.app')
@extends('site.products.common')

@section('product_content')

<div class="row mt-4">
    
  <div class="carousel-main owl-carousel mb-2">

  @foreach($sponsored as $product)
	
    <div class="item">
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

@foreach($products as $product)

    <div class="col-lg-3 col-md-6 mb-4">
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

@section('quiz')
<script type="text/javascript">
$('.carousel-main').owlCarousel({
        loop: true,
        responsive: {
            0:{
                items:1
            },
            480:{
                items:1
            },
            576:{
                items:2
            },
            768:{
                items:4
            },
            1000:{
                items:4
            },
            1100:{
                items:4
            }
        },
        autoplay: true,
        autoplayTimeout: 3500,
        margin: 10,
        nav: true,
        dots: false,
        navText: ['<span class="fas fa-chevron-left fa-2x"></span>','<span class="fas fa-chevron-right fa-2x"></span>'],
})
</script>
@endsection

@section('style')
<link rel='stylesheet' href='https://use.fontawesome.com/releases/v5.0.8/css/all.css'>
<link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.1/assets/owl.carousel.css'>
@endsection

@push('script')
<script src='https://cdnjs.cloudflare.com/ajax/libs/OwlCarousel2/2.3.1/owl.carousel.min.js'></script>
@endpush

