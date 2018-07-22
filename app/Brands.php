<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use App\BranHomeBanner;
use App\BrandCategory;
use App\BrandOrderedHistory;
class Brands extends Model
{
    protected $table = "brands";

    protected $primaryKey = "banner_id";

    protected $fillable = [

    ];

    public $timestamps = false;

    public function banners()
    {
        return $this->hasMany(BranHomeBanner::class,'brand_id');
    }

    public function brandCategories()
    {
        return $this->hasMany(BrandCategory::class,'brand_id');
    }

    public function brandOrderHistories()
    {
        return $this->hasMany(BrandOrderedHistory::class,'brand_id');
    }
}
