<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\Brands;

class BranHomeBanner extends Model
{
    protected $table = "brand_home_banners";

    protected $primaryKey = "brand_home_banner_id";

    protected $fillable = [

    ];

    public $timestamps = false;

    public function brands()
    {
        return $this->belongsTo(Brands::class,'brand_id');
    }
}
