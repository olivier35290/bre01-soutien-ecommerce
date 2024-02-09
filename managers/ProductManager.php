<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class ProductManager extends AbstractManager
{
    public function findById(int $id) : ? Product
    {
        $query = $this->db->prepare('SELECT products.*, images.url AS image_url, images.alt AS image_alt FROM products 
    JOIN images ON images.id=products.image_id 
    WHERE products.id=:id');
        $parameters = [
            "id" => $id
        ];
        $query->execute($parameters);
        $result = $query->fetch(PDO::FETCH_ASSOC);

        if($result)
        {
            $product = new Product($result["name"], $result["description"], $result["price"], $result["image_url"], $result["image_alt"], new Category());
            $product->setId($result["id"]);

            return $product;
        }
        else
        {
            return null;
        }
    }
}