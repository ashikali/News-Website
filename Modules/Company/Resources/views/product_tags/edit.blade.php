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

@section('product_tags')
    active
@endsection



@section('content')
    <div class="dashboard-ecommerce">
        <div class="container-fluid dashboard-content ">
            <!-- page info start-->
            {!!  Form::open([ 'route' => [ 'mng.product_tags.update', ["productTag" => $productTag->id ]  ], 'method' => 'post' ]) !!}

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
                                <h4 class="border-bottom">{{ __('Create Product Tag') }}</h4>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
				<label class="required" for="name">{{ __('name') }}</label>
				<input class="form-control {{ $errors->has('name') ? 'is-invalid' : '' }}" type="text" name="name" 
					id="name" value="{{$productTag->name}}" required>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">
                                <div class="form-group form-float form-group-sm">
                                    <button type="submit" class="btn btn-primary float-right m-t-20"><i
                                            class="fa fa-paper-plane"
                                            aria-hidden="true"></i> {{ __('update') }}</button>
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

