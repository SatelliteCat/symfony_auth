<?php

namespace App\Controller;

use App\Entity\Organization;
use App\Entity\User;
use App\Form\RegistrationFormType;
use App\Security\LoginFormAuthenticator;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Core\Encoder\UserPasswordEncoderInterface;
use Symfony\Component\Security\Guard\GuardAuthenticatorHandler;

class RegistrationController extends AbstractController
{
    /**
     * @Route("/register", name="app_register")
     */
    public function register(Request $request, UserPasswordEncoderInterface $passwordEncoder, GuardAuthenticatorHandler $guardHandler, LoginFormAuthenticator $authenticator): Response
    {
        $user = new User();
        $form = $this->createForm(RegistrationFormType::class, $user);

        // Исправление 'string' в 'request' на объект 'Organization'
        if ($request->request->all() != null) {
            $organization_name = $request->request->all()['registration_form']['organization'];
            $organization = $this
                ->getDoctrine()
                ->getRepository(Organization::class)
                ->findOneBy(array('name' => $organization_name));

            if (!$organization) {
                $organization = new Organization();
                $organization->setName($organization_name);

                $entityManager = $this->getDoctrine()->getManager();
                $entityManager->persist($organization);
                $entityManager->flush();
            }
            $requestArray = $request->request->all();
            $requestArray['registration_form']['organization'] = $organization;
            $request->request->replace($requestArray);
        }

        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            // encode the plain password
            $user->setPassword(
                $passwordEncoder->encodePassword(
                    $user,
                    $form->get('plainPassword')->getData()
                )
            );

            $entityManager = $this->getDoctrine()->getManager();
            $entityManager->persist($user);
            $entityManager->flush();

            return $guardHandler->authenticateUserAndHandleSuccess(
                $user,
                $request,
                $authenticator,
                'main' // firewall name in security.yaml
            );
        }

        return $this->render('registration/register.html.twig', [
            'registrationForm' => $form->createView(),
        ]);
    }
}
