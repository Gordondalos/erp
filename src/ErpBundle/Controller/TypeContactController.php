<?php

namespace ErpBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ErpBundle\Entity\TypeContact;
use ErpBundle\Form\TypeContactType;

/**
 * TypeContact controller.
 *
 */
class TypeContactController extends Controller
{

    public function getAllType($em){
        $entities = $em->getRepository('ErpBundle:TypeContact')->findAll();
        return $entities;
    }

    /**
     * Lists all TypeContact entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('ErpBundle:TypeContact')->findAll();

        return $this->render('ErpBundle:TypeContact:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new TypeContact entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new TypeContact();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('typecontact_show', array('id' => $entity->getId())));
        }

        return $this->render('ErpBundle:TypeContact:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a TypeContact entity.
     *
     * @param TypeContact $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(TypeContact $entity)
    {
        $form = $this->createForm(new TypeContactType(), $entity, array(
            'action' => $this->generateUrl('typecontact_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new TypeContact entity.
     *
     */
    public function newAction()
    {
        $entity = new TypeContact();
        $form   = $this->createCreateForm($entity);

        return $this->render('ErpBundle:TypeContact:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a TypeContact entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:TypeContact')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find TypeContact entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:TypeContact:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing TypeContact entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:TypeContact')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find TypeContact entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:TypeContact:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a TypeContact entity.
    *
    * @param TypeContact $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(TypeContact $entity)
    {
        $form = $this->createForm(new TypeContactType(), $entity, array(
            'action' => $this->generateUrl('typecontact_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing TypeContact entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:TypeContact')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find TypeContact entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('typecontact_edit', array('id' => $id)));
        }

        return $this->render('ErpBundle:TypeContact:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a TypeContact entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ErpBundle:TypeContact')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find TypeContact entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('typecontact'));
    }

    /**
     * Creates a form to delete a TypeContact entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('typecontact_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
