<?php

namespace ErpBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Issue
 */
class Issue
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $issueName;

    /**
     * @var string
     */
    private $issueDescription;

    /**
     * @var integer
     */
    private $issueAutor;

    /**
     * @var integer
     */
    private $issueExecutor;

    /**
     * @var \DateTime
     */
    private $dateCreate;

    /**
     * @var \DateTime
     */
    private $dateFinish;

    /**
     * @var integer
     */
    private $status;

    /**
     * @var integer
     */
    private $summa;

    /**
     * @var \DateTime
     */
    private $dateStart;


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
     * Set issueName
     *
     * @param string $issueName
     * @return Issue
     */
    public function setIssueName($issueName)
    {
        $this->issueName = $issueName;

        return $this;
    }

    /**
     * Get issueName
     *
     * @return string 
     */
    public function getIssueName()
    {
        return $this->issueName;
    }

    /**
     * Set issueDescription
     *
     * @param string $issueDescription
     * @return Issue
     */
    public function setIssueDescription($issueDescription)
    {
        $this->issueDescription = $issueDescription;

        return $this;
    }

    /**
     * Get issueDescription
     *
     * @return string 
     */
    public function getIssueDescription()
    {
        return $this->issueDescription;
    }

    /**
     * Set issueAutor
     *
     * @param integer $issueAutor
     * @return Issue
     */
    public function setIssueAutor($issueAutor)
    {
        $this->issueAutor = $issueAutor;

        return $this;
    }

    /**
     * Get issueAutor
     *
     * @return integer 
     */
    public function getIssueAutor()
    {
        return $this->issueAutor;
    }

    /**
     * Set issueExecutor
     *
     * @param integer $issueExecutor
     * @return Issue
     */
    public function setIssueExecutor($issueExecutor)
    {
        $this->issueExecutor = $issueExecutor;

        return $this;
    }

    /**
     * Get issueExecutor
     *
     * @return integer 
     */
    public function getIssueExecutor()
    {
        return $this->issueExecutor;
    }

    /**
     * Set dateCreate
     *
     * @param \DateTime $dateCreate
     * @return Issue
     */
    public function setDateCreate($dateCreate)
    {
        $this->dateCreate = $dateCreate;

        return $this;
    }

    /**
     * Get dateCreate
     *
     * @return \DateTime 
     */
    public function getDateCreate()
    {
        return $this->dateCreate;
    }

    /**
     * Set dateFinish
     *
     * @param \DateTime $dateFinish
     * @return Issue
     */
    public function setDateFinish($dateFinish)
    {
        $this->dateFinish = $dateFinish;

        return $this;
    }

    /**
     * Get dateFinish
     *
     * @return \DateTime 
     */
    public function getDateFinish()
    {
        return $this->dateFinish;
    }

    /**
     * Set status
     *
     * @param integer $status
     * @return Issue
     */
    public function setStatus($status)
    {
        $this->status = $status;

        return $this;
    }

    /**
     * Get status
     *
     * @return integer 
     */
    public function getStatus()
    {
        return $this->status;
    }

    /**
     * Set summa
     *
     * @param integer $summa
     * @return Issue
     */
    public function setSumma($summa)
    {
        $this->summa = $summa;

        return $this;
    }

    /**
     * Get summa
     *
     * @return integer 
     */
    public function getSumma()
    {
        return $this->summa;
    }

    /**
     * Set dateStart
     *
     * @param \DateTime $dateStart
     * @return Issue
     */
    public function setDateStart($dateStart)
    {
        $this->dateStart = $dateStart;

        return $this;
    }

    /**
     * Get dateStart
     *
     * @return \DateTime 
     */
    public function getDateStart()
    {
        return $this->dateStart;
    }
    /**
     * @var integer
     */
    private $project;


    /**
     * Set project
     *
     * @param integer $project
     * @return Issue
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
