@extends('site.layouts.app')
@extends('site.companies.common')

@section('company_content')

<div class="row">

<div class="card my-4">

  <div class="carousel-main owl-carousel">

  @foreach( $product->getMedia() as $media) 

	<div class="item">
	  @if($media)
	  	<img class="card-img-top" src="{{basePath($media).$media->getUrl()}}" width="900px" height="523px">
	  @else
	  	<img class="card-img-top" src="http://placehold.it/900x400">
	  @endif
	</div>

  @endforeach

  </div>


  <div class="card-body">
    <h3 class="card-title">{{ $product->name }}</h3>
    <p class="card-text">{{ $product->description }}</p>
  </div>

</div>

</div>

<div class="row mt-4">

 <div class="carousel-adv owl-carousel">

  @foreach($adv_products as $aproduct)

    <div class="item">
      <div class="text-right small">sponsored</div>
      <div class="card h-100">
        <a
          href="{{ route('products.product', [
            $aproduct->categories->first()->parentCategory->parentCategory->slug,
            $aproduct->categories->first()->parentCategory->slug,
            $aproduct->categories->first()->slug,
            $aproduct->slug,
            $aproduct
          ]) }}"
        >
           @if($media = $aproduct->getFirstMedia())
                  <img class="card-img-top" src="{{basePath($media).$media->getUrl('showcase')}}" height="141px">
           @else
                  <img class="card-img-top" src="{{static_asset('default-image/default-358x215.png')}}" width="227px" height="141px">
           @endif  
        </a>
        <div class="card-body">
          <h4 class="card-title">
            <a
              href="{{ route('products.product', [
                $aproduct->categories->first()->parentCategory->parentCategory->slug,
                $aproduct->categories->first()->parentCategory->slug,
                $aproduct->categories->first()->slug,
                $aproduct->slug,
		$aproduct
              ]) }}"
            >
              {{ $aproduct->name }}
            </a>
          </h4>
          <p class="card-text">{!! Str::limit($aproduct->description, 50) !!}</p>
        </div>
      </div>
    </div>
  @endforeach
  </div>
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
        },
        autoplay: true,
        autoplayTimeout: 3500,
        nav: true,
        dots: false,
        navText: ['<span class="fas fa-chevron-left fa-2x"></span>','<span class="fas fa-chevron-right fa-2x"></span>'],
})
$('.carousel-adv').owlCarousel({
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

