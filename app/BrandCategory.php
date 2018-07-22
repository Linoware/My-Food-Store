<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BrandCategory extends Model
{
    protected $table = "brand_home_categories";

    protected $primaryKey = "brand_home_id";

    protected $fillable = [

    ];

    public $timestamps = false;

    public function brands()
    {
        return $this->belongsTo(Banner::class,'brand_id');
    }
}
