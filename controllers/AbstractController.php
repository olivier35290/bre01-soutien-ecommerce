<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


abstract class AbstractController
{
    /**
     * @param string $template
     * @param array $data
     * @return void
     */
    protected function render(string $template, array $data) : void
    {
        require "templates/layout.phtml";
    }

    /**
     * @param string $route
     * @return void
     */
    protected function redirect(string $route) : void
    {
        header("Location: $route");
    }
}