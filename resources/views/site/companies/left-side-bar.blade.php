@section('style')
 <link rel="preload" href="{{static_asset('site/css/category.css')}}?v=1" as="style" onload="this.onload=null;this.rel='stylesheet'">
    <noscript><link  rel="stylesheet" href="{{static_asset('site/css/category.css')}}?v=1"></noscript>
@endsection

<h1>{{ __('Companies') }}</h1>
<ul class="list-group" id="categories">
  @foreach($frontCompanyCategories as $parentCategory)
    <li class="list-group-item" data-id="{{ $parentCategory->id }}">
      <i class="fa fa-arrow-right"></i>
      <a href="{{ route('companies.category', [$parentCategory]) }}">{{ $parentCategory->name }} ({{ $parentCategory->companies_count }})</a>
    </li>
    @if($parentCategory->childCategories->count())
      <div class="list-second-level" data-id="{{ $parentCategory->id }}" style="display:none;">
        @foreach($parentCategory->childCategories as $category)
          <li class="list-group-item" data-id="{{ $category->id }}">
            <i class="fa fa-arrow-right"></i>
         <a href="{{ route('companies.category', [$parentCategory, $category]) }}">{{ $category->name }} ({{ $category->companies_count }})</a>
          </li>
          @if($category->childCategories->count())
            <div class="list-third-level" data-id="{{ $category->id }}" style="display:none;">
              @foreach($category->childCategories as $childCategory)
                <a
                  href="{{ route('companies.category', [$parentCategory, $category, $childCategory->slug]) }}"
                  class="list-group-item"
                  data-id="{{ $childCategory->id }}"
                >
                  {{ $childCategory->name }} ({{ $childCategory->companies_count }})
                </a>
      	   @endforeach
            </div>
            @endif
          @endforeach
      </div>
      @endif
    @endforeach
</ul>

@push('script')

<script>
    $(function () {
      $('#categories li').click(function () {
        var $this = $(this);
        var id = $this.data('id');

        // Collapse siblings
        $this.siblings('li[data-id!="' + id + '"]').children('i').addClass('fa-arrow-right').removeClass('fa-arrow-down');
        $this.siblings('div[data-id!="' + id + '"]').hide();

        $this.children('i').toggleClass('fa-arrow-right').toggleClass('fa-arrow-down');
        $this.siblings('div[data-id="' + id + '"]').toggle();
      });

      @if(isset($selectedCategories))
        @foreach($selectedCategories as $selected)
          @if($loop->index < 2)
            $('#categories .list-group-item[data-id="{{ $selected }}"]').click();
          @endif
          @if($loop->last)
            $('#categories .list-group-item[data-id="{{ $selected }}"]').toggleClass('active');
          @endif
        @endforeach
      @endif
    });
</script>

@endpush
