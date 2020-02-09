<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ProfileController extends AbstractController
{
    /**
     * @Route(path="/", methods={"GET"}, name="app_homepage")
     */
    public function home()
    {
        return $this->render('profile/profile.html.twig');
    }
}
