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
            {!!  Form::open([ 'route' => 'mng.product.categories.store', 'method' => 'post' ]) !!}

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
                                <h4 class="border-bottom">{{ __('Create Product Category') }}</h4>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
				<label class="required" for="name">{{ __('name') }}</label>
				<input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" type="text" name="name" 
					id="name" value="{{ old('name', '') }}" required>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
				<label for="description">{{ __('description') }}</label>
				<textarea class="form-control {{ $errors->has('description') ? 'is-invalid' : '' }}" 
					  name="description" id="description">{{ old('description') }}</textarea>
	
                            </div>
                        </div>
			<div class="col-sm-12">
                              <div class="form-group">
                                  <label for="country" class="col-form-label">{{ __('categories') }}</label>
				   <select class="form-control select2 {{ $errors->has('category') ? 'is-invalid' : '' }}" 
					   name="category_id" id="category_id">
                   		   <option value="">{{ __('please_select') }}</option>
                   		   @foreach($categories as $category)
                   		       <option value="{{ $category->id }}" {{ old('category_id') == $category->id ? 'selected' : '' }}>{{ $category->name }}</option>
                   		       @foreach($category->childCategories as $childCategory)
                   		           <option value="{{ $childCategory->id }}" {{ old('category_id') == $childCategory->id ? 'selected' : '' }}>-- {{ $childCategory->name }}</option>
                   		       @endforeach
                   		  @endforeach
                		  </select>  
                              </div>
                        </div>
			<div class="col-sm-12">
                              <div class="form-group">
					<label class="required" for="slug">{{ __('slug') }}</label>
					<input class="form-control {{ $errors->has('slug') ? 'is-invalid' : '' }}" 
					       type="text" name="slug" id="slug" value="{{ old('slug', '') }}" required>
			      </div>
			</div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group form-float form-group-sm">
                                    <button type="submit" class="btn btn-primary float-right m-t-20"><i
                                            class="fa fa-paper-plane"
                                            aria-hidden="true"></i> {{ __('create') }}</button>
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

