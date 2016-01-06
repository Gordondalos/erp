<?php

namespace ErpBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Comment
 */
class Comment
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $text;

    /**
     * @var integer
     */
    private $issueId;


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
     * Set text
     *
     * @param string $text
     * @return Comment
     */
    public function setText($text)
    {
        $this->text = $text;

        return $this;
    }

    /**
     * Get text
     *
     * @return string 
     */
    public function getText()
    {
        return $this->text;
    }

    /**
     * Set issueId
     *
     * @param integer $issueId
     * @return Comment
     */
    public function setIssueId($issueId)
    {
        $this->issueId = $issueId;

        return $this;
    }

    /**
     * Get issueId
     *
     * @return integer 
     */
    public function getIssueId()
    {
        return $this->issueId;
    }
    /**
     * @var integer
     */
    private $projectId;

    /**
     * @var \DateTime
     */
    private $date;

    /**
     * @var integer
     */
    private $user;


    /**
     * Set projectId
     *
     * @param integer $projectId
     * @return Comment
     */
    public function setProjectId($projectId)
    {
        $this->projectId = $projectId;

        return $this;
    }

    /**
     * Get projectId
     *
     * @return integer 
     */
    public function getProjectId()
    {
        return $this->projectId;
    }

    /**
     * Set date
     *
     * @param \DateTime $date
     * @return Comment
     */
    public function setDate($date)
    {
        $this->date = $date;

        return $this;
    }

    /**
     * Get date
     *
     * @return \DateTime 
     */
    public function getDate()
    {
        return $this->date;
    }

    /**
     * Set user
     *
     * @param integer $user
     * @return Comment
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
}
