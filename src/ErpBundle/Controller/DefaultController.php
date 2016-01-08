<?php

namespace ErpBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('ErpBundle:Default:index.html.twig');
    }


    public function hooImAction(){
        $us  = $this->getUser();
        //var_dump($us); die;

        return $this->render('ErpBundle:Default:user.html.twig', array(
            'us' => $us,
        ));
    }


}
