<?php

namespace ErpBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class UsersType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {


        $builder

            ->add('username')
            ->add('specializaciya')
//            ->add('password')
//            ->add('roles')
//            ->add('enabled')
            ->add('email')
            ->add('phone')
            ->add('description')
//            ->add('locked')
            ->add('avatar')
            ->add('skill')
            ->add('portfolio')
            ->add('price')
            ->add('pricevchas')
            ->add('watch')
            ->add('experience')
            ->add('anotheCommand')
            ->add('rekvisitOplat')
//            ->add('reiting')
            ->add('adress')
//            ->add('dateRegistration')
            ->add('predoplata')
            ->add('platejsistem')
            ->add('ege')
            ->add('gender')
            ->add('fio')
            ->add('informwhy')
            ->add('sekret')
            ->add('predpochteniyajob')
            ->add('instrument')
            ->add('paralelJob')
            ->add('samOrCommand')
            ->add('skolkochasovvnedelu')
            ->add('celiVrabote')
            ->add('hobbi')
        ;


    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'ErpBundle\Entity\Users'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'erpbundle_users';
    }
}
