<?php

namespace Modules\Company\Entities;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use Spatie\MediaLibrary\Models\Media;
use \DateTimeInterface;


class Product extends Model implements HasMedia {

    use  HasMediaTrait, Sluggable;
 
    protected $fillable = ["company_id","name","description","slug"];
      

    protected function serializeDate(DateTimeInterface $date){

        return $date->format('Y-m-d H:i:s');

    }

    public function registerMediaConversions(Media $media = null){

        $this->addMediaConversion('thumb')->width(50)->height(50);
        $this->addMediaConversion('showcase')->width(255)->height(150);

    }

    public function attributes(){

	return  $this->hasMany(ProductAttribute::class);

    }

    public function categories(){

        return $this->belongsToMany(ProductCategory::class);

    }

    public function tags(){

        return $this->belongsToMany(ProductTag::class);

    }

    public function getPhotoAttribute(){

        $file = $this->getMedia('photo')->last();

        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl('thumb');
        }

        return $file;

    }

    public function sluggable(){

        return [
            'slug' => [
                'source' => 'name'
            ]
        ];

    }
  	
 	
}
