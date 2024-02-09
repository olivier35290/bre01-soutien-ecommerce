<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */

class Router
{
    private AuthController $ac;

    public function __construct()
    {
        $this->ac = new AuthController();
    }
    public function handleRequest(array $get) : void
    {
               if (!isset($get["route"])) {
// Afficher la page d'accueil
           $this->ac->login();
       } else if (isset($get["route"]) && $get["route"] === "register") {
// Afficher le formulaire d'inscription
           $this->ac->register();
       } else if (isset($get["route"]) && $get["route"] === "check-register") {
// Traiter le formulaire d'inscription
           $this->ac->checkRegister();
       } else if (isset($get["route"]) && $get["route"] === "login") {
// Afficher le formulaire de connexion
           $this->ac->login();
       } else if (isset($get["route"]) && $get["route"] === "check-login") {
// Traiter le formulaire de connexion
           $this->ac->checkLogin();
       } else if (isset($get["route"]) && $get["route"] === "logout") {
// Déconnecter l'utilisateur
           $this->ac->logout();
       } else {
// Afficher la page d'accueil
           $this->ac->login();
       }
    }
}