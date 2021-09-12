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
            <form action="#" method="post">
                <div class="admin-section">
                    <div class="row clearfix m-t-30">
                        <div class="col-12">
                            <div class="navigation-list bg-white p-20">
                                <div class="add-new-header clearfix m-b-20">
				     
				                    <div class="row">
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
                                    </div>

                                    <div class="row">
                                        <div class="col-6">
                                            <div class="block-header">
                                                <h2>{{ __('Product Tags') }}</h2>
                                            </div>
                                        </div>
                                    </div>
				   <div class="row">
					<div class="col-12 text-right">
						 <a href="{{route('mng.product_tags.create')}}" class="btn btn-primary btn-sm"><i
                                                   class="m-r-10 mdi mdi-plus"></i>{{__('Create Product Tag')}}</a>
                                        </div>
                                   </div>
                                </div>
                                <div class="table-responsive all-pages">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <tr role="row">
                                            <th>#</th>
                                            <th>{{ __('name') }}</th>
					    <th>{{__('created_at')}}</th>
					    <th>{{__('Updated At')}}</th>
					    <th>{{__('Options')}}</th>
                                        </tr>
                                        </thead>
                                        <tbody>

					@foreach($product_tags as $in => $product_tag)
					 <tr role="row" id="row_{{ $product_tag->id }}" class="odd">
					     <td>{{$product_tags->firstItem()+$in}}</td>
					     <td>{{$product_tag->name}}</td>
                          		     <td>{{ Carbon\Carbon::parse($product_tag->created_at)->diffforHumans() }}</td>
                          		     <td>{{ Carbon\Carbon::parse($product_tag->updated_at)->diffforHumans() }}</td>
					     <td>
				       <a class="btn btn-light active btn-xs"
				          href="{{ route('mng.product_tags.edit',[ 'productTag'=> $product_tag->id ] ) }}"><i
					           class="fa fa-edit"></i>
					                {{ __('edit') }}
					        </a>
					    </td>
 
					 </tr>
					@endforeach
	
                                        </tbody>
                                    </table>
                                </div>
			        <div class="row">
                                    <div class="col-12 col-sm-6">
                                        <div class="block-header">
                                            <h2>{{ __('Showing') }} {{ $product_tags->firstItem()}} {{  __('to') }} {{ $product_tags->lastItem()}} {{ __('of') }} {{ $product_tags->total()}} {{ __('entries') }}</h2>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6 text-right">
                                        <div class="table-info-pagination float-right">
                                            {!! $product_tags->render() !!}
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
            <!-- page info end-->
        </div>
    </div>

@endsection
