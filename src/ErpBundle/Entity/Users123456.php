<?php

namespace ErpBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * Users
 */
class Users extends BaseUser
{

    public  function __construct(){
        parent::__construct();
//        $this->addRole("ROLE_USER");
        $this->roles = Array("ROLE_USER");
    }

 function getDbRole(){
        $foundRole = Null;
        foreach($this->roles as $role){
            if($role != "ROLE_USER" ){
                $foundRole = $role; break;
            }
            else{
                $foundRole = $role;
            }
        }
        return  $foundRole;
    }

    /**
     * @var integer
     */
    protected $id;

    /**
     * @var string
     */
    private $userName;

    /**
     * @var string
     */
    private $description;

    /**
     * @var string
     */
    private $avatar;

    /**
     * @var string
     */
    private $phone;


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
     * Set userName
     *
     * @param string $userName
     * @return Users
     */
//    public function setUserName($userName)
//    {
//        $this->userName = $userName;
//
//        return $this;
//    }

    /**
     * Get userName
     *
     * @return string 
     */
//    public function getUserName()
//    {
//        return $this->userName;
//    }

    /**
     * Set description
     *
     * @param string $description
     * @return Users
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
     * Set avatar
     *
     * @param string $avatar
     * @return Users
     */
    public function setAvatar($avatar)
    {
        $this->avatar = $avatar;

        return $this;
    }

    /**
     * Get avatar
     *
     * @return string 
     */
    public function getAvatar()
    {
        return $this->avatar;
    }

    /**
     * Set phone
     *
     * @param string $phone
     * @return Users
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get phone
     *
     * @return string 
     */
    public function getPhone()
    {
        return $this->phone;
    }




    /**
     * Set userName
     *
     * @param string $userName
     * @return FosUser
     */
    public function setUserName($userName)
    {
        $this->userName = $userName;

        return $this;
    }

    /**
     * Get userName
     *
     * @return string
     */
    public function getUserName()
    {
        return $this->userName;
    }

}
