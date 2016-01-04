<?php

namespace ErpBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('ErpBundle:Default:index.html.twig');
    }
}
