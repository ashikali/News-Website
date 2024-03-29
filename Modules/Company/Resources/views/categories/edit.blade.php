@extends('common::layouts.master')

@section('companies-show')
    show
@endsection

@section('products-show')
    show
@endsection

@section('products')
    active
@endsection

@section('companies_active')
    active
@endsection

@section('product_categories')
    active
@endsection



@section('content')
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <!-- page info start-->
  {!!  Form::open([ 'route' => [ 'mng.product.categories.update',$productCategory->id ] , 'method' => 'post' ]) !!}

	    @method('PUT')
            <div class="row clearfix">
                <div class="col-12">
                    @if(session('error'))
                        <div id="error_m" class="alert alert-danger">
                            {{session('error')}}
                        </div>
                    @endif
                    @if(session('success'))
                        <div id="success_m" class="alert alert-success">
                            {{session('success')}}
                        </div>
                    @endif

                    @if ($errors->any())
                        <div class="alert alert-danger">
                            <ul>
                                @foreach ($errors->all() as $error)
                                    <li>{{ $error }}</li>
                                @endforeach
                            </ul>
                        </div>
                    @endif
                </div>
                <div class="col-10">
                    <div class="add-new-page  bg-white p-20 m-b-20">

                        <div class="block-header">
                            <div class="form-group">
                                <h4 class="border-bottom">{{ __('update_product_category') }}</h4>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
				<label class="required" for="name">{{ __('name') }}</label>
				<input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" type="text" name="name" 
					id="name" value="{{$productCategory->name}}">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
				<label for="description">{{ __('description') }}</label>
				<textarea class="form-control {{ $errors->has('description') ? 'is-invalid' : '' }}" 
					  name="description" id="description">{{ $productCategory->description }}</textarea>
	
                            </div>
                        </div>
			<div class="col-sm-12">
                              <div class="form-group">
					<label class="required" for="slug">{{ __('slug') }}</label>
					<input class="form-control {{ $errors->has('slug') ? 'is-invalid' : '' }}" 
					       type="text" name="slug" id="slug" value="{{$productCategory->slug}}">
			      </div>
			</div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group form-float form-group-sm">
                                    <button type="submit" class="btn btn-primary float-right m-t-20"><i
                                            class="fa fa-paper-plane"
                                            aria-hidden="true"></i> {{ __('edit') }}</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        {{ Form::close() }}
        <!-- page info end-->
        </div>
    </div>

@endsection

@push('include_js')
<script>
$('#name').change(function(e) {
    $.get('{{ route('mng.product.categories.checkSlug') }}',
        { 'name': $(this).val() },
        function( data ) {
            $('#slug').val(data.slug);
        }
    );
});
</script>
@endpush

