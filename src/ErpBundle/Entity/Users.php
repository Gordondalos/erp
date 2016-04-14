<?php

namespace ErpBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * Users
 */
class Users extends BaseUser
{

    public function __construct(){
        parent::__construct();
//        $this->addRole("ROLE_USER");
        $this->roles = Array("ROLE_USER");
    }


    public function getDbRole(){
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
//    private $userName;

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
     * @var string
     */
    private $skill;


    /**
     * Set skill
     *
     * @param string $skill
     * @return Users
     */
    public function setSkill($skill)
    {
        $this->skill = $skill;

        return $this;
    }

    /**
     * Get skill
     *
     * @return string 
     */
    public function getSkill()
    {
        return $this->skill;
    }
    /**
     * @var string
     */
    private $portfolio;


    /**
     * Set Portfolio
     *
     * @param string $portfolio
     * @return Users
     */
    public function setPortfolio($portfolio)
    {
        $this->portfolio = $portfolio;

        return $this;
    }

    /**
     * Get Portfolio
     *
     * @return string 
     */
    public function getPortfolio()
    {
        return $this->portfolio;
    }
    /**
     * @var string
     */
    private $price;


    /**
     * Set price
     *
     * @param string $price
     * @return Users
     */
    public function setPrice($price)
    {
        $this->price = $price;

        return $this;
    }

    /**
     * Get price
     *
     * @return string 
     */
    public function getPrice()
    {
        return $this->price;
    }
    /**
     * @var string
     */
    private $pricevchas;

    /**
     * @var string
     */
    private $watch;

    /**
     * @var string
     */
    private $experience;

    /**
     * @var string
     */
    private $anotheCommand;

    /**
     * @var string
     */
    private $rekvisitOplat;

    /**
     * @var integer
     */
    private $reiting;

    /**
     * @var string
     */
    private $adress;

    /**
     * @var \DateTime
     */
    private $dateRegistration;

    /**
     * @var string
     */
    private $predoplata;

    /**
     * @var string
     */
    private $platejsistem;

    /**
     * @var string
     */
    private $ege;

    /**
     * @var string
     */
    private $gender;

    /**
     * @var string
     */
    private $fio;

    /**
     * @var string
     */
    private $informwhy;

    /**
     * @var string
     */
    private $sekret;

    /**
     * @var string
     */
    private $predpochteniyajob;

    /**
     * @var string
     */
    private $instrument;

    /**
     * @var string
     */
    private $paralelJob;

    /**
     * @var string
     */
    private $samOrCommand;

    /**
     * @var string
     */
    private $skolkochasovvnedelu;

    /**
     * @var string
     */
    private $celiVrabote;

    /**
     * @var string
     */
    private $hobbi;


    /**
     * Set pricevchas
     *
     * @param string $pricevchas
     * @return Users
     */
    public function setPricevchas($pricevchas)
    {
        $this->pricevchas = $pricevchas;

        return $this;
    }

    /**
     * Get pricevchas
     *
     * @return string 
     */
    public function getPricevchas()
    {
        return $this->pricevchas;
    }

    /**
     * Set watch
     *
     * @param string $watch
     * @return Users
     */
    public function setWatch($watch)
    {
        $this->watch = $watch;

        return $this;
    }

    /**
     * Get watch
     *
     * @return string 
     */
    public function getWatch()
    {
        return $this->watch;
    }

    /**
     * Set experience
     *
     * @param string $experience
     * @return Users
     */
    public function setExperience($experience)
    {
        $this->experience = $experience;

        return $this;
    }

    /**
     * Get experience
     *
     * @return string 
     */
    public function getExperience()
    {
        return $this->experience;
    }

    /**
     * Set anotheCommand
     *
     * @param string $anotheCommand
     * @return Users
     */
    public function setAnotheCommand($anotheCommand)
    {
        $this->anotheCommand = $anotheCommand;

        return $this;
    }

    /**
     * Get anotheCommand
     *
     * @return string 
     */
    public function getAnotheCommand()
    {
        return $this->anotheCommand;
    }

    /**
     * Set rekvisitOplat
     *
     * @param string $rekvisitOplat
     * @return Users
     */
    public function setRekvisitOplat($rekvisitOplat)
    {
        $this->rekvisitOplat = $rekvisitOplat;

        return $this;
    }

    /**
     * Get rekvisitOplat
     *
     * @return string 
     */
    public function getRekvisitOplat()
    {
        return $this->rekvisitOplat;
    }

    /**
     * Set reiting
     *
     * @param integer $reiting
     * @return Users
     */
    public function setReiting($reiting)
    {
        $this->reiting = $reiting;

        return $this;
    }

    /**
     * Get reiting
     *
     * @return integer 
     */
    public function getReiting()
    {
        return $this->reiting;
    }

    /**
     * Set adress
     *
     * @param string $adress
     * @return Users
     */
    public function setAdress($adress)
    {
        $this->adress = $adress;

        return $this;
    }

    /**
     * Get adress
     *
     * @return string 
     */
    public function getAdress()
    {
        return $this->adress;
    }

    /**
     * Set dateRegistration
     *
     * @param \DateTime $dateRegistration
     * @return Users
     */
    public function setDateRegistration($dateRegistration)
    {
        $this->dateRegistration = $dateRegistration;

        return $this;
    }

    /**
     * Get dateRegistration
     *
     * @return \DateTime 
     */
    public function getDateRegistration()
    {
        return $this->dateRegistration;
    }

    /**
     * Set predoplata
     *
     * @param string $predoplata
     * @return Users
     */
    public function setPredoplata($predoplata)
    {
        $this->predoplata = $predoplata;

        return $this;
    }

    /**
     * Get predoplata
     *
     * @return string 
     */
    public function getPredoplata()
    {
        return $this->predoplata;
    }

    /**
     * Set platejsistem
     *
     * @param string $platejsistem
     * @return Users
     */
    public function setPlatejsistem($platejsistem)
    {
        $this->platejsistem = $platejsistem;

        return $this;
    }

    /**
     * Get platejsistem
     *
     * @return string 
     */
    public function getPlatejsistem()
    {
        return $this->platejsistem;
    }

    /**
     * Set ege
     *
     * @param string $ege
     * @return Users
     */
    public function setEge($ege)
    {
        $this->ege = $ege;

        return $this;
    }

    /**
     * Get ege
     *
     * @return string 
     */
    public function getEge()
    {
        return $this->ege;
    }

    /**
     * Set gender
     *
     * @param string $gender
     * @return Users
     */
    public function setGender($gender)
    {
        $this->gender = $gender;

        return $this;
    }

    /**
     * Get gender
     *
     * @return string 
     */
    public function getGender()
    {
        return $this->gender;
    }

    /**
     * Set fio
     *
     * @param string $fio
     * @return Users
     */
    public function setFio($fio)
    {
        $this->fio = $fio;

        return $this;
    }

    /**
     * Get fio
     *
     * @return string 
     */
    public function getFio()
    {
        return $this->fio;
    }

    /**
     * Set informwhy
     *
     * @param string $informwhy
     * @return Users
     */
    public function setInformwhy($informwhy)
    {
        $this->informwhy = $informwhy;

        return $this;
    }

    /**
     * Get informwhy
     *
     * @return string 
     */
    public function getInformwhy()
    {
        return $this->informwhy;
    }

    /**
     * Set sekret
     *
     * @param string $sekret
     * @return Users
     */
    public function setSekret($sekret)
    {
        $this->sekret = $sekret;

        return $this;
    }

    /**
     * Get sekret
     *
     * @return string 
     */
    public function getSekret()
    {
        return $this->sekret;
    }

    /**
     * Set predpochteniyajob
     *
     * @param string $predpochteniyajob
     * @return Users
     */
    public function setPredpochteniyajob($predpochteniyajob)
    {
        $this->predpochteniyajob = $predpochteniyajob;

        return $this;
    }

    /**
     * Get predpochteniyajob
     *
     * @return string 
     */
    public function getPredpochteniyajob()
    {
        return $this->predpochteniyajob;
    }

    /**
     * Set instrument
     *
     * @param string $instrument
     * @return Users
     */
    public function setInstrument($instrument)
    {
        $this->instrument = $instrument;

        return $this;
    }

    /**
     * Get instrument
     *
     * @return string 
     */
    public function getInstrument()
    {
        return $this->instrument;
    }

    /**
     * Set paralelJob
     *
     * @param string $paralelJob
     * @return Users
     */
    public function setParalelJob($paralelJob)
    {
        $this->paralelJob = $paralelJob;

        return $this;
    }

    /**
     * Get paralelJob
     *
     * @return string 
     */
    public function getParalelJob()
    {
        return $this->paralelJob;
    }

    /**
     * Set samOrCommand
     *
     * @param string $samOrCommand
     * @return Users
     */
    public function setSamOrCommand($samOrCommand)
    {
        $this->samOrCommand = $samOrCommand;

        return $this;
    }

    /**
     * Get samOrCommand
     *
     * @return string 
     */
    public function getSamOrCommand()
    {
        return $this->samOrCommand;
    }

    /**
     * Set skolkochasovvnedelu
     *
     * @param string $skolkochasovvnedelu
     * @return Users
     */
    public function setSkolkochasovvnedelu($skolkochasovvnedelu)
    {
        $this->skolkochasovvnedelu = $skolkochasovvnedelu;

        return $this;
    }

    /**
     * Get skolkochasovvnedelu
     *
     * @return string 
     */
    public function getSkolkochasovvnedelu()
    {
        return $this->skolkochasovvnedelu;
    }

    /**
     * Set celiVrabote
     *
     * @param string $celiVrabote
     * @return Users
     */
    public function setCeliVrabote($celiVrabote)
    {
        $this->celiVrabote = $celiVrabote;

        return $this;
    }

    /**
     * Get celiVrabote
     *
     * @return string 
     */
    public function getCeliVrabote()
    {
        return $this->celiVrabote;
    }

    /**
     * Set hobbi
     *
     * @param string $hobbi
     * @return Users
     */
    public function setHobbi($hobbi)
    {
        $this->hobbi = $hobbi;

        return $this;
    }

    /**
     * Get hobbi
     *
     * @return string 
     */
    public function getHobbi()
    {
        return $this->hobbi;
    }
    /**
     * @var string
     */
    private $specializaciya;


    /**
     * Set specializaciya
     *
     * @param string $specializaciya
     * @return Users
     */
    public function setSpecializaciya($specializaciya)
    {
        $this->specializaciya = $specializaciya;

        return $this;
    }

    /**
     * Get specializaciya
     *
     * @return string 
     */
    public function getSpecializaciya()
    {
        return $this->specializaciya;
    }
}
