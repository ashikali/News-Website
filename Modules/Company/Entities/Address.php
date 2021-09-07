<?php

namespace Modules\Company\Entities;

use Illuminate\Database\Eloquent\Model;

class Address extends Model {

    protected $fillable = ['company_id','full_address','city','state','country'];

    public function company(){

                return $this->belongsTo(Company::class);

    }

}
