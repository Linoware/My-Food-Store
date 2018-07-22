<?php

namespace App\Http\Controllers;

use App\Http\Controllers\ApiBaseController;
use Illuminate\Http\Request;


class OrderController extends ApiBaseController
{
	// use JsonResponseFormat;

	public function create(Request $request)
	{

		$token = $request->header('Authorization');

		$customer = $this->auth($token);
		if ($customer['status']) {
			$data = $this->jsonformat(true, null,'customer',null, $token);
		} else {
			$data = $this->jsonformat(false,['error_code' => 1, 'error_message' => $customer['message']],'customer',null, null);
		}

		return response()->json($data, 401);
	}


}