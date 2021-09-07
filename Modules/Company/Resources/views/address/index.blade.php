@extends('common::layouts.master')


@section('companies-show')
    show
@endsection

@section('addresses')
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
                                                <h2>{{ __('addresses') }}</h2>
                                            </div>
                                        </div>
                                    </div>
				   <div class="row">
					<div class="col-12 text-right">
						 <a href="{{route('mng.addresses.create')}}" class="btn btn-primary btn-sm"><i
                                                   class="m-r-10 mdi mdi-plus"></i>{{__('add_address')}}</a>
                                        </div>
                                   </div>
                                </div>
                                <div class="table-responsive all-pages">
                                    <table class="table table-bordered table-striped">
                                        <thead>
                                        <tr role="row">
                                            <th>#</th>
                                            <th>{{ __('company_name') }}</th>
                                            <th>{{ __('full_address') }}</th>
                                            <th>{{ __('city') }}</th>
                                            <th>{{ __('state') }}</th>
                                            <th>{{ __('country') }}</th>
                                            <th>{{ __('created_at') }}</th>
					    @if(Sentinel::getUser()->hasAccess(['companies_delete']) || 
							Sentinel::getUser()->hasAccess(['companies_write']))
                                                <th>{{ __('options') }}</th>
                                            @endif
                                        </tr>
                                        </thead>
                                        <tbody>
                                        @foreach ($addresses as $address)
                                            <tr role="row" id="row_{{ $address->id }}" class="odd">
                                                <td class="sorting_1">{{ $address->id }}</td>
						<td>{{ $address->company->name }}</td>
                                                <td>{{ $address->full_address }}</td>
                                                <td>{{ $address->city }}</td>
                                                <td>{{ $address->state}}</td>
                                                <td>{{ $address->country}}</td>
						<td>
                                                    @if($address->created_at != null)
                                                        {{ Carbon\Carbon::parse($address->created_at)->toDayDateTimeString() }}
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
							   <a href="{{route('mng.addresses.edit',[$address->id])}}">
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
                                            <h2>{{ __('Showing') }} {{ $addresses->firstItem()}} {{  __('to') }} {{ $addresses->lastItem()}} {{ __('of') }} {{ $addresses->total()}} {{ __('entries') }}</h2>
                                        </div>
                                    </div>
                                    <div class="col-12 col-sm-6 text-right">
                                        <div class="table-info-pagination float-right">
                                            {!! $addresses->render() !!}
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
