<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Carbon\Carbon;
use Illuminate\Support\Facades\Auth;
use App\User;
use Validator;
use JWTAuth;

class AuthController extends Controller
{
    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth:api', ['except' => ['login']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login()
    {

        $credentials = request(['customer_phone_number', 'password']);
		// JWTAuth::attempt($credentials, ['exp' => Carbon::now()->addSeconds(30)->timestamp]);
//        dd($credentials);
        if (!$token = auth('api')->attempt($credentials)) {

            return response()->json(['error' => 'Unauthorized'], 401);

        }else{

            $user_data = $this->guard()->user();
            $user = User::find($user_data->id);


//            if($user->remember_token != '' || $user->remember_token !== null){
//
//                return response()->json(['error' => 'Locked'], 203);
//
//            }else{

//                $user->remember_token = substr($token,0,32);
//                $user->save();
                return $this->respondWithToken($token);

//            }

        }

    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function me()
    {
        return response()->json(auth('api')->user());
    }

    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout()
    {
        auth('api')->logout();

        return response()->json(['message' => 'Successfully logged out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh()
    {
        return $this->respondWithToken(auth('api')->refresh());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function respondWithToken($token)
    {
        return response()->json([
            'access_token' => $token,
            'user' => $this->guard()->user(),
            'token_type' => 'bearer',
            'status' => '1',
            'expires_in' => auth('api')->factory()->getTTL()
        ]);
    }

    public function guard() {
        return \Auth::Guard('api');
    }
}
