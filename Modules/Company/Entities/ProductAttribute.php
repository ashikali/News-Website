<?php

namespace Modules\Company\Entities;

use Illuminate\Database\Eloquent\Model;

class ProductAttribute extends Model {

    protected $fillable = ["field_name","product_id","value","order_no"];


}
