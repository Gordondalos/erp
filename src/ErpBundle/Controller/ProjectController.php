<?php

namespace ErpBundle\Controller;

use Proxies\__CG__\ErpBundle\Entity\Issue;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ErpBundle\Entity\Project;
use ErpBundle\Form\ProjectType;

/**
 * Project controller.
 *
 */
class ProjectController extends Controller
{

    // Проекты Клиента
    public function getClientProject($em,$id){

        //  var_dump($id);
        $dql   = "SELECT u FROM ErpBundle:Project u WHERE u.client = ".$id."ORDER BY u.id Desc ";
        $query = $em->createQuery($dql);
        // var_dump($query);
        return $query->getResult();

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


    public function Alluser()
    {

        $us = new UsersController();
        $em = $this->getDoctrine()->getManager();
        $user = $us->getAllUserAction($em);
        $users = array();
        foreach ($user as $value) {
            $arr = (array)($value);

            $UserId = array_shift($arr);
            $UserName = array_shift($arr);
            $users += [$UserId => $UserName];
        }
        return $users;
    }





    public function getAllProject($em){
        $entities = $em->getRepository('ErpBundle:Project')->findAll();
        return $entities;
    }

    /**
     * Lists all Project entities.
     *
     */
    public function indexAction()
    {
        $em = $this->getDoctrine()->getManager();
        $users = $this->Alluser();
        $clients = $this->AllClient();

        $entities = $em->getRepository('ErpBundle:Project')->findAll();


//        var_dump($users);
        return $this->render('ErpBundle:Project:index.html.twig', array(
            'entities' => $entities,
            'users' => $users,
            'clients' => $clients,
        ));
    }

    /**
     * Creates a new Project entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Project();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);
            $em->flush();

            return $this->redirect($this->generateUrl('project_show', array('id' => $entity->getId())));
        }

        return $this->render('ErpBundle:Project:new.html.twig', array(
            'entity' => $entity,
            'form' => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Project entity.
     *
     * @param Project $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Project $entity)
    {
        // $em = $this->getDoctrine()->getManager();
        $users = $this->Alluser();
        $clients = $this->AllClient();


        //var_dump($clients);

        $DateCreate = new \DateTime('today');
        $DateCreate = $DateCreate->format('Y-m-d H:i');

        // var_dump($DateCreate);

        $form = $this->createForm(new ProjectType(), $entity, array(
            'action' => $this->generateUrl('project_create'),
            'method' => 'POST',
        ));

        //$form->add('dateCreate', $DateCreate );

        $form->add('projectManager', 'choice', array('label' => 'Выберете Менеджера',
            'multiple' => false,
            'choices' => $users,
        ));

        $form->add('projectCreator', 'choice', array('label' => 'Создатель проекта',
            'multiple' => false,
            'choices' => $users,
        ));


        $form->add('client', 'choice', array('label' => 'Выберете Клиента',
            'multiple' => false,
            'choices' => $clients,
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Project entity.
     *
     */
    public function newAction()
    {
        $entity = new Project();
        $form = $this->createCreateForm($entity);

        return $this->render('ErpBundle:Project:new.html.twig', array(
            'entity' => $entity,
            'form' => $form->createView(),
        ));
    }





    /**
     * Finds and displays a Project entity.
     *
     */
    public function showAction($id)
    {
        $em = $this->getDoctrine()->getManager();


        $issueObject = new IssueController();
        // список исполнителей
        $users = $this->Alluser();
        //список клиентов
        $clients = $this->AllClient();
        // статусы задач
        $statuses = $issueObject->AllStatuses($em);
        // список задач
        $issuearr = $issueObject->getIssueProject($em,$id);
        //Список контактов
        $contactObject = new ContactController();
        $contactProject = $contactObject->getAllContactProject($em,$id);
        $contactProjectDoer = $contactObject->getAllContactProjectDoer($em,$id);

        // типы контактов
        $types = $contactObject->AllTypeExt($em);

        $entity = $em->getRepository('ErpBundle:Project')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Project entity.');
        }


        $deleteForm = $this->createDeleteForm($id);



        return $this->render('ErpBundle:Project:show.html.twig', array(
            'entity' => $entity,
            'users' => $users,
            'clients' => $clients,
            'issuearr' => $issuearr,
            'statuses' => $statuses,
            'types' => $types,
            'contactProject' => $contactProject,
            'contactProjectDoer' => $contactProjectDoer,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Project entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Project')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Project entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:Project:edit.html.twig', array(
            'entity' => $entity,

            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Creates a form to edit a Project entity.
     *
     * @param Project $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createEditForm(Project $entity)
    {

        $users = $this->Alluser();
        $clients = $this->AllClient();
        $form = $this->createForm(new ProjectType(), $entity, array(
            'action' => $this->generateUrl('project_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));


        $form->add('projectManager', 'choice', array('label' => 'Выберите Менеджера',
            'multiple' => false,
            'choices' => $users,
        ));

        $form->add('projectCreator', 'choice', array('label' => 'Измените Автора',
            'multiple' => false,
            'choices' => $users,
        ));


        $form->add('client', 'choice', array('label' => 'Измените Клиента',
            'multiple' => false,
            'choices' => $clients,
        ));


        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }

    /**
     * Edits an existing Project entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Project')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Project entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('project_edit', array('id' => $id)));
        }

        return $this->render('ErpBundle:Project:edit.html.twig', array(
            'entity' => $entity,
            'edit_form' => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Deletes a Project entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ErpBundle:Project')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Project entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('project'));
    }

    /**
     * Creates a form to delete a Project entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('project_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm();
    }
}
