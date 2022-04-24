<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\HttpFoundation\Response;

#[Route('/')]
class HomeController extends AbstractController
{
    #[Route(name: 'home', methods: ['GET'])]
    public function index(): Response
    {
        return $this->redirectToRoute('app_comment_index');
    }
}
