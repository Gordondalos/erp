<?php

namespace ErpBundle\Controller;

use Symfony\Component\HttpFoundation\Request;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;

use ErpBundle\Entity\Issue;
use ErpBundle\Form\IssueType;

/**
 * Issue controller.
 *
 */
class IssueController extends Controller
{

    public function getIssueProject( $em, $id){

      //  var_dump($id);
        $dql   = "SELECT u FROM ErpBundle:Issue u WHERE u.project = ".$id."ORDER BY u.id ASC ";
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
            $UserId = array_shift($arr);
            $UserName = array_shift($arr);
            $projects += [$UserId => $UserName];
        }
        return  $projects;
    }


    public function AllStatus(){
        $us = new IssueStatusController();
        $em = $this->getDoctrine()->getManager();
        $status = $us->getAllStatus($em);
        $statuses = array();
        foreach ($status as $value ) {
            $arr = (array)($value);
            $UserId = array_shift($arr);
            $UserName = array_shift($arr);
            $statuses += [$UserId => $UserName];
        }
        return  $statuses;
    }

    public function AllStatuses($em){
        $us = new IssueStatusController();
        $status = $us->getAllStatus($em);
        $statuses = array();
        foreach ($status as $value ) {
            $arr = (array)($value);
            $UserId = array_shift($arr);
            $UserName = array_shift($arr);
            $statuses += [$UserId => $UserName];
        }
        return  $statuses;
    }




    /**
     * Lists all Issue entities.
     *
     */
    public function indexAction()
    {

        $projects = $this->AllProject();
        $users = $this->Alluser();
        $statuses = $this->AllStatus();


//        var_dump($projects);
        $em = $this->getDoctrine()->getManager();

        $entities = $em->getRepository('ErpBundle:Issue')->findAll();

        return $this->render('ErpBundle:Issue:index.html.twig', array(
            'entities' => $entities,
            'users' => $users,
            'statuses' => $statuses,
            'projects' => $projects,
        ));
    }
    /**
     * Creates a new Issue entity.
     *
     */
    public function createAction(Request $request)
    {
        $entity = new Issue();
        $form = $this->createCreateForm($entity);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $em->persist($entity);




            $em->flush();

            $issue = $entity->getId();
            $project = $entity->getProject();
            $issueExecutor = $entity->getissueExecutor();
            $issueAutor = $entity->getissueAutor();




            var_dump($entity); die;



            return $this->redirect($this->generateUrl('issue_show', array('id' => $entity->getId())));
        }

        return $this->render('ErpBundle:Issue:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Creates a form to create a Issue entity.
     *
     * @param Issue $entity The entity
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createCreateForm(Issue $entity)
    {

        $projects = $this->AllProject();
        $users = $this->Alluser();
        $statuses = $this->AllStatus();

        $form = $this->createForm(new IssueType(), $entity, array(
            'action' => $this->generateUrl('issue_create'),
            'method' => 'POST',
        ));


        $form->add('issueAutor', 'choice', array('label' => 'Создатель Задачи',
            'multiple' => false,
            'choices' => $users,
        ));

        $form->add('issueExecutor', 'choice', array('label' => 'Исполнитель',
            'multiple' => false,
            'choices' => $users,
        ));


        $form->add('status', 'choice', array('label' => 'Статус задачи',
            'multiple' => false,
            'choices' => $statuses,
        ));

        $form->add('project', 'choice', array('label' => 'Проект',
            'multiple' => false,
            'choices' =>  $projects,
        ));

        $form->add('submit', 'submit', array('label' => 'Create'));

        return $form;
    }

    /**
     * Displays a form to create a new Issue entity.
     *
     */
    public function newAction()
    {
        $entity = new Issue();
        $form   = $this->createCreateForm($entity);

        return $this->render('ErpBundle:Issue:new.html.twig', array(
            'entity' => $entity,
            'form'   => $form->createView(),
        ));
    }

    /**
     * Finds and displays a Issue entity.
     *
     */
    public function showAction($id)
    {
        $projects = $this->AllProject();
        $users = $this->Alluser();
        $statuses = $this->AllStatus();

        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Issue')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Issue entity.');
        }

        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:Issue:show.html.twig', array(
            'entity'      => $entity,
            'projects'      => $projects,
            'users'      => $users,
            'statuses'      => $statuses,
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
     * Displays a form to edit an existing Issue entity.
     *
     */
    public function editAction($id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Issue')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Issue entity.');
        }

        $editForm = $this->createEditForm($entity);
        $deleteForm = $this->createDeleteForm($id);

        return $this->render('ErpBundle:Issue:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }

    /**
    * Creates a form to edit a Issue entity.
    *
    * @param Issue $entity The entity
    *
    * @return \Symfony\Component\Form\Form The form
    */
    private function createEditForm(Issue $entity)
    {

        $projects = $this->AllProject();
        $users = $this->Alluser();
        $statuses = $this->AllStatus();

        $form = $this->createForm(new IssueType(), $entity, array(
            'action' => $this->generateUrl('issue_update', array('id' => $entity->getId())),
            'method' => 'PUT',
        ));


        $form->add('issueAutor', 'choice', array('label' => 'Создатель Задачи',
            'multiple' => false,
            'choices' => $users,
        ));

        $form->add('issueExecutor', 'choice', array('label' => 'Исполнитель',
            'multiple' => false,
            'choices' => $users,
        ));


        $form->add('status', 'choice', array('label' => 'Статус задачи',
            'multiple' => false,
            'choices' => $statuses,
        ));

        $form->add('project', 'choice', array('label' => 'Проект',
            'multiple' => false,
            'choices' =>  $projects,
        ));

        $form->add('submit', 'submit', array('label' => 'Update'));

        return $form;
    }
    /**
     * Edits an existing Issue entity.
     *
     */
    public function updateAction(Request $request, $id)
    {
        $em = $this->getDoctrine()->getManager();

        $entity = $em->getRepository('ErpBundle:Issue')->find($id);

        if (!$entity) {
            throw $this->createNotFoundException('Unable to find Issue entity.');
        }

        $deleteForm = $this->createDeleteForm($id);
        $editForm = $this->createEditForm($entity);
        $editForm->handleRequest($request);

        if ($editForm->isValid()) {
            $em->flush();

            return $this->redirect($this->generateUrl('issue_edit', array('id' => $id)));
        }

        return $this->render('ErpBundle:Issue:edit.html.twig', array(
            'entity'      => $entity,
            'edit_form'   => $editForm->createView(),
            'delete_form' => $deleteForm->createView(),
        ));
    }
    /**
     * Deletes a Issue entity.
     *
     */
    public function deleteAction(Request $request, $id)
    {
        $form = $this->createDeleteForm($id);
        $form->handleRequest($request);

        if ($form->isValid()) {
            $em = $this->getDoctrine()->getManager();
            $entity = $em->getRepository('ErpBundle:Issue')->find($id);

            if (!$entity) {
                throw $this->createNotFoundException('Unable to find Issue entity.');
            }

            $em->remove($entity);
            $em->flush();
        }

        return $this->redirect($this->generateUrl('issue'));
    }

    /**
     * Creates a form to delete a Issue entity by id.
     *
     * @param mixed $id The entity id
     *
     * @return \Symfony\Component\Form\Form The form
     */
    private function createDeleteForm($id)
    {
        return $this->createFormBuilder()
            ->setAction($this->generateUrl('issue_delete', array('id' => $id)))
            ->setMethod('DELETE')
            ->add('submit', 'submit', array('label' => 'Delete'))
            ->getForm()
        ;
    }
}
