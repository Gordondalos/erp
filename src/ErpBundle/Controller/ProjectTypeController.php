<?php

namespace ErpBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ErpBundle\Entity\ProjectType;
use ErpBundle\Form\ProjectTypeType;

/**
 * ProjectType controller.
 *
 */
class ProjectTypeController extends Controller
{

    /**
     * Lists all ProjectType entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('ErpBundle:ProjectType')->findAll();

        return $this->render('ErpBundle:ProjectType:index.html.twig', array(
            'entities' => $entities,
        ));
    }
    /**
     * Creates a new ProjectType entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new ProjectType();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('projecttype_show', array('id' => $entity->getId())));
        }

        return $this->render('ErpBundle:ProjectType:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a ProjectType entity.
     *
     * @param ProjectType $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(ProjectType $entity)
    {
        $form = $this->createForm(new ProjectTypeType(), $entity, array(
            'action' => $this->generateUrl('projecttype_create'),
            'method' => 'POST',
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new ProjectType entity.
     *
     */
    public function newAction()
    {
        $entity = new ProjectType();
        $form   = $this->createCreateForm($entity);

        return $this->render('ErpBundle:ProjectType:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a ProjectType entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:ProjectType')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ProjectType entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:ProjectType:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing ProjectType entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:ProjectType')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ProjectType entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:ProjectType:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a ProjectType entity.
    *
    * @param ProjectType $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(ProjectType $entity)
    {
        $form = $this->createForm(new ProjectTypeType(), $entity, array(
            'action' => $this->generateUrl('projecttype_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing ProjectType entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:ProjectType')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find ProjectType entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('projecttype_edit', array('id' => $id)));
        }

        return $this->render('ErpBundle:ProjectType:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a ProjectType entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ErpBundle:ProjectType')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find ProjectType entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('projecttype'));
    }

    /**
     * Creates a form to delete a ProjectType entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('projecttype_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
