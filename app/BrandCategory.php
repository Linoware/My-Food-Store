<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BrandCategory extends Model
{
    protected $table = "view_brands_categories";

    protected $primaryKey = "category_id";

    protected $fillable = [

    ];

    public $timestamps = false;

}
