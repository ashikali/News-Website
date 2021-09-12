<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductAttributesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_attributes', function (Blueprint $table) {

            $table->increments('id');
            $table->unsignedInteger('product_id');
            $table->string('field_name');
            $table->longText('value');
	    $table->unsignedInteger('order_no');
            $table->timestamps();
            $table->foreign('product_id', 'product_id_fk_16941')->references('id')->on('products')->onDelete('cascade');
 	  
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_attributes');
    }
}
