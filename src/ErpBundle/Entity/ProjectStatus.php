<?php

namespace ErpBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * ProjectStatus
 */
class ProjectStatus
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $statusName;


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
     * Set statusName
     *
     * @param string $statusName
     * @return ProjectStatus
     */
    public function setStatusName($statusName)
    {
        $this->statusName = $statusName;

        return $this;
    }

    /**
     * Get statusName
     *
     * @return string 
     */
    public function getStatusName()
    {
        return $this->statusName;
    }
}
