<?php

use Illuminate\Support\Facades\Cache;
use Modules\Appearance\Enums\ThemeVisivilityStatus;
use Modules\Appearance\Entities\Theme;
use Modules\Setting\Entities\Setting;

function activeTheme()
{
    $activeTheme = Cache::rememberForever('activeTheme' , function (){
                        return Theme::where('status', ThemeVisivilityStatus::ACTIVE)->first();
                    });
    return $activeTheme;
}

function menuUrl($menu)
{
    if ($menu->source       == 'custom'):

        return $menu->url ?? '#';

    elseif ($menu->source   == 'category') :
        return route('site.category', ['slug' => $menu['category']->slug]);

    elseif ($menu->source   == 'sub-category') :
            return route('site.sub-category', ['slug' => $menu['subCategory']->slug]);

    elseif ($menu->source   == 'page') :

        if($menu->page_id == ""):
            return route('image.albums');
        else:
            return route('site.page', ['slug' => $menu['page']->slug]);
        endif;


    elseif ($menu->source   == 'post'):

        return route('article.detail', ['id' => $menu['post']->slug]);

    endif;
}

if (!function_exists('basePath')) {

    /**
     * description
     *
     * @param
     * @return
     */
    function basePath($image)
    {

        if (!blank($image)):
            if ($image->disk    == 'local' || $image->disk == 'media' ) :

                //return public_path();

                if (strpos(php_sapi_name(), 'cli') !== false || defined('LARAVEL_START_FROM_PUBLIC')) {
                    return url('/');
                }else{
                    return url('/public');
                }
            else :
                return "https://s3." . config('filesystems.disks.s3.region') . ".amazonaws.com/" . config('filesystems.disks.s3.bucket');
            endif;
        endif;

    }
}

if (!function_exists('defaultModeCheck')) {

    /**
     * description
     *
     * @param
     * @return
     */
    function defaultModeCheck()
    {
        $mode       = Session::get('mode');
        if ($mode   == "") :
            Session::put('mode', data_get(activeTheme(), 'options.mode'));
        endif;
        return Session::get('mode');

    }
}

if (!function_exists('embedUrl')) {
    /**
     * description
     *
     * @param
     * @return
     */
    function embedUrl($url)
    {
        $url        = str_replace('watch?v=', 'embed/', $url);
        return $url;
    }
}

if (!function_exists('isFileExist')) {

    /**
     * description
     *
     * @param
     * @return
     */
    function isFileExist($item  = '', $file = '')
    {
        if (!blank($item) and !blank($file)) :
            if ($item->disk     == 'local') :
                if (strpos(php_sapi_name(), 'cli') !== false || defined('LARAVEL_START_FROM_PUBLIC')) {
                    $file = $file;
                }else{
                    $file = 'public/'.$file;
                }
                if (File::exists($file)) :
                    return true;
                endif;
             else :
                if (Storage::disk('s3')->exists($file)) :
                    return true;
                endif;
            endif;
        endif;

        return false;
    }
}

if (!function_exists('static_asset')) {

    function static_asset($path = ''){
        if (strpos(php_sapi_name(), 'cli') !== false || defined('LARAVEL_START_FROM_PUBLIC')) {
            return app('url')->asset($path);
        }else{
            return app('url')->asset('public/'.$path);
        }
    }
}

if (!function_exists('safari_check')) {

    function safari_check(){
        if (UserAgentBrowser(\Request()->header('User-Agent')) == 'Apple Safari' || UserAgentBrowser(\Request()->header('User-Agent')) == 'Safari' ||
            UserAgentBrowser(\Request()->header('User-Agent')) == 'Internet Explorer'):
            return true;
        endif;
        return false;
    }

}
if (!function_exists('profile_exist')) {

    function profile_exist($image = ''){
        if (strpos(php_sapi_name(), 'cli') !== false || defined('LARAVEL_START_FROM_PUBLIC')) {
            $file = $image;
        }else{
            $file = 'public/'.$image;
        }
        if (File::exists($file)) :
            return true;
        endif;
    }

}
