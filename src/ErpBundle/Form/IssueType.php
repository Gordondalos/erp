<?php

namespace ErpBundle\Form;

use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolverInterface;

class IssueType extends AbstractType
{
    /**
     * @param FormBuilderInterface $builder
     * @param array $options
     */
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('issueName')
            ->add('issueDescription')
            ->add('issueAutor')
            ->add('issueExecutor')
            ->add('dateCreate')
            ->add('dateFinish')
            ->add('status')
            ->add('summa')
            ->add('dateStart')
            ->add('project')
        ;
    }
    
    /**
     * @param OptionsResolverInterface $resolver
     */
    public function setDefaultOptions(OptionsResolverInterface $resolver)
    {
        $resolver->setDefaults(array(
            'data_class' => 'ErpBundle\Entity\Issue'
        ));
    }

    /**
     * @return string
     */
    public function getName()
    {
        return 'erpbundle_issue';
    }
}
