<?php

namespace ErpBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ErpBundle\Entity\Users;
use ErpBundle\Form\UsersType;

/**
 * Users controller.
 *
 */
class UsersController extends Controller
{

    public function getAllUserAction($em){
        $AllUser = $em->getRepository('ErpBundle:Users')->findAll();
        return $AllUser;
    }

    /**
     * Lists all Users entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('ErpBundle:Users')->findAll();

        $ut = new RoleController();
        $role = $ut->allRoleAction($em);
        $roles = array();
        foreach ($role as $value ) {
            $arr = (array)($value);
            $roleId = array_shift($arr);
            $roleName = array_shift($arr);
            $roles += [$roleId => $roleName];

        }
       // var_dump($roles);

        return $this->render('ErpBundle:Users:index.html.twig', array(
            'entities' => $entities,
            'roles' => $roles,
        ));
    }
    /**
     * Creates a new Users entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Users();
        $form = $this->createCreateForm($entity);


        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('users_show', array('id' => $entity->getId())));
        }

        return $this->render('ErpBundle:Users:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Users entity.
     *
     * @param Users $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Users $entity)
    {

        $ut = new RoleController();
        $em = $this->getDoctrine()->getManager();
        $role = $ut->allRoleAction($em);
        $roles = array();
        foreach ($role as $value ) {
            $arr = (array)($value);
            $roleId = array_shift($arr);
            $roleName = array_shift($arr);
            $roles += [$roleId => $roleName];

        }

     //   var_dump($roles);
        $form = $this->createForm(new UsersType(), $entity, array(

            'action' => $this->generateUrl('users_create'),
            'method' => 'POST',
        ));


        $form->add('role', 'choice', array('label' => 'Выберите роль',
            'multiple' => false,
            'choices' => $roles,
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Users entity.
     *
     */
    public function newAction()
    {
        $entity = new Users();
        $form   = $this->createCreateForm($entity);

        return $this->render('ErpBundle:Users:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Users entity.
     *
     */
    public function showAction($id)
    {
        $ut = new RoleController();
        $em = $this->getDoctrine()->getManager();
        $role = $ut->allRoleAction($em);
        $roles = array();
        foreach ($role as $value ) {
            $arr = (array)($value);
            $roleId = array_shift($arr);
            $roleName = array_shift($arr);
            $roles += [$roleId => $roleName];

        }

        $entity = $em->getRepository('ErpBundle:Users')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Users entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:Users:show.html.twig', array(
            'entity'      => $entity,
            'delete_form' => $deleteForm->createView(),
            'roles' => $roles,
        ));
    }

    /**
     * Displays a form to edit an existing Users entity.
     *
     */
    public function editAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();



        $entity = $em->getRepository('ErpBundle:Users')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Users entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:Users:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Users entity.
    *
    * @param Users $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Users $entity)
    {

        $ut = new RoleController();
        $em = $this->getDoctrine()->getManager();
        $role = $ut->allRoleAction($em);
        $roles = array();
        foreach ($role as $value ) {
            $arr = (array)($value);
            $roleId = array_shift($arr);
            $roleName = array_shift($arr);
            $roles += [$roleId => $roleName];

        }
//var_dump($roles);


        $form = $this->createForm(new UsersType(), $entity, array(
            'action' => $this->generateUrl('users_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));

        $form->add('roless', 'choice', array('label' => 'Выберите роль',
            'multiple' => false,
            'choices' => $roles,
            'mapped'=>false
        ));


        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Users entity.
     *
     */
    public function updateAction(Request $request, $id)
    {

        //var_dump($_POST, $request->request->get('erpbundle_users')['roless']);die;
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Users')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Users entity.');
        }



        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $entity->setRoles(array($request->request->get('erpbundle_users')['roless']));
            $em->flush();

            return $this->redirect($this->generateUrl('users_edit', array('id' => $id)));
        }

        return $this->render('ErpBundle:Users:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Users entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ErpBundle:Users')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Users entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('users'));
    }

    /**
     * Creates a form to delete a Users entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('users_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
