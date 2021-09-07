
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
            {!!  Form::open(['route' => 'mng.companies.store', 'method' => 'post', 'enctype' => 'multipart/form-data']) !!}

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
                                <h4 class="border-bottom">{{ __('create_company') }}</h4>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="name" class="col-form-label">{{ __('company_name') }}*</label>
                                <input id="name" name="name" value="{{ old('name') }}" required type="text"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="website" class="col-form-label">{{ __('website') }}*</label>
                                <input id="website" name="website" value="{{ old('website') }}" required type="text"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="additional_info" class="col-form-label">{{ __('additional_info') }}</label>
				<textarea id="additional_info" name="additional_info" class="form-control" 
					  value="{{ old('additional_info') }}" rows="5"></textarea>
                            </div>
                        </div>
			<div class="col-sm-12">
                              <div class="form-group">
                                  <label for="profile_image" class="upload-file-btn btn btn-primary"><i
                                          class="fa fa-folder input-file"
                                          aria-hidden="true"></i> {{ __('select_image')}}</label>
                                  <input id="profile_image" name="profile_image" onChange="swapImage(this)" data-index="0"
                                         type="file" class="form-control d-none" accept="image/*">
                              </div>
                        </div>
			<div class="col-sm-12">
                           <div class="form-group">
                               <div class="form-group text-center">
                                   <img src="{{static_asset('default-image/user.jpg') }} " data-index="0"
                                        width="200" height="200" alt="image"
                                        class="img-responsive img-thumbnail">
                               </div>
                           </div>
                       </div>
		       <div class="row p-l-15">
                            <div class="col-12 col-md-4">
                                <div class="form-title">
                                    <label for="status">{{ __('status') }}</label>
                                </div>
                            </div>
                            <div class="col-3 col-md-2">
                                <label class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="status" id="status_yes" value="1" checked
                                           class="custom-control-input">
                                    <span class="custom-control-label">{{ __('active') }}</span>
                                </label>
                            </div>
                            <div class="col-3 col-md-2">
                                <label class="custom-control custom-radio custom-control-inline">
                                    <input type="radio" name="status" id="status_no" value="0"
                                           class="custom-control-input">
                                    <span class="custom-control-label">{{ __('inactive') }}</span>
                                </label>
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
