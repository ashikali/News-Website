@php
    $ad = data_get($widget, 'detail.ad');
@endphp

@if(!blank($ad))
    <div class="sg-widget">
        <div class="sg-ad">
            @if(data_get($ad, 'ad_type') == 'image')
                <a href="{{ data_get($ad, 'ad_url', '#') ?  data_get($ad, 'ad_url', '#') : '#'}}">
                    @if(isFileExist(@$ad->adImage, $result = @$ad->adImage->original_image))
                        <img  src="{{basePath($ad->adImage)}}/{{ $result }}" class="img-fluid" alt="{!! $ad->ad_name !!}">
                    @else
                        <img src="{{static_asset('default-image/default-add-300x250.png') }}" class="img-fluid" alt="{!! $ad->ad_name !!}" >
                    @endif
                </a>
            @elseif(data_get($ad, 'ad_type') == 'code')
                {!! $ad->ad_code ?? '' !!}
            @elseif(data_get($ad, 'ad_type') == 'text')
                {!! $ad->ad_text ?? '' !!}
            @endif
        </div>
    </div>
@endif
