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
	    {!!  Form::open(['route' => 'mng.products.store', 'method' => 'post', 'enctype' => 'multipart/form-data',
			   'id' => 'dropzone-form' ]) !!}

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
                                <h4 class="border-bottom">{{ __('Create Product') }}</h4>
                            </div>
                        </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="name" class="col-form-label">{{ __('Product Name') }}</label>
                                <input id="name" name="name" value="{{ old('name') }}" required type="text"
                                       class="form-control">
                            </div>
                       </div>
                        <div class="col-sm-12">
                            <div class="form-group">
                                <label for="company_id" class="col-form-label">{{ __('Company') }}</label>
				 <select class="form-control" name="company_id" required id="company_select">
                                </select>
                            </div>
                        </div>

			<div class="col-sm-12">
			 <div class="form-group">
			{!! Form::Label('flag','Flag') !!}
    			{!! Form::select('flag',$flags,null,['class' => 'form-control']) !!} 
			 </div>
			</div>
			<div class="col-sm-12">
			   <div class="form-group">
               			 <label for="categories" class="col-form-label">{{ __('Select Categories') }}</label>
               			 <div style="padding-bottom: 4px">

               		 <span class="btn btn-success select-all" style="border-radius: 0">{{__('Select All') }}</span>
               		 <span class="btn btn-info deselect-all"  style="border-radius: 0">{{ __('DeSelect All') }}</span>

               			 </div>
				 <select class="form-control select2" 
					 name="categories[]" id="categories" required multiple>
               			     @foreach($categories as $category)
               			         <option value="{{ $category->id }}" {{ in_array($category->id, old('categories', [])) ? 'selected' : '' }}>{{ $category->parentCategory->parentCategory->name }} / {{ $category->parentCategory->name }} / {{ $category->name }}</option>
               			     @endforeach
               			 </select>
           		  </div> 
			</div>
			<div class="col-sm-12">
			   <div class="form-group">
               			 <label for="tags" class="col-form-label">{{ __('Select Tags') }}</label>
               			 <div style="padding-bottom: 4px">

               		 <span class="btn btn-success select-all" style="border-radius: 0">{{__('Select All') }}</span>
               		 <span class="btn btn-info deselect-all"  style="border-radius: 0">{{ __('DeSelect All') }}</span>

               			 </div>
				 <select class="form-control select2" 
					 name="tags[]" id="tags" multiple>
               			     @foreach($tags as $id => $tag)
					 <option value="{{ $id }}" {{ in_array($id, old('tags', [])) ? 'selected' : '' }}>
						{{$tag}}
					 </option>
               			     @endforeach
               			 </select>
           		  </div> 
			</div>

			 <div class="col-sm-12">
                              <div class="form-group">
                                        <label class="required" for="slug">{{ __('slug') }}</label>
                                        <input class="form-control {{ $errors->has('slug') ? 'is-invalid' : '' }}" 
                                               type="text" name="slug" id="slug" value="{{ old('slug','') }}" required>
                              </div>
                        </div>

			<div class="col-sm-12">
			   <div class="form-group">
          		      <label for="dropzone">{{ __('Upload Photos') }}</label>
				    <div id="dropzone" class="dropzone"></div>
          		  </div>
			</div>

			<div class="col-sm-12">
			   <div class="form-group">
          		        <label for="name">{{ __('Attributes') }}</label><br/>
				<div style="padding-bottom:8px">
				<input type="text" id="attribute" class="col-form-label" placeholder="Attribute">
    			        <input type="text" id="value" class="col-form-label" placeholder="Value">
    			     	<input type="button" class="add-row btn btn-primary" value="Add Row">
				</div>

				<div class="table-responsive all-pages">
                                    <table class="table table-bordered table-striped" role="grid">
                                        <thead>
                                        <tr role="row">
                                            <th width="20">#</th>
                                            <th>{{ __('Name') }}</th>
                                            <th>{{ __('Value') }}</th>
                                        </tr>
                                        </thead>
                                        <tbody>
					    					
					</tbody>
				    </table>
				</div>
			      <div class="pt-1">
			      <button type="button" class="btn btn-danger delete-row">Delete Row</button> 
			      </div>
          		  </div>
			</div>

			 <div class="row p-l-15">
                              <div class="col-12">
                                  <label for="post_content" class="col-form-label">{{ __('content') }}*</label>
                                  <textarea name="description" value="{{ old('descripton') }}" id="post_content"
                                            cols="30" rows="5"></textarea>
                              </div>
                         </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="form-group form-float form-group-sm">
				    <button id="submit-dropzone" name="submitDropzone" type="submit" 
					    class="btn btn-primary float-right m-t-20">
					    <i
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

