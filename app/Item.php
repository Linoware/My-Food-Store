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
        $items = DB::table('items as i')
            ->join('brands as b', 'i.brand_id', '=', 'b.brand_id')
            ->join('currencies as c', 'b.currency_id', '=', 'c.currency_id')
            ->where('item_id', $item_id)
            ->get(['item_id', 'item_type_id', 'item_name', 'item_name_native', 'item_price', 'item_image','c.currency_name','c.currency_code','c.currency_sign']);

       foreach($items as $item){
           if($item->item_type_id == 1){
               $item->sizes = array(
                   'id' => 1,
                   'title' => 'Product Sizes',
                   'data' => $this->getProductSizes($item->item_id)
               );
               $item->product_ingredient_levels = array(
                   'id' => 2,
                   'title' => 'Ingredient Levels',
                   'data' => $this->getIngredientLevels($item->item_id)
               );
               $item->product_ingredient_options = array(
                   'id' => 3,
                   'title' => 'Ingredient Options',
                   'data' => $this->getIngredientOptions($item->item_id)
               );
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
            ->get(['psd.product_size_id', 'ps.product_size_name', 'ps.product_size_name_native','psd.is_default']);

        return $product_sizes;
    }

    private function getIngredientLevels($item_id)
    {
        $product_ingredient_levels = DB::table('items as i')
            ->join ('items_products_detail as ipd', 'i.item_id', '=', 'ipd.item_id')
            ->join('product_ingredient_levels as pil', 'ipd.product_id', '=', 'pil.product_id')
            ->where(['i.item_id' => $item_id, 'i.item_type_id' => 1])
            ->distinct()
            ->get(['pil.ingredient_level_id', 'pil.ingredient_level_name', 'pil.ingredient_level_name_native']);

        foreach($product_ingredient_levels as $ingredient_level){
            $ingredient_level->ingrediient_level_value = array(
                'data' => $this->getProductIngredientLevelValue($ingredient_level->ingredient_level_id)
            );
        }

        return $product_ingredient_levels;
    }

    private function getProductIngredientLevelValue($ingredient_level_id){

        $product_ingredient_level_values = DB::table('product_ingredient_level_value')->where('ingredient_level_id', $ingredient_level_id)->get();

        return $product_ingredient_level_values;
    }

    private function getIngredientOptions($item_id)
    {
        $ingredient_options = DB::table('items as i')
            ->join ('items_products_detail as ipd', 'i.item_id', '=', 'ipd.item_id')
            ->join('product_ingredient_options as pio', 'ipd.product_id', '=', 'pio.product_id')
            ->where(['i.item_id' => $item_id, 'i.item_type_id' => 1])
            ->distinct()
            ->get(['pio.ingredient_option_id', 'pio.ingredient_option_name', 'pio.ingredient_option_name_native']);

        return $ingredient_options;
    }

}
