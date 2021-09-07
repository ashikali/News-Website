<?php

namespace Modules\Company\Entities;

use Illuminate\Database\Eloquent\Model;

class Company extends Model{

    protected $fillable = ['profile_image','user_id','name','website','additional_info'];


    public function addresses(){

		$this->hasMany('Modules\Company\Entities\Address');

    }

}
