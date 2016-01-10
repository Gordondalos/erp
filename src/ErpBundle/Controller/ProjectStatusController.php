<?php

namespace ErpBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ErpBundle\Entity\ProjectStatus;
use ErpBundle\Form\ProjectStatusType;

/**
 * ProjectStatus controller.
 *
 */
class ProjectStatusController extends Controller
{

    public function getAllProjectStatus($em){
        $entities = $em->getRepository('ErpBundle:ProjectStatus')->findAll();
        $status = array();
        foreach ($entities as $value) {

           // print_r($value->getId());

            $StatusId = $value->getId();
            $StatusName = $value->getStatusName();
            $status += [$StatusId => $StatusName];
        }
        return $status;



    }


    /**
     * Lists all ProjectStatus entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('ErpBundle:ProjectStatus')->findAll();

        return $this->render('ErpBundle:ProjectStatus:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new ProjectStatus entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new ProjectStatus();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('projectstatus_show', array('id' => $entity->getId())));
        }

        return $this->render('ErpBundle:ProjectStatus:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a ProjectStatus entity.
     *
     * @param ProjectStatus $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(ProjectStatus $entity)
    {
        $form = $this->createForm(new ProjectStatusType(), $entity, array(
            'action' => $this->generateUrl('projectstatus_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new ProjectStatus entity.
     *
     */
    public function newAction()
    {
        $entity = new ProjectStatus();
        $form   = $this->createCreateForm($entity);

        return $this->render('ErpBundle:ProjectStatus:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ProjectStatus entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:ProjectStatus')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ProjectStatus entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:ProjectStatus:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ProjectStatus entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:ProjectStatus')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ProjectStatus entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:ProjectStatus:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a ProjectStatus entity.
    *
    * @param ProjectStatus $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(ProjectStatus $entity)
    {
        $form = $this->createForm(new ProjectStatusType(), $entity, array(
            'action' => $this->generateUrl('projectstatus_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing ProjectStatus entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:ProjectStatus')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ProjectStatus entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('projectstatus_edit', array('id' => $id)));
        }

        return $this->render('ErpBundle:ProjectStatus:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a ProjectStatus entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ErpBundle:ProjectStatus')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find ProjectStatus entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('projectstatus'));
    }

    /**
     * Creates a form to delete a ProjectStatus entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('projectstatus_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
