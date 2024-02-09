<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */

/* MODELS */
require "models/Category.php";
require "models/User.php";

/* MANAGERS */
require "managers/AbstractManager.php";
require "managers/CategoryManager.php";
require "managers/UserManager.php";

/* CONTROLLERS */
require "controllers/AbstractController.php";
require "controllers/AuthController.php";

/* SERVICES */
require "services/Router.php";
