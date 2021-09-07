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
                                            <th>{{ __('Profile') }}</th>
                                            <th>{{ __('name') }}</th>
                                            <th>{{ __('website') }}</th>
                                            <th>{{ __('description') }}</th>
                                            <th>{{ __('status') }}</th>
                                            <th>{{ __('created_at') }}</th>
					    @if(Sentinel::getUser()->hasAccess(['companies_delete']) || 
							Sentinel::getUser()->hasAccess(['companies_write']))
                                                <th>{{ __('options') }}</th>
                                            @endif
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($companies as $company)
                                            <tr role="row" id="row_{{ $company->id }}" class="odd">
                                                <td class="sorting_1">{{ $company->id }}</td>
						<td>
                                                    @if($company->profile_image!=null)
                                                        <img src=" {{static_asset($company->profile_image)}} "
                                                            height="64" width="64" alt="{{$company->name}}"
                                                            class="img-responsive rounded-circle user-image">
                                                    @else
                                                        <img src="{{static_asset('default-image/user.jpg') }}" height="64"
                                                             width="64" alt="{{$company->name}}" class="img-responsive rounded-circle">
                                                    @endif
                                                </td>
                                                <td>{{ $company->name }}</td>
                                                <td>{{ $company->website }}</td>
                                                <td>{{ $company->additional_info }}</td>
						<td>
							@if($company->is_active == 0)
                                                            <label class="label label-danger">{{ __('banned') }}</label>
                                                        @else
                                                            <label class="label label-success">{{ __('active') }}</label>
                                                        @endif
</td>
                                                <td>
                                                    @if($company->created_at != null)
                                                        {{ Carbon\Carbon::parse($company->created_at)->toDayDateTimeString() }}
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
							   <a href="{{route('mng.companies.edit',[$company->id])}}">
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
                                            <h2>{{ __('Showing') }} {{ $companies->firstItem()}} {{  __('to') }} {{ $companies->lastItem()}} {{ __('of') }} {{ $companies->total()}} {{ __('entries') }}</h2>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6 text-right">
                                        <div class="table-info-pagination float-right">
                                            {!! $companies->render() !!}
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
