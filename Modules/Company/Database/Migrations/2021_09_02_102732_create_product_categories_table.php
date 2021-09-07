<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductCategoriesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('product_categories', function (Blueprint $table) {
	    $table->increments('id');
	    $table->unsignedInteger('category_id')->nullable();
            $table->string('name')->nullable();
            $table->longText('description')->nullable();
            $table->string('slug')->nullable()->unique();
            $table->timestamps();
            $table->foreign('category_id', 'category_fk_1396947')->references('id')->on('product_categories');
        });					

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('product_categories');
    }

}
