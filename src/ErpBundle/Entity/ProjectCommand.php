<?php

namespace ErpBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ProjectCommand
 */
class ProjectCommand
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var integer
     */
    private $user;

    /**
     * @var integer
     */
    private $project;


    /**
     * Get id
     *
     * @return integer 
     */
    public function getId()
    {
        return $this->id;
    }

    /**
     * Set user
     *
     * @param integer $user
     * @return ProjectCommand
     */
    public function setUser($user)
    {
        $this->user = $user;

        return $this;
    }

    /**
     * Get user
     *
     * @return integer 
     */
    public function getUser()
    {
        return $this->user;
    }

    /**
     * Set project
     *
     * @param integer $project
     * @return ProjectCommand
     */
    public function setProject($project)
    {
        $this->project = $project;

        return $this;
    }

    /**
     * Get project
     *
     * @return integer 
     */
    public function getProject()
    {
        return $this->project;
    }
}
