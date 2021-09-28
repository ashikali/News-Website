<?php

namespace Modules\Company\Entities;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;
use Spatie\MediaLibrary\Models\Media;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;
use DateTimeInterface;


class Product extends Model implements HasMedia {

    use  HasMediaTrait, Sluggable;
 
    protected $fillable = ["company_id","name","description","slug"];
      

    protected function serializeDate(DateTimeInterface $date){

        return $date->format('Y-m-d H:i:s');

    }

    public static function last(){

	return static::all()->last();

    }

    public function registerMediaConversions(Media $media = null){

        $this->addMediaConversion('thumb')->width(50)->height(50)->nonQueued();
        $this->addMediaConversion('showcase')->width(255)->height(150)->nonQueued();

    }

    public function attributes(){

	return  $this->hasMany(ProductAttribute::class);

    }

    public function company(){

	return $this->belongsTo(Company::class);

    }
    public function categories(){

        return $this->belongsToMany(ProductCategory::class);

    }

    public function tags(){

        return $this->belongsToMany(ProductTag::class);

    }

    public function getPhotoAttribute(){

        $file = $this->getMedia()->last();

        if ($file) {
            $file->url       = $file->getUrl();
            $file->thumbnail = $file->getUrl('thumb');
            $file->showcase  = $file->getUrl('showcase');
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
