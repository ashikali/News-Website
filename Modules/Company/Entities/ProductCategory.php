<?php

namespace Modules\Company\Entities;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;


class ProductCategory extends Model {


    use Sluggable,\Znck\Eloquent\Traits\BelongsToThrough;


    protected $fillable = [
     			   'name',
     			   'description',
     			   'category_id',
     			   'slug'];

    public function parentCategory(){

        return $this->belongsTo(ProductCategory::class, 'category_id');

    }

    public function childCategories(){

        return $this->hasMany(ProductCategory::class, 'category_id');

    }

    public function products(){

        return $this->belongsToMany(Product::class);

    }


    public function sluggable(){
        return [
            'slug' => [
                'source' => 'name'
            ]
        ];
    }

}
