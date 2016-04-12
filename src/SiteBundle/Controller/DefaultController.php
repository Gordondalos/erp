<?php

namespace SiteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('SiteBundle:Default:index.html.twig');
    }

    public function comandosAction()
    {
        $em = $this->getDoctrine()->getManager();
        $entities = $em->getRepository('ErpBundle:Users')->findAll();

        return $this->render('SiteBundle:Default:comandos.html.twig', array(
            'entities' => $entities,

        ));


    }
}
