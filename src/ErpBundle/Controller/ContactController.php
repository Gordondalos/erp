<?php

namespace ErpBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ErpBundle\Entity\Contact;
use ErpBundle\Form\ContactType;

/**
 * Contact controller.
 *
 */
class ContactController extends Controller
{
    public function getAllContactProject($em,$id_project){
        //  var_dump($id);
        $dql   = "SELECT u FROM ErpBundle:Contact u WHERE u.project = ".$id_project." And u.client != 0 ORDER BY u.date desc ";
        $query = $em->createQuery($dql);
        // var_dump($query);
        return $query->getResult();
    }
    public function getAllContactProjectDoer($em,$id_project){
        //  var_dump($id);
        $dql   = "SELECT u FROM ErpBundle:Contact u WHERE u.project = ".$id_project." And u.userDoer != 0 ORDER BY u.date desc ";
        $query = $em->createQuery($dql);
        // var_dump($query);
        return $query->getResult();
    }

    public function Alluser(){
        $us = new UsersController();
        $em = $this->getDoctrine()->getManager();
        $user = $us->getAllUserAction($em);
        $users = array();
        foreach ($user as $value ) {
            $arr = (array)($value);
            $UserId = $value->getId();
            $UserName = $value->getUsername();
            $users += [$UserId => $UserName];
        }
        return  $users;
    }


    public function AllProject(){
        $us = new ProjectController();
        $em = $this->getDoctrine()->getManager();
        $project = $us->getAllProject($em);
        $projects = array();
        foreach ($project as $value ) {
            $arr = (array)($value);
            $projectId = array_shift($arr);
            $projectName = array_shift($arr);
            $projects += [$projectId => $projectName];
        }
        return  $projects;
    }


    public function AllTypeExt($em){
        $us = new TypeContactController();
        $type = $us->getAllType($em);
        $types= array();
        foreach ($type  as $value ) {
            $arr = (array)($value);
            $typeId = array_shift($arr);
            $typeName = array_shift($arr);
            $types += [$typeId => $typeName];
        }
        return  $types;
    }


    public function AllType(){
        $us = new TypeContactController();
        $em = $this->getDoctrine()->getManager();
        $type = $us->getAllType($em);
        $types= array();
        foreach ($type  as $value ) {
            $arr = (array)($value);
            $typeId = array_shift($arr);
            $typeName = array_shift($arr);
            $types += [$typeId => $typeName];
        }
        return  $types;
    }


    public function AllClient()
    {
        $em = $this->getDoctrine()->getManager();
        $us = new ClientController();
        $client = $us->getAllClientAction($em);
        $clients = array();
        foreach ($client as $value) {
            $arr = (array)($value);

            $clientId = array_shift($arr);
            $clientName = array_shift($arr);
            $clients += [$clientId => $clientName];
        }
        return $clients;

    }


    /**
     * Lists all Contact entities.
     *
     */
    public function indexAction()
    {

        $projects = $this->AllProject();
        $users = $this->Alluser();
        $types = $this->AllType();
        $clients = $this->AllClient();

        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('ErpBundle:Contact')->findAll();

        return $this->render('ErpBundle:Contact:index.html.twig', array(
            'entities' => $entities,
            'projects' => $projects,
            'users' => $users,
            'clients' => $clients,
            'types' => $types,
        ));
    }
    /**
     * Creates a new Contact entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Contact();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('contact_show', array('id' => $entity->getId())));
        }

        return $this->render('ErpBundle:Contact:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Contact entity.
     *
     * @param Contact $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Contact $entity)
    {
        $projects = $this->AllProject();
        $users = $this->Alluser();
        $types = $this->AllType();
        $clients = $this->AllClient();
        $epmtyarr = array("");
        $clients = $epmtyarr + $clients;  // array_merge($epmtyarr, $clients);
        $users = $epmtyarr + $users;   //array_merge($epmtyarr, $users);
        $form = $this->createForm(new ContactType(), $entity, array(
            'action' => $this->generateUrl('contact_create'),
            'method' => 'POST',
        ));
        $form->add('client', 'choice', array('label' => 'Выберите клиента',
            'multiple' => false,
            'choices' => $clients,
        ));
        $form->add('user', 'choice', array('label' => 'Автор сообщения',
            'multiple' => false,
            'choices' => $users,
        ));
        $form->add('type', 'choice', array('label' => 'Тип Сообщения',
            'multiple' => false,
            'choices' => $types,
        ));
        $form->add('userDoer', 'choice', array('label' => 'Исполнитель Сообщения',
            'multiple' => false,
            'choices' => $users,
        ));
        $form->add('project', 'choice', array('label' => 'Проект',
            'multiple' => false,
            'choices' => $projects,
        ));
        $form->add('desctiption', 'textarea', array('label' => 'Описание'));
        $form->add('nextDateContact', 'datetime', array('label' => 'Дата следующего контакта'));


        $form->add('submit', 'submit', array('label' => 'Создать'));

        return $form;
    }

    /**
     * Displays a form to create a new Contact entity.
     *
     */
    public function newAction()
    {
        $entity = new Contact();
        $form   = $this->createCreateForm($entity);

        return $this->render('ErpBundle:Contact:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Contact entity.
     *
     */
    public function showAction($id)
    {
        $projects = $this->AllProject();
        $users = $this->Alluser();
        $types = $this->AllType();
        $clients = $this->AllClient();
        $em = $this->getDoctrine()->getManager();
        $entity = $em->getRepository('ErpBundle:Contact')->find($id);
        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Contact entity.');
        }
        $deleteForm = $this->createDeleteForm($id);
        return $this->render('ErpBundle:Contact:show.html.twig', array(
            'entity'      => $entity,
            'projects' => $projects,
            'users' => $users,
            'clients' => $clients,
            'types' => $types,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Contact entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Contact')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Contact entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:Contact:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Contact entity.
    *
    * @param Contact $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Contact $entity)
    {

        $projects = $this->AllProject();
        $users = $this->Alluser();
        $types = $this->AllType();
        $clients = $this->AllClient();


        $epmtyarr = array("");
        $clients = $epmtyarr + $clients;  // array_merge($epmtyarr, $clients);
        $users = $epmtyarr + $users;   //array_merge($epmtyarr, $users););


        $form = $this->createForm(new ContactType(), $entity, array(
            'action' => $this->generateUrl('contact_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));


        $form->add('client', 'choice', array('label' => 'Выберите клиента',
            'multiple' => false,
            'choices' => $clients,
        ));


        $form->add('user', 'choice', array('label' => 'Автор сообщения',
            'multiple' => false,
            'choices' => $users,
        ));

        $form->add('type', 'choice', array('label' => 'Тип Сообщения',
            'multiple' => false,
            'choices' => $types,
        ));


        $form->add('userDoer', 'choice', array('label' => 'Исполнитель Сообщения',
            'multiple' => false,
            'choices' => $users,
        ));

        $form->add('project', 'choice', array('label' => 'Проект',
            'multiple' => false,
            'choices' => $projects,
        ));


        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Contact entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Contact')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Contact entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('contact_edit', array('id' => $id)));
        }

        return $this->render('ErpBundle:Contact:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Contact entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ErpBundle:Contact')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Contact entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('contact'));
    }

    /**
     * Creates a form to delete a Contact entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('contact_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
