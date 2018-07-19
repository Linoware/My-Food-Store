<?php

namespace App\Http\Modules;

trait JsonResponseFormat{
    public function jsonformat($success, $error, $data_name, $data = null, $token = null){
        $response = array(
            'success' => $success,
            'errors' => [$error],
            'payload' => array(
                'data' => array(
                    $data_name => $data,
                    'authentications' => array(
                        'token' => $token,
                        'authorize' => 'CL Air Express',
                        'date' => date('Y-m-d H:i:s')
                    )
                )
            )
        );

        return $response;
    }

    public function jsonDataFormat($success, $error, $data = array())
    {
        $response = array(
            'success' => $success,
            'errors' => [$error],
            'payload' => array(
                'data' => $data
            )
        );

        return $response;
    }
}