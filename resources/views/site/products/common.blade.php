@section('content')

<div class="container mb-3">

  <div class="row">

    <div class="col-lg-3">

	@include('site.products.left-side-bar')

    </div>
    <div class="col-lg-9">

	 @yield('product_content')

    </div>

  </div>

</div>

@endsection

