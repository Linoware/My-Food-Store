<?php

namespace App\Http\Controllers;

// use Illuminate\Http\Request;
use App\Http\Modules\JsonResponseFormat;

use App\Customer;


class ApiBaseController extends Controller
{
	use JsonResponseFormat;

	protected function auth($token = null)
	{
		if (!$token) {
			return [
				'status' => false,
				'message' => 'token null'
			];
		}
		$customer = Customer::where('remember_token', $token)
							->where('enable_status', config('customer.status.enable'))
							->first();
		if ($customer) {
			return [
				'status' => true,
				'message' => '',
				'data'	=> $customer,
			];
		} else {
			return [
				'status' => false,
				'message' => 'No user',
			];
		}
	}


}