$('.select2').select2()

$('.select-all').click(function () {
   let $select2 = $(this).parent().siblings('.select2')
   $select2.find('option').prop('selected', 'selected')
   $select2.trigger('change')
 })
 $('.deselect-all').click(function () {
   let $select2 = $(this).parent().siblings('.select2')
   $select2.find('option').prop('selected', '')
   $select2.trigger('change')
 }) 

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


// disable autodiscover
Dropzone.autoDiscover = false;

var myDropzone = new Dropzone("#dropzone", {
    url: "{{route('mng.products.storeMedia')}}",
    method: "POST",
    headers: {
      'X-CSRF-TOKEN': "{{ csrf_token() }}"
    }, 	
    paramName: "file",
    autoProcessQueue : false,
    acceptedFiles: "image/*",
    maxFiles: 5,
    maxFilesize: 3, // MB
    uploadMultiple: true,
    parallelUploads: 100, // use it with uploadMultiple
    createImageThumbnails: true,
    thumbnailWidth: 120,
    thumbnailHeight: 120,
    addRemoveLinks: true,
    timeout: 180000,
    dictRemoveFileConfirmation: "Are you Sure?", // ask before removing file
    // Language Strings
    dictFileTooBig: "Max allowed file size is 3mb",
    dictInvalidFileType: "Invalid File Type",
    dictCancelUpload: "Cancel",
    dictRemoveFile: "Remove",
    dictMaxFilesExceeded: "Only 5 files are allowed",
    dictDefaultMessage: "Drop files here to upload",
});

myDropzone.on("addedfile", function(file) {
   // console.log(file);
});

myDropzone.on("removedfile", function(file) {
    // console.log(file);
});

// Add mmore data to send along with the file as POST data. (optional)
myDropzone.on("sending", function(file, xhr, formData) {
   //formData.append("dropzone[]", file); // $_POST["dropzone"]
});

myDropzone.on("error", function(file, response) {
	//console.log(response);
});

// on success
myDropzone.on("successmultiple", function(file, response) {
    //get response from successful ajax request
    $('#dropzone-form').append('<input type="hidden" name="files" value="' + response.files + '">');
    $('#dropzone-form').submit();

});

$('#submit-dropzone').click(function (e) {

    e.preventDefault();
    e.stopPropagation(); 
    if( myDropzone.files != "" )
        myDropzone.processQueue();
    else
       $('#dropzone-form').submit(); //error checking be happened after form submit
	

});

$(".add-row").click(function(){

      var attribute = $("#attribute");
      var value = $("#value");
      var markup =  "<tr><td><input type='checkbox' name='record'></td><td><input type='hidden' name='attributes[]' value='"+attribute.val()+','+value.val()+"'>"+ attribute.val() + "</td><td>" + value.val() + "</td></tr>";

      attribute.val("");
      value.val("");
      $("table tbody").append(markup);

});
       
       // Find and remove selected table rows
$(".delete-row").click(function(){
    $("table tbody").find('input[name="record"]').each(function(){
    	if($(this).is(":checked")){
            $(this).parents("tr").remove();
        }
    });
});

$('#name').change(function(e) {
    $.get('{{ route('mng.products.checkSlug') }}',
        { 'name': $(this).val() },
        function( data ) {
            $('#slug').val(data.slug);
        }
    );
});


</script>

@endpush
