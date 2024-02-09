<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class Router
{
    public function handleRequest(array $get) : void
    {
        $ac = new AuthController();
        $pc = new ProductController();

        if(isset($get["route"]) && $get["route"] === "login")
        {
            $ac->login();
        }
        else if (isset($get["route"]) && $get["route"] === "check-login")
        {
            $ac->checkLogin();
        }
        else if (isset($get["route"]) && $get["route"] === "register")
        {
            $ac->register();
        }
        else if (isset($get["route"]) && $get["route"] === "check-register")
        {
            $ac->checkRegister();
        }
        else if (isset($get["route"]) && $get["route"] === "check-logout")
        {
            $ac->logout();
        }
        else if (isset($get["route"]) && $get["route"] === "product" && isset($get["product"]))
        {
            $pc->product(intval($get["product"]));
        }
    }
}