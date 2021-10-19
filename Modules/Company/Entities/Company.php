<?php

namespace Modules\Company\Entities;

use Illuminate\Database\Eloquent\Model;
use Cviebrock\EloquentSluggable\Sluggable;


class Company extends Model{

    use Sluggable; 

    protected $fillable = ['profile_image','user_id','name','website','additional_info','slug'];


    public function addresses(){

	return $this->hasMany('Modules\Company\Entities\Address');

    }

    public function products(){

	return $this->hasMany('Modules\Company\Entities\Product');		


    }

    public function sluggable(){

        return [
            'slug' => [
                'source' => 'name'
            ]
        ];

    }

 
}
