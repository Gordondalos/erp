<?php
//$em->persist($entity1); $em->persist($entity2); $em->flush();

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

    public function getCountProjectAction(){
        $em = $this->getDoctrine()->getManager();
        $AllProject = $em->getRepository('ErpBundle:Project')->findAll();

        $AllOpenProject = $em->getRepository('ErpBundle:Project')->findBy(array(
            'projectStatus'=>'1'
        ));

        $count = count($AllProject);
        $open = count($AllOpenProject);
        return $this->render('ErpBundle:Users:countProject.html.twig', array(
            'count' => $count,
            'open' => $open,
        ));
    }


    // Проекты текущего пользователя где id айдишник текущего пользователя в проектах
    public function getUserProject($em,$id,$all){

        if($all){
            $dql   = "SELECT u FROM ErpBundle:Project u WHERE (u.projectManager = ".$id." OR u.projectCreator = ".$id.") ORDER BY u.id Desc ";
            $query = $em->createQuery($dql);
            $result = $query->getResult();
        }else{
            $dql   = "SELECT u FROM ErpBundle:Project u WHERE  u.projectStatus != 3 AND (u.projectManager = ".$id." OR u.projectCreator = ".$id.") ORDER BY u.id Desc ";
            $query = $em->createQuery($dql);
            $result = $query->getResult();
        }
        return $result;
    }

    // id проектов где пользователь является автором задач или исполнителем, по айдишнику пользователя
    public function getUserIssueProject($em,$id,$all){

        $dql   = "SELECT DISTINCT (u.project) FROM ErpBundle:ProjectCommand u WHERE u.issueAutor = ".$id." OR u.issueExecutor = ".$id." ORDER BY u.id Asc ";
        $query = $em->createQuery($dql);
        $result = $query->getResult();

        if($all){
            $projectObj = Array();
            foreach ($result as $project){
                foreach($project as $value){

                    $dql = "SELECT u FROM ErpBundle:Project u WHERE  u.id =".$value." ORDER BY u.id Asc ";
                    $query = $em->createQuery($dql);
                    $projects = $query->getOneOrNullResult();

                    if($projects){
                        $projectObj[] = $projects;
                    }


                }

            }
        }else{
            $projectObj = Array();
            foreach ($result as $project){
                foreach($project as $value){

                    $dql = "SELECT u FROM ErpBundle:Project u WHERE u.projectStatus != 3 AND  u.id =".$value." ORDER BY u.id Asc ";
                    $query = $em->createQuery($dql);
                    $projects = $query->getOneOrNullResult();

                    if($projects){
                        $projectObj[] = $projects;
                    }


                }

            }
        }


        //var_dump($projectObj);
        //die;
        return $projectObj;
    }


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

            //print_r($value->getId());

            $UserId = $value->getId();
            $UserName = $value->getUsername();
            $users += [$UserId => $UserName];
        }
        return $users;
    }

    public function getAllProject($em){
        $entities = $em->getRepository('ErpBundle:Project')->findBy(array(
            'projectStatus'=>'1'
        ),
            array(
                'projectName' => 'ASC'
            )
            );
        return $entities;
    }

    public function getOneProject($em,$id){
        $entity = $em->getRepository('ErpBundle:Project')->find($id);
        return $entity;
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
        $usId  = $this->getUser()->getId();
        $rezultat = $this->getUserIssueProject($em,$usId,false);
        $rezult = $this->getUserProject($em,$usId,false);
         return $this->render('ErpBundle:Project:index.html.twig', array(
            'entities' => $rezult,
            'projectIssueExecutor' => $rezultat,
            'users' => $users,
            'clients' => $clients,
        ));
    }


    public function indexAllAction()
    {
        $em = $this->getDoctrine()->getManager();
        $users = $this->Alluser();
        $clients = $this->AllClient();
        $usId  = $this->getUser()->getId();
        $rezultat = $this->getUserIssueProject($em,$usId,true);
        $rezult = $this->getUserProject($em,$usId,true);
        return $this->render('ErpBundle:Project:indexAll.html.twig', array(
            'entities' => $rezult,
            'projectIssueExecutor' => $rezultat,
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
         $em = $this->getDoctrine()->getManager();
        $users = $this->Alluser();
        $clients = $this->AllClient();


        $projectTypeobgect = new ProjectTypeController();
        $projectType = $projectTypeobgect->GetAllTypeAction($em);


        $projectStatusobgect = new ProjectStatusController();
        $projectStatus  = $projectStatusobgect->getAllProjectStatus($em);


        $form = $this->createForm(new ProjectType(), $entity, array(
            'action' => $this->generateUrl('project_create'),
            'method' => 'POST',
        ));

        $form->add('projectName', 'text', array('label' => ' ',
            'required'    => true,
            'attr'=> array( 'placeholder' => 'Название Проекта', 'class'=>'name')

        ));
        $form->add('projectDescription', 'textarea', array('label' => 'Описание проекта',

        ));

        $DateCreate = new \DateTime('today');
        $form->add('dateCreate', 'datetime', array('label' => 'Дата',
            'data' => $DateCreate,
        ));

        $form->add('dateFinish', 'date', array('label' => 'Дата Окончания'));

        $form->add('projectType', 'choice', array('label' => 'Выберете Тип Проекта',
            'multiple' => false,
            'choices' => $projectType,
            'attr'=> array( 'class'=>'select')
        ));

        $form->add('projectStatus', 'choice', array('label' => 'Выберете Статус Проекта',
            'multiple' => false,
            'choices' => $projectStatus,
            'attr'=> array( 'class'=>'select')
        ));


        $form->add('projectManager', 'choice', array('label' => 'Выберете Менеджера',
            'multiple' => false,
            'choices' => $users,
            'attr'=> array( 'class'=>'select')
        ));

        $form->add('projectCreator', 'choice', array('label' => 'Создатель проекта',
            'multiple' => false,
            'choices' => $users,
            'attr'=> array( 'class'=>'select')
        ));


        $form->add('client', 'choice', array('label' => 'Выберете Клиента',
            'multiple' => false,
            'choices' => $clients,
            'attr'=> array( 'class'=>'select')
        ));

        $form->add('submit', 'submit', array('label' => 'Создать'));

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
        //var_dump($users);
        //список клиентов
        $clients = $this->AllClient();
        // статусы задач
        $statuses = $issueObject->AllStatuses($em);

        // получим айдишник текущего пользователяж
        $userId  = $this -> getUser()->getId();
        //var_dump($us);

        // список задач
        $issuearr = $issueObject->getIssueProject($em,$id,$userId);
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


       // var_dump($contactProject);

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

    public function show_project_issueAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $issueObject = new IssueController();
        // список исполнителей
        $users = $this->Alluser();
        //var_dump($users);
        //список клиентов
        $clients = $this->AllClient();
        // статусы задач
        $statuses = $issueObject->AllStatuses($em);

        // список задач
        $issuearr = $issueObject->getIssueProjectAll($em,$id);
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
        $em = $this->getDoctrine()->getManager();
       $projectStatusObj = new ProjectStatusController();
        $projectStatus = $projectStatusObj->getAllProjectStatus($em);
        $projectTypeobgect = new ProjectTypeController();
        $projectType = $projectTypeobgect->GetAllTypeAction($em);

       //var_dump($projectStatus);

        $users = $this->Alluser();
        $clients = $this->AllClient();

    //    echo "<br><br>";
     //   var_dump( $clients);

        $form = $this->createForm(new ProjectType(), $entity, array(
            'action' => $this->generateUrl('project_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));
        $form->add('projectName', 'text', array('label' => ' ',
            'required'    => true,
            'attr'=> array( 'placeholder' => 'Название Проекта', 'class'=>'name')

        ));
        $form->add('projectDescription', 'textarea', array('label' => 'Описание проекта',));

        $form->add('projectType', 'choice', array('label' => 'Выберете Тип Проекта',
            'multiple' => false,
            'choices' => $projectType,
            'attr'=> array( 'class'=>'select')
        ));


        $form->add('dateCreate', 'datetime', array('label' => 'Дата',));

        $form->add('dateFinish', 'datetime', array('label' => 'Дата Окончания'));


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

        $form->add('projectStatus', 'choice', array('label' => 'Выберите Статус',
            'multiple' => false,
            'choices' => $projectStatus,
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
