<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('members', function (Blueprint $table) {
            $table->uuid('id')->primary();
            $table->string('memberID')->unique();
            $table->string('name');
            $table->date('dateJoin')->nullable();
            $table->string('telM')->nullable();
            $table->string('email')->nullable();
            $table->date('birthDate')->nullable();
            $table->string('parentID')->nullable();

            $table->timestamps();
        });

        Schema::table('members', function (Blueprint $table) {
            $table->foreign('parentID')->references('memberID')->on('members')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('members');
    }
};
