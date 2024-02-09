<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class ProductController extends AbstractController
{
    public function product(int $id) : void
    {
        $pm = new ProductManager();
        $product = $pm->findById($id);

        if($product !== null)
        {
            $this->render("product", [ "product" => $product ]);
        }
        else
        {
            $this->redirect("index.php");
        }

    }
}