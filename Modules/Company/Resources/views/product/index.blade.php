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
                                                <h2>{{ __('Products') }}</h2>
                                            </div>
                                        </div>
                                    </div>
				   <div class="row">
					<div class="col-12 text-right">
						 <a href="{{route('mng.products.create')}}" class="btn btn-primary btn-sm"><i
                                                   class="m-r-10 mdi mdi-plus"></i>{{__('Add_Product')}}</a>
                                        </div>
                                   </div>
                                </div>
                                <div class="table-responsive all-pages">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <tr role="row">
                                            <th>#</th>
                                            <th>{{ __('Product Name') }}</th>
                                            <th>{{ __('Company Name') }}</th>
                                            <th>{{ __('Categories') }}</th>
                                            <th>{{ __('Tags') }}</th>
                                            <th>{{ __('Photo') }}</th>
                                            <th>{{ __('Slug') }}</th>
                                            <th>{{ __('created_at') }}</th>
					    @if(Sentinel::getUser()->hasAccess(['companies_delete']) || 
							Sentinel::getUser()->hasAccess(['companies_write']))
                                                <th>{{ __('options') }}</th>
                                            @endif
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($products as $product)
                                            <tr role="row" id="row_{{ $product->id }}" class="odd">
                                                <td class="sorting_1">{{ $product->id }}</td>
                                                <td>{{ $product->name }}</td>
						<td>{{ $product->company->name }}</td>
						<td>
						  @foreach($product->categories as $key => $item)
                                    		  <span class="badge badge-info">{{ $item->name }}</span>
                                		  @endforeach
						</td>
						<td>
                         			  @foreach($product->tags as $key => $item)
                         			           <span class="badge badge-info">{{ $item->name }}</span>
                         			  @endforeach
                         			</td> 
						<td>
                           			   @if($media = $product->getFirstMedia())
                           			    <img src="{{basePath($media).$media->getUrl()}}" width="50px" height="50px">
                           			   @endif
                           			 </td>
						 <td>
			                                {{ $product->slug ?? '' }}
                            			</td>
						<td>
                                                    @if($product->created_at != null)
                                                        {{ Carbon\Carbon::parse($product->created_at)->toDayDateTimeString() }}
                                                    @endif
                                                </td>
						
						 <td>
						 <div class="dropdown">
                                                        <button class="btn bg-primary dropdown-toggle btn-select-option"
                                                                type="button" data-toggle="dropdown">... <span
                                                                class="caret"></span>
                                                        </button>
                                                        <ul class="dropdown-menu options-dropdown">
                                                            @if(Sentinel::getUser()->hasAccess(['companies_write']))
							   <li>
							   <a href="{{route('mng.products.edit',[$product->id])}}">
                                                                    <i class="fa fa-edit option-icon"></i>{{ __('edit') }}
                                                           </a>
                                                           </li>	 	 
                                                           @endif
                                                        </ul>
                                                  </div>
						 </td>
						 
                                            </tr>
                                        @endforeach
                                        </tbody>
                                    </table>
                                </div>
                                <div class="row">
                                    <div class="col-12 col-sm-6">
                                        <div class="block-header">
                                            <h2>{{ __('Showing') }} {{ $products->firstItem()}} {{  __('to') }} {{ $products->lastItem()}} {{ __('of') }} {{ $products->total()}} {{ __('entries') }}</h2>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6 text-right">
                                        <div class="table-info-pagination float-right">
                                            {!! $products->render() !!}
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
