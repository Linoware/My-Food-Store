<?php

namespace App;

use Tymon\JWTAuth\Contracts\JWTSubject;
use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class Customer extends Authenticatable implements JWTSubject
{

    use Notifiable;

    protected $table = 'customers';
    protected $primaryKey = 'customer_id';

    public $timestamp = false;

    protected $fillable = [
        'customer_phone_number',
        'remember_token',
        'country_id',
        'customer_code',
        'country_code',
        'customer_full_name',
        'customer_email',
        'customer_photo',
        'password',
        'customer_enable',
        'last_login_date'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token'
    ];

    public $timestamps = false;

    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier()
    {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims()
    {
        return [];
    }

}
