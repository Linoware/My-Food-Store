<?php

namespace App\Http\Controllers;

use App\Helpers\common;
use App\Item;
use Illuminate\Http\Request;
use App\Http\Modules\FrontEndHelper;
use Illuminate\Support\Facades\Session;

class ItemController extends Controller
{
    use FrontEndHelper;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $items = Item::getItemList();
        return view('items.index',compact('items'));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

        $data = $this->commonData();

        return view('items.form',$data);

    }

    public function changeForm(Request $request)
    {

        $data = $this->commonData();

        $this->clearItemSession($request->clear);

        if($request->type == 1){
            $view = 'single_item_form';
        }else if($request->type == 2){
            $view = 'group_item_form';
        }

        $request->session()->put('item_type',array('type'=>$request->type, 'view'=>$view));

        return $this->reloadView('items.'.$view, $data);
    }

    public function addInfo(Request $request)
    {

        $data = $this->commonData();

        if($request->type == 'pricing'){
            if(!empty(Session::get('item_size_price'))){
                foreach(Session::get('item_size_price') as $key => $value) {
                    if($value['item_size'] == $request->data['item_size']){
                        return response()->json(['status' => false]);
                    }
                }
            }

            $session_data['item_size'] = $request->data['item_size'];
            $session_data['item_size_id'] = $request->data['item_size_id'];
            $session_data['item_price'] = $request->data['item_price'];

            Session::push('item_size_price',$session_data);


        }else if($request->type == 'info'){
            Session::put('item_name', $request->data['item_name']);
        }else if($request->type == 'image'){
            if($request->data['action'] == 1){
                Session::put('item_image', $request->data['item_image']);
            }else if($request->data['action'] == 0){
                Session::forget('item_image');
            }

        }else{
            Session::put($request->type, $request->data['value']);
        }

        $view = $request->session()->get('item_type')['view'];

        return $this->reloadView('items.'.$view, $data);
    }

    public function removeItemPrice(Request $request)
    {

        $item_size_prices = Session::get('item_size_price');
        array_forget($item_size_prices, $request->key);
        Session::put('item_size_price', $item_size_prices);
        $data = $this->commonData();
        $view = $request->session()->get('item_type')['view'];

        return $this->reloadView('items.'.$view, $data);
    }

    public function editItemPrice(Request $request)
    {
        $item_size_prices = Session::get('item_size_price');

        if(array_has($item_size_prices, $request->key)){

            $item_size_prices[$request->key]['item_price'] = $request->price;

            Session::put('item_size_price', $item_size_prices);


        }


        $data = $this->commonData();
        $view = $request->session()->get('item_type')['view'];

        return $this->reloadView('items.'.$view, $data);
    }

    private function clearItemSession($clear = 0)
    {

        if($clear == 1){
            Session::forget('item_image');
            Session::forget('item_name');
            Session::forget('item_size_price');
        }

    }

    private function commonData()
    {
        $data['session_data'] = Request()->session()->get('item_size_price');
        $data['item_types'] = Item::getItemType();
        $data['product_sizes'] = Item::getProductSize();
        $data['brands'] = Item::getBrands();

        return $data;
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
    }

    /**
     * Display the specified resource.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function show(Item $item)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function edit(Item $item)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Item $item)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Item  $item
     * @return \Illuminate\Http\Response
     */
    public function destroy(Item $item)
    {
        //
    }
}
