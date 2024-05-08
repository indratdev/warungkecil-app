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
        Schema::create('m_project', function (Blueprint $table) {
            $table->id();
            $table->integer('owner_id');
            $table->string('name');
            $table->string('branch_name')->nullable();
            $table->string('address')->nullable();
            $table->string('province')->nullable();
            $table->string('city')->nullable();
            $table->string('zipcode')->nullable();
            $table->string('npwp')->nullable();
            $table->string('phone')->nullable();
            $table->integer('active')->default(1);
            $table->integer('deleted')->default(0);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('m_project');
    }
};
