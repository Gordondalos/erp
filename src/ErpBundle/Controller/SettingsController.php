<?php

namespace ErpBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class SettingsController extends Controller
{
    public function indexAction()
    {
        return $this->render('ErpBundle:Default:settings.html.twig');
    }
}
