<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CompanyProductCategory extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up(){

            Schema::create('company_product_category', function (Blueprint $table) {
            $table->unsignedBigInteger('company_id');
            $table->foreign('company_id', 'company_id_fk_139600')->references('id')->on('companies')->onDelete('cascade');
            $table->unsignedInteger('product_category_id');
            $table->foreign('product_category_id', 'product_category_id_fk_1397041')->references('id')->on('product_categories')->onDelete('cascade');
        });
 	
	    
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
