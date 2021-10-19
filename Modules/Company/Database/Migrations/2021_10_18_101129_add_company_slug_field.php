<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddCompanySlugField extends Migration {


    public function up()
    {
        Schema::table('companies', function (Blueprint $table) {

            $table->string('slug')->nullable()->unique()->after('name');
 

        });
    }
    
    /**
     * Reverse the migrations.
     *
     * @return void
     */

    public function down()
    {
        Schema::table('companies', function (Blueprint $table) {

            $table->dropColumn('slug');

        });
    }
    
	
}
