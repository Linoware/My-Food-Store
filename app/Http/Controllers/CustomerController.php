<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use App\Http\Modules\JsonResponseFormat;
use JWTAuth;
use App\Customer;
use App\Country;


class CustomerController extends Controller
{

    use JsonResponseFormat;

    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['customerLogin','reLogin','updateCustomerProfiles','uploadCustomerPhoto']]);
    }

    public function customerLogin(Request $request){

//            return response()->json($request);

        if(!empty($request)){

            $customer_code= substr($request['customer_phone_number'],0,1) == '0' ? '855'.substr($request['customer_phone_number'],1) : $request['customer_phone_number'];

            $country_id = Country::where('country_code',$request['country_code'])->first(['country_id']);

            $customer_exist = Customer::where('customer_phone_number',$request['customer_phone_number'])->first(['customer_id']);

            $customer_id = '';

            if(empty($customer_exist)){

                $customer_data['customer_phone_number'] = $request['customer_phone_number'];
//                $customer_data['customer_code'] = $customer_code;
                $customer_data['country_id'] = $country_id['country_id'];
                $customer_data['country_code'] = $request['country_code'];
                $customer_data['password'] = bcrypt($request['password']);
                $customer_data['last_login_date'] = date('Y-m-d H:i:s');

                $create_customer = Customer::create($customer_data);

                $customer_id = $create_customer->customer_id;

            }else{

                $customer_id = $customer_exist['customer_id'];

            }

            $credentials = request(['customer_phone_number', 'password']);

            if (!$token = auth('api')->attempt($credentials)) {

                $response = $this->jsonformat(false,['error_code' => 1, 'error_message' => 'Authentication failed'],'profiles',null, $token);

                return response()->json($response, 401);


            }else{

                $customer_token = Customer::find($customer_id);

                $customer_token->remember_token = $token;
                $customer_token->last_login_date = date('Y-m-d H:i:s');

                $customer_token->save();



                $profiles[0]['last_login_date'] = $this->utcToLocalDateTime($customer_token['last_login_date'], $request['time_zone']);

                $response = $this->jsonformat(true,['error_code' => 0, 'error_message' => 'authentication success'],'profiles', $customer_token, $token);

            }
        }else{

            $response = $this->jsonformat(false,['error_code' => 2, 'error_message' => 'Invalid Request'],'profiles');

        }

        return response()->json($response);

    }

    public function reLogin(Request $request)
    {

       $customer_verify_token = Customer::where('remember_token',$request['token'])->first();

        if(!empty($customer_verify_token)){

            $credentials['customer_phone_number'] = $customer_verify_token->customer_phone_number;
            $credentials['password'] = 'SYSTEM';
            if (!$token = auth('api')->attempt($credentials)) {

                $response = $this->jsonformat(false,['error_code' => 1, 'error_message' => 'Authentication failed'],'profiles',null, $token);

                return response()->json($response, 401);

            }else{

                $customer_token = Customer::find($customer_verify_token->customer_id);

                $customer_token->remember_token = $token;
                $customer_token->last_login_date = date('Y-m-d H:i:s');

                $customer_token->save();

                $profiles[0]['last_login_date'] = $this->utcToLocalDateTime($customer_token['last_login_date'], $request['time_zone']);

                $response = $this->jsonformat(true,['error_code' => 0, 'error_message' => 'authentication success'],'profiles',$customer_token, $token);

            }
        }else{
            $response = $this->jsonformat(false,['error_code' => 3, 'error_message' => 'Invalid token or token has been expired'],'profiles');
        }

        return response()->json($response);

    }

    public function updateCustomerProfiles(Request $request)
    {
        $header = $request->header('Authorization');

        $token = str_replace('Bearer ','',$header);

        $customer = Customer::where('remember_token',$token)->first();

        if(!empty($customer)){

            $customer->customer_full_name = $request['customer_full_name'];
            $customer->customer_email = $request['customer_email'];
            $customer->customer_photo = $request['customer_photo'];
            $customer->save();

            $profiles = Customer::find($customer->customer_id);

            $response = $this->jsonformat(true,['error_code' => 0, 'error_message' => 'authentication success'],'profiles',$profiles, $token);

        }else{

            $response = $this->jsonformat(false,['error_code' => 4, 'error_message' => 'Invalid request, customer profile cannot update'],'profiles');

        }

        return response()->json($response);

    }

    public function uploadCustomerPhoto(Request $request)
    {
        return response()->json($request->all());
    }

    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {

        $token_key = str_random(16);
        return response()->json(Hash::make($token_key));
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

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
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function show(Customer $customer)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function edit(Customer $customer)
    {
        //
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, Customer $customer)
    {
        //
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  \App\Customer  $customer
     * @return \Illuminate\Http\Response
     */
    public function destroy(Customer $customer)
    {
        //
    }

    public function customerRegister(Request $request)
    {
        return response()->json($request);
    }

    private function utcToLocalDateTime($date_string, $time_zone)
    {
        $date = date_create($date_string. ' +00', timezone_open($time_zone));

        date_timezone_set($date, timezone_open($time_zone));

        $localDate = date_format($date, "Y-m-d H:i:s");

        return $localDate;
    }

    public function guard() {
        return \Auth::Guard('api');
    }

}
