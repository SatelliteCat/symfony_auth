<?php

namespace App\Form;

use App\Entity\User;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\PasswordType;
use Symfony\Component\Form\Extension\Core\Type\RepeatedType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\TelType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;
use Symfony\Component\Validator\Constraints\Length;
use Symfony\Component\Validator\Constraints\NotBlank;
use Symfony\Component\Validator\Constraints\Regex;

class RegistrationFormType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $user = new User();
        $builder
            ->add('first_name', TextType::class, [
                'attr' => array('class' => 'form-control'),
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[a-zA-Z0-9]+$/i',
                        'htmlPattern' => '^[a-zA-Z0-9]+$'
                    ])
                ]
            ])
            ->add('last_name', TextType::class, [
                'attr' => array('class' => 'form-control'),
                'constraints' => [
                    new Regex([
                        'pattern' => '/^[a-zA-Z0-9]+$/i',
                        'htmlPattern' => '^[a-zA-Z0-9]+$'
                    ])
                ]
            ])
            ->add('phone', TelType::class, [
                'attr' => array('class' => 'form-control'),
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter a phone',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Your phone should be at least {{ limit }} characters',
                        'max' => 15,
                    ]),
                    new Regex([
                        'pattern' => '/^[0-9]+$/i',
                        'htmlPattern' => '^[0-9]+$'
                    ])
                ]
            ])
            ->add('user', EntityType::class, [
                'class' => User::class,
                'attr' => array('class' => 'form-control'),
            ])
            ->add('organization', TextType::class, [
                'attr' => array('class' => 'form-control'),
                'label' => 'Organisation',
            ])
            ->add('password', RepeatedType::class, [
                'type' => PasswordType::class,
                'invalid_message' => 'The password fields must match.',
                'options' => ['attr' => ['class' => 'password-field form-control']],
                'required' => true,
                'first_options'  => [
                    'label' => 'Password',
                    'attr' => ['class' => 'password-field form-control form-group']
                ],
                'second_options' => ['label' => 'Confirm password'],
                'mapped' => false,
                'constraints' => [
                    new NotBlank([
                        'message' => 'Please enter a password',
                    ]),
                    new Length([
                        'min' => 6,
                        'minMessage' => 'Your password should be at least {{ limit }} characters',
                        'max' => 20,
                    ]),
                ],
            ])
            ->add('save', SubmitType::class, [
                'label' => 'Registration',
                'attr' => array('class' => 'btn btn-lg btn-primary')
            ]);
    }

    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => User::class,
        ]);
    }
}
