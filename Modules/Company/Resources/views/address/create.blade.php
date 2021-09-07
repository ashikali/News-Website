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
            {!!  Form::open(['route' => 'mng.addresses.store', 'method' => 'post', 'enctype' => 'multipart/form-data']) !!}

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
                                <h4 class="border-bottom">{{ __('add_address') }}</h4>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="name" class="col-form-label">{{ __('company_name') }}*</label>
				 <select class="form-control" name="company_id" id="company_select">
                                    <option></option>
                                </select>
 
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="full_address" class="col-form-label">{{ __('full_address') }}</label>
                                <input id="full_address" name="full_address" value="{{ old('full_address') }}" required type="text"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="city" class="col-form-label">{{ __('city') }}</label>
                                <input id="city" name="city" value="{{ old('city') }}" required type="text"
                                       class="form-control">
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="state" class="col-form-label">{{ __('state') }}</label>
				<input id="state" name="state" value="{{ old('state') }}" required type="text"
				       class="form-control">
                            </div>
                        </div>
			<div class="col-sm-12">
                              <div class="form-group">
                                  <label for="country" class="col-form-label">{{ __('country') }}</label>
                                  <select class="form-control" name="country" id="country">
                                      @foreach($countries as $country)
                                          <option
                                              @if(settingHelper('country')==$country->name->common) Selected
                                              @endif
                                              value="{{  $country->name->common }}">
                                              {{ $country->name->common }}
                                          </option>
                                      @endforeach
                                  </select>
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
<script type="text/javascript">

$('#company_select').select2({
                        ajax: {
                            method: "GET",
                            delay: 250,
                            url: '{{ route('mng.companies.search') }}',
                            dataType: 'json',
                            data: function (params) {
                                return {
                                    search: params.term
                                }
                            },
                            processResults: function (data) {
                                return {
                                    results: data
                                }
                            }
                        }
                    });


</script>
@endpush
