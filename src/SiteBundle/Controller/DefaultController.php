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

    public function digitalAction()
    {
        return $this->render('SiteBundle:Portfolio:digital.html.twig');
    }

    public function ereportAction()
    {
        return $this->render('SiteBundle:Portfolio:ereport.html.twig');
    }

    public function partnersAction()
    {
        return $this->render('SiteBundle:Default:partners.html.twig');
    }

    public function perilaAction()
    {
        return $this->render('SiteBundle:Portfolio:perila.html.twig');
    }

    public function portfolioAction()
    {
        return $this->render('SiteBundle:Default:portfolio.html.twig');
    }

    public function seAction()
    {
        return $this->render('SiteBundle:Portfolio:se.html.twig');
    }

    public function superlativeAction()
    {
        return $this->render('SiteBundle:Portfolio:superlative.html.twig');
    }

    public function tandemAction()
    {
        return $this->render('SiteBundle:Portfolio:tandem.html.twig');
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

    public function baltspecservisAction()
    {
        return $this->render('SiteBundle:Portfolio:baltspecservise.html.twig');
    }

    public function cdiAction()
    {
        return $this->render('SiteBundle:Portfolio:cdi.html.twig');
    }
}
