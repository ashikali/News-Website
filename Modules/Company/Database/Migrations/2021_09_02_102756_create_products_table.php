<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {

	Schema::create('products', function (Blueprint $table) {

            $table->increments('id');
            $table->unsignedBigInteger('company_id');
            $table->string('name')->nullable();
            $table->longText('description')->nullable();
            $table->string('slug')->nullable()->unique();
            $table->timestamps();
            $table->foreign('company_id', 'company_id_fk_1396941')->references('id')->on('companies')->onDelete('cascade');

        });

    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }

}
