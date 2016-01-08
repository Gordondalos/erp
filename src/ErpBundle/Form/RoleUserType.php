<?php

namespace ErpBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class RoleUsersType extends AbstractType
{


    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {

        $ut = new RoleController();
        $em = $this->getDoctrine()->getManager();
        $role = $ut->allRoleAction($em);
        $roles = array();
        foreach ($role as $value ) {
            $arr = (array)($value);
            $roleId = array_shift($arr);
            $roleName = array_shift($arr);
            $roles += [$roleId => $roleName];

        }

        $builder->add("UsersType",new UsersType());

        $builder->add('role', 'choice', array('label' => 'Выберите роль',
                 'multiple' => false,
                 'choices' => $roles,
                 'mapped'=>false
             ))
            ->add('roles')
            ->add('email')
            ->add('Phone')
            ->add('description');


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
