<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Support\Facades\DB;
class Item extends Model
{

    protected $table = 'items';

    public static function getItemList()
    {
        $items = DB::table('items as i')
            ->join('item_types as it','i.item_type_id','=','it.item_type_id')
            ->get();
        return $items;
    }

    public static function getItemType()
    {
        $item_types = DB::table('item_types')->get();
        return $item_types;
    }

    public static function getProductSize()
    {
        $product_size = DB::table('product_sizes')->get();
        return $product_size;
    }
}
