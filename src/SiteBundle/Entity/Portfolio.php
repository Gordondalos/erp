<?php

namespace SiteBundle\Entity;

use Doctrine\ORM\Mapping as ORM;

/**
 * Portfolio
 */
class Portfolio
{
    /**
     * @var integer
     */
    private $id;

    /**
     * @var string
     */
    private $name;


    /**
     * @var string
     */
    private $headerImage;

    /**
     * @var string
     */
    private $description;


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
     * Set name
     *
     * @param string $name
     * @return Portfolio
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string 
     */
    public function getName()
    {
        return $this->name;
    }


    /**
     * Set headerImage
     *
     * @param string $headerImage
     * @return Portfolio
     */
    public function setHeaderImage($headerImage)
    {
        $this->headerImage = $headerImage;

        return $this;
    }

    /**
     * Get headerImage
     *
     * @return string 
     */
    public function getHeaderImage()
    {
        return $this->headerImage;
    }

    /**
     * Set description
     *
     * @param string $description
     * @return Portfolio
     */
    public function setDescription($description)
    {
        $this->description = $description;

        return $this;
    }

    /**
     * Get description
     *
     * @return string 
     */
    public function getDescription()
    {
        return $this->description;
    }
    /**
     * @var string
     */
    private $smallImage;


    /**
     * Set smallImage
     *
     * @param string $smallImage
     * @return Portfolio
     */
    public function setSmallImage($smallImage)
    {
        $this->smallImage = $smallImage;

        return $this;
    }

    /**
     * Get smallImage
     *
     * @return string 
     */
    public function getSmallImage()
    {
        return $this->smallImage;
    }
    /**
     * @var string
     */
    private $colorHeaderText;


    /**
     * Set colorHeaderText
     *
     * @param string $colorHeaderText
     * @return Portfolio
     */
    public function setColorHeaderText($colorHeaderText)
    {
        $this->colorHeaderText = $colorHeaderText;

        return $this;
    }

    /**
     * Get colorHeaderText
     *
     * @return string 
     */
    public function getColorHeaderText()
    {
        return $this->colorHeaderText;
    }
}
