@extends('common::layouts.master')


@section('companies-show')
    show
@endsection

@section('companies')
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
                                                <h2>{{ __('companies') }}</h2>
                                            </div>
                                        </div>
                                    </div>
				   <div class="row">
					<div class="col-12 text-right">
						 <a href="{{route('mng.companies.create')}}" class="btn btn-primary btn-sm"><i
                                                   class="m-r-10 mdi mdi-plus"></i>{{__('create_company')}}</a>
                                        </div>
                                   </div>
                                </div>
                                <div class="table-responsive all-pages">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <tr role="row">
                                            <th>#</th>
                                            <th>{{ __('name') }}</th>
                                            <th>{{ __('description') }}</th>
                                            <th>{{ __('parent_categories') }}</th>
                                            <th>{{ __('slug') }}</th>
                                            <th>{{ __('options') }}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
		  	  @foreach($productCategories as $key => $productCategory)

               			    @include('company::categories.indexRow', compact('productCategory'))

               			 @foreach($productCategory->childCategories as $childCategory)

               			  @include('company::categories.indexRow', ['productCategory' => $childCategory, 'prefix' => '--'])

               			      @foreach($childCategory->childCategories as $childCategory)
               			       @include('company::categories.indexRow', ['productCategory' => $childCategory, 'prefix' => '----'])
               			      @endforeach

               			 @endforeach

            	          @endforeach	
                                        </tbody>
                                    </table>
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
