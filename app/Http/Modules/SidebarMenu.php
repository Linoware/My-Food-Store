<?php

namespace App\Http\Modules;

class SidebarMenu{
    public function loadSidebarMenu()
    {
        return array(
            'Dashboard' => array(
                'children' => array(),
                'url' => '/dashboard',
                'icon' => 'fas fa-tachometer-alt'
            ),
            'Item' => array(
                'children' => array(
                    'View Item' => array(
                        'url' => '/item/list'
                    ),
                    'Add Item' => array(
                        'url' => '/item/create'
                    )
                ),
                'icon' => 'fas fa-box'
            ),
            'Restaurant' => array(
                'children' => array(
                    'View Restaurant' => array(
                        'url' => '/restaurant/list'
                    ),
                    'Add Restaurant' => array(
                        'url' => '/restaurant/create'
                    )
                ),
                'icon' => 'fas fa-home'
            ),
            'Financial' => array(
                'children' => array(
                    'Income' => array(
                        'url' => '/financial/income'
                    ),
                    'Settlement' => array(
                        'url' => '/financial/settlement'
                    ),
                    'Commission' => array(
                        'url' => '/financial/commission'
                    )
                ),
                'icon' => 'fas fa-money-check-alt'
            )
        );
    }
}