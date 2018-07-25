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

    public static function getBrands()
    {
        $items = DB::table('brands as b')
            ->join('currencies as c','b.currency_id','=','c.currency_id')
            ->join('countries as co','b.country_id','=','co.country_id')
            ->get();
        return $items;
    }

    public function getItemById($item_id)
    {
        $items = DB::table('items')
            ->where('item_id', $item_id)
            ->get(['item_id', 'item_type_id', 'item_name', 'item_name_native', 'item_price', 'item_image']);

       foreach($items as $item){
           if($item->item_type_id == 1){
               $item->size = $this->getProductSizes($item->item_id);
           }
       }

        return $items;
    }

    private function getProductSizes($item_id)
    {
        $product_sizes = DB::table('items as i')
            ->join ('items_products_detail as ipd', 'i.item_id', '=', 'ipd.item_id')
            ->join('product_sizes as ps', 'ipd.product_size_id', '=', 'ps.product_size_id')
            ->join('products_sizes_detail as psd', 'ps.product_size_id', '=', 'psd.product_size_id')
            ->where(['i.item_id' => $item_id, 'i.item_type_id' => 1])
            ->distinct()
            ->get(['psd.product_size_id', 'ps.product_size_name', 'ps.product_size_name_native','psd.size_default']);

        return $product_sizes;
    }

}
