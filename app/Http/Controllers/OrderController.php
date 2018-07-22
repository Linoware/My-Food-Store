<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Modules\JsonResponseFormat;


class OrderController extends Controller
{
	use JsonResponseFormat;

	public function create()
	{
		// $data = $this->jsonformat(false,['error_code' => 1, 'error_message' => 'Authentication failed'],'profiles',null, $token);
		$data = [
			'key' => 'value',
		];

		return response()->json($data, 401);
	}


}