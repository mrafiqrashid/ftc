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
        Schema::create('memberss', function (Blueprint $table) {
            $table->id();
            $table->string('memberID')->unique();
            $table->string('parentID')->nullable();
            $table->timestamps();
        });

        Schema::table('memberss', function (Blueprint $table) {
            $table->foreign('parentID')->references('memberID')->on('memberss')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('memberss');
    }
};
