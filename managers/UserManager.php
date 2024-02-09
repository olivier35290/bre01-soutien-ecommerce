<?php
/**
 * @author : Gaellan
 * @link : https://github.com/Gaellan
 */


class UserManager extends AbstractManager
{
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * @param User $user
     * @return void
     */
    public function create(User $user) : void
    {
        $query = $this->db->prepare('INSERT INTO users (id, email, password, role) VALUES (NULL, :email, :password, :role)');
        $parameters = [
            "password" => $user->getPassword(),
            "email" => $user->getEmail(),
            "role" => $user->getRole(),
        ];

        $query->execute($parameters);

        $user->setId($this->db->lastInsertId());
    }

    /**
     * @param string $email
     * @return User|null
     */
    public function findByEmail(string $email) : ? User
    {
        $query = $this->db->prepare('SELECT * FROM users WHERE email=:email');
        $parameters = [
            "email" => $email
        ];
        $query->execute($parameters);
        $result = $query->fetch(PDO::FETCH_ASSOC);

        if($result)
        {
            $user = new User($result["email"], $result["password"], $result["role"]);
            $user->setId($result["id"]);

            return $user;
        }
        else
        {
            return null;
        }
    }
}