<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class AuthController extends AbstractController
{
    public function login() : void
    {
        $this->render("login", []);
    }

    public function checkLogin() : void
    {
        if(isset($_POST["email"]) && isset($_POST["password"]))
        {
            $um = new UserManager();
            $user = $um->findByEmail($_POST["email"]);

            if($user !== null)
            {
                if(password_verify($_POST["password"], $user->getPassword()))
                {
                    $_SESSION["user"] = $user->getId();
                    $this->redirect("index.php?route=login");
                }
                else
                {
                    // invalid credentials (password)
                    $this->redirect("index.php?route=login");
                }
            }
            else
            {
                // invalid credentials (email)
                $this->redirect("index.php?route=login");
            }
        }
        else
        {
            // missing fields
            $this->redirect("index.php?route=login");
        }
    }

    public function register() : void
    {
        $this->render("register", []);
    }

    public function checkRegister() : void
    {
        if(isset($_POST["email"])
            && isset($_POST["password"]) && isset($_POST["confirm-password"]))
        {
            if($_POST["password"] === $_POST["confirm-password"])
            {
                $um = new UserManager();
                $user = $um->findByEmail($_POST["email"]);

                if($user === null)
                {
                    $email = $_POST["email"];
                    $password = password_hash($_POST["password"], PASSWORD_BCRYPT);
                    $user = new User($email, $password);

                    $um->create($user);

                    $_SESSION["user"] = $user->getId();

                    $this->redirect("index.php?route=register");
                }
                else
                {
                    // user already exists
                    $this->redirect("index.php?route=register");
                }
            }
            else
            {
                // password don't match
                $this->redirect("index.php?route=register");
            }
        }
        else
        {
            // missing fields
            $this->redirect("index.php?route=register");
        }
    }

    public function logout() : void
    {
        unset($_SESSION["user"]);
        $this->redirect("index.php?route=register");
    }
}