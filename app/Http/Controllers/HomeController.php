<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Modules\JsonResponseFormat;

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
            'section_title' => 'Banner',
            'data' => [
                array(
                    'id' => 2,
                    'title' => 'title',
                    'image' => 'image1',
                    'description' => ''
                )
            ],
            'has_more' => true
        );
        $data['brands_categories'] = array(
          'id' => 2,
          'section_title' => 'Brands Categories',
          'data' => [
              array(
                  'id' => 1,
                  'title' => 'title',
                  'image' => 'image1',
                  'description' => ''
              )
            ],
            'has_more' => true
        );

        $data['recommended_restaurants'] = array(
            'id' => 3,
            'section_title' => 'Recommended Restaurants',
            'data' => [
                array(
                    'id' => 1,
                    'title' => 'title',
                    'image' => 'image1',
                    'description' => ''
                )
            ],
            'has_more' => true
        );

        $data['recommended_foods'] = array(
            'id' => 4,
            'section_title' => 'Recommended Food',
            'data' => [
                array(
                    'id' => 1,
                    'title' => 'title',
                    'image' => 'image1',
                    'description' => ''
                )
            ],
            'has_more' => true
        );

        $data['brands_ordered_history'] = array(
            'id' => 5,
            'section_title' => 'Brand Ordered History',
            'data' => [
                array(
                    'id' => 1,
                    'title' => 'title',
                    'image' => 'image1',
                    'description' => ''
                )
            ],
            'has_more' => true
        );

        $response = $this->jsonDataFormat(true,['error_code' => 0, 'error_message' => 'request success'], $data);

        return response()->json($response);
    }
}
