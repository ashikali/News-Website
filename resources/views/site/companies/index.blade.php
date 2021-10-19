@extends('site.layouts.app')
@extends('site.companies.common')

@section('company_content')

<div class="row mt-4">
    
@foreach($companies as $company)

    <div class="col-lg-3 col-md-6 mb-4">
      <div class="card h-100">
        <a
          href="{{ route('companies.company', [
            $company->products->first()->categories->first()->parentCategory->parentCategory->slug,
            $company->products->first()->categories->first()->parentCategory->slug,
            $company->products->first()->categories->first()->slug,
            $company->slug,
            $company
          ]) }}"
        >

	@if($company->profile_image != null)
             <img src=" {{static_asset($company->profile_image)}}" id="profile-img" class="img-fluid"   >
        @else
             <img src="{{static_asset('default-image/default.jpg') }}"   id="profile-img" class="img-fluid">
        @endif 
        </a>
        <div class="card-body">
          <h4 class="card-title">
        	<a
        	  href="{{ route('companies.company', [
        	    $company->products->first()->categories->first()->parentCategory->parentCategory->slug,
        	    $company->products->first()->categories->first()->parentCategory->slug,
        	    $company->products->first()->categories->first()->slug,
        	    $company->slug,
        	    $company
        	  ]) }}"
        	>
                {{ $company->name }}
            </a>
	   </h4>
          <p class="card-text">{!! Str::limit($company->additional_info, 50) !!}</p>
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

