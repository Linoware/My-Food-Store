<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Modules\JsonResponseFormat;
use App\Banner;
use App\Restaurant;
use App\BrandCategory;

class HomeController extends Controller
{

    use JsonResponseFormat;
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        //$this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {



        $data['banner'] = array(
            'id' => 1,
            'section_title' => 'Bran Home Banner'
        );

        $data['banner']['data'] = Banner::all();

        $data['brand_categories'] = array(
            'id' => 2,
            'section_title' => 'Brands Categories'
        );

        $data['brand_categories']['data'] = BrandCategory::all();

        $response = $this->jsonDataFormat(true,['error_code' => 0, 'error_message' => 'request success'], $data);

        return response()->json($response);
    }
}
