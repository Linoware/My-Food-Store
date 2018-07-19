<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Modules\JsonResponseFormat;

class UploadImageController extends Controller
{

    use JsonResponseFormat;

    public function uploadImage(Request $request)
    {

        $dir = 'assets/images/'.$request['customer_status'];

        $rights=0777;

        if (!is_dir($dir) && strlen($dir) > 0){
            mkdir($dir, $rights);
        }

        $image = array();

        foreach ($_FILES["files"]["error"] as $key => $error) {
            if ($error == UPLOAD_ERR_OK) {
                $tmp_name = $_FILES["files"]["tmp_name"][$key];
                $name = basename($_FILES["files"]["name"][$key]);
                $name = str_replace($name,uniqid().".jpg",$name);
                move_uploaded_file($tmp_name, "$dir/$name");
            }

            $image[] = array('image_path' => $dir.'/'.$name);

        }

        $response = $this->jsonformat(true,['error_code' => 0, 'error_message' => 'Image Upload successfully'],'images', $image);

        return response()->json($response);
    }
}
