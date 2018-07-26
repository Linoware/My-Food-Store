<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;

class Restaurant extends Model
{
    public function getRestaurantById($restaurant_id)
    {

        $restaurants = DB::table('view_restaurant_workdays')->where('restaurant_id', $restaurant_id)->get();

        return $restaurants;

    }

    public static function getWorkDayOfWeek($restaurant_id)
    {
        $today = DB::table('view_restaurant_workdays')->where('restaurant_id', $restaurant_id)->first();

        return $today->workday_name;
    }

    public static function getOpenCloseTime($restaurant_id)
    {
        $time = DB::table('view_restaurant_workdays')->where('restaurant_id', $restaurant_id)->first(['open_at','close_at']);

        return $time;
    }
}
