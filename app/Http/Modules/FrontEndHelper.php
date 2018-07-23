<?php

namespace App\Http\Modules;

trait FrontEndHelper{
    public function reloadView($view, $data)
    {
        return view($view, $data);
    }
}