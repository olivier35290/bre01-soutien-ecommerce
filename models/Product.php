<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */

class Product
{
    private ? int $id = null;

    public function __construct(private string $name, private string $description, private int $price, private string $image_url, private string $image_alt, private Category $category)
    {

    }

    /**
     * @return int|null
     */
    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @param int|null $id
     */
    public function setId(?int $id): void
    {
        $this->id = $id;
    }

    /**
     * @return string
     */
    public function getName(): string
    {
        return $this->name;
    }

    /**
     * @param string $name
     */
    public function setName(string $name): void
    {
        $this->name = $name;
    }

    /**
     * @return string
     */
    public function getDescription(): string
    {
        return $this->description;
    }

    /**
     * @param string $description
     */
    public function setDescription(string $description): void
    {
        $this->description = $description;
    }

    /**
     * @return int
     */
    public function getPrice(): int
    {
        return $this->price;
    }

    /**
     * @param int $price
     */
    public function setPrice(int $price): void
    {
        $this->price = $price;
    }

    /**
     * @return string
     */
    public function getImageUrl(): string
    {
        return $this->image_url;
    }

    /**
     * @param string $image_url
     */
    public function setImageUrl(string $image_url): void
    {
        $this->image_url = $image_url;
    }

    /**
     * @return string
     */
    public function getImageAlt(): string
    {
        return $this->image_alt;
    }

    /**
     * @param string $image_alt
     */
    public function setImageAlt(string $image_alt): void
    {
        $this->image_alt = $image_alt;
    }

    /**
     * @return Category
     */
    public function getCategory(): Category
    {
        return $this->category;
    }

    /**
     * @param Category $category
     */
    public function setCategory(Category $category): void
    {
        $this->category = $category;
    }
}