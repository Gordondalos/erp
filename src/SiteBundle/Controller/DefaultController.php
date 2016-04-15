<?php

namespace SiteBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class DefaultController extends Controller
{
    public function indexAction()
    {
        return $this->render('SiteBundle:Default:index.html.twig');
    }

    public function customersAction()
    {
        return $this->render('SiteBundle:Default:customers.html.twig');
    }

    public function partnersAction()
    {
        return $this->render('SiteBundle:Default:partners.html.twig');
    }

     public function portfoliosAction()
    {

        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('SiteBundle:Portfolio')->findAll();

        return $this->render('SiteBundle:Default:portfolio.html.twig', array(
            'entities' => $entities,
        ));
    }

     public function showPortfolioAction($id)
    {

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('SiteBundle:Portfolio')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Portfolio entity.');
        }


        return $this->render('SiteBundle:Default:showportfolio.html.twig', array(
            'entity'      => $entity,

        ));
    }



    public function colleagueAction()
    {
        return $this->render('SiteBundle:Default:colleague.html.twig');
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
