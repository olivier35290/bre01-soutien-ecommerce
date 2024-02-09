# Projet de soutien : Site e-commerce

## Le pitch

Le but de ce projet de soutien c'est de coder un site e-commerce tout simple avec des produits, des catégories de produits, des utilisateurs et des commandes. Le but c'est aussi que vous voyez comment on attaque un projet un peu conséquent étape par étape. 

Vous ne finirez probablement pas le projet en une séance de soutien mais ça n'est pas grave, le but est d'aller aussi loin que possible pour être de plus en plus à l'aise avec les notions.


## Étape 0 : Github

Créez un repostory public Github avec un README et appelez-le `bre01-soutien-ecommerce`.
Clonez-le dans le dossier `sites/php` de votre IDE.


## Étape 1 : Les fichiers de la base de données

Vous trouverez sur Discord les fichiers SQL à importer pour créer votre base de données, ainsi qu'un modèle des données du projet au format PNG.


## Étape 2 : Créer notre structure de dossiers et fichiers

Commencez par créer l'architecture de dossiers et fichiers suivante :

```txt
- assets
   - style.css
- config
   - autoload.php
   - database.txt
- controllers
   - .gitkeep
- managers
   - .gitkeep
- models
   - .gitkeep
- services
   - Router.php
- templates
   - layout.phtml
- .gitignore
- index.php
```

Ensuite ajoutez la ligne suivante dans votre fichier `.gitignore` :

```txt
config/database.txt
```

Exécutez les commandes suivantes dans votre terminal (fates attention à bien être dans le dossier de votre repo) :
```sh
git add .gitignore
git commit -m "setting up gitignore file"
git push

git add assets
git add config
git add controllers
git add managers
git add models
git add services
git add templates
git add index.php
git commit -m "setting up files and folders structure"
git push
```

## Étape 3 : Gérer l'authentification

Dans cette partie nous allons mettre en place l'authentification sur le site. Créer un utilisateur avec le formulaire de création de compte, et le connecter avec le formulaire de connexion.


### 3.1 Le model User

En observant le modèle de données vous pouvez voir que la table `users` a la structure suivante :

| id  | email   | password | role    |
|-----|---------|----------|---------|
| int | varchar | varchar  | varchar |

Vous pouvez donc en déduire que votre modèle User aura les attributs suivants :

- int $id (qui peut également être null tant qu'on ne l'a pas inscrit en base de données)
- string $email (qui est unique, deux utilisateurs ne peuvent pas avoir le même email)
- string $password
- string $role (qui peut valoir "USER" ou "ADMIN" et vaut "USER" par défaut)

Comme d'habitude les attributs de votre classe doivent être private, et vous y accéder grâce à des getters et setters. 
Les paramètres du constructeur initialisent vos attributs, à l'exception de $id qui a la valeur null par défaut.


### 3.2 Le UserManager

#### Apparté : l'AbstractManager

Comme UserManager est notre premier Manager nous devons mettre en place notre AbstractManager qui s'ocupera de la connexion à la base de données. Vous pouvez récupérer celui de la correction de l'exercice Secured Blog : https://github.com/Gaellan/bre01-blog-secu/blob/main/managers/AbstractManager.php. Pensez à mettre vos informations de connexion à la base de données dans votre fichier database.txt.

Tous vos Managers hériteront de votre AbstractManager, n'oubliez pas d'appeler son constructeur dans le constructeur de vos Managers.


Pour l'instant nous allons gérer deux actions :

- créer un utilisateur dans la base de données (pour la création de compte)
- chercher un utilisateur à partir de son email (pour la connexion).

Votre classe UserManager devra donc contenir deux méthodes publiques:

- `create(User $user) : void` qui va sauvegarder le $user passé en paramètres dans la base de données et lui set son id une fois que c'est fait
- `findByEmail(string $email) : ? User` qui va retourner le user qui a l'email passé en paramètres ou null s'il n'existe pas

📘 Quand la méthode fetch de PDO ne peut pas trouver ce que vous lui demandez dans la BDD, elle renvoie false, pensez à gérer ce cas d'erreur proprement pour renvoyer null si cette situation se présente (fetchAll, elle renvoie un tableau vide).

### 3.3 Le AuthController

#### Apparté : l'AbstractController

Comme AuthController est notre premier Controller nous devons mettre en place notre AbstractController qui s'ocupera de nous furnir des méthodes d'affichage (render) et de redirection (redirect). Vous pouvez récupérer celui de la correction de l'exercice Secured Blog : https://github.com/Gaellan/bre01-blog-secu/blob/main/controllers/AbstractController.php. 

Tous vos Controllers hériteront de votre AbstractController.

Votre classe AuthController devra donc contenir 5 méthodes publiques:

- `login() : void` : qui affiche la page avec le formulaire de connexion en utilisant la méthode render
- `checkLogin() : void` : qui vérifie les informations du formulaire de connexion et connecte l'utilisateur (utilisez la session) puis le redirige
- `register() : void` : qui affiche la page avec le formulaire d'inscription en utilisant la méthode render
- `checkRegister() : void` : qui vérifie les informations du formulaire d'inscription, créé le compte, connecte l'utilisateur et le redirige
- `logout() : void` : qui déconnecte l'utilisateur et le redirige.

### 3.4 Le Routeur

Comme c'est notre première étape avec le Routeur nous allons devoir créer la classe et son unique méthode publique, `handleRequest(array $get) : void`.

Nous allons ajouter 5 conditions pour des routes dans la méthode `hanleRequest` :

- si `$get["route"]` existe et vaut `"login"` : on appelle la méthode `login` du AuthController
- si `$get["route"]` existe et vaut `"check-login"` : on appelle la méthode `checkLogin` du AuthController
- si `$get["route"]` existe et vaut `"register"` : on appelle la méthode `register` du AuthController
- si `$get["route"]` existe et vaut `"check-register"` : on appelle la méthode `checkRegister` du AuthController
- si `$get["route"]` existe et vaut `"logout"` : on appelle la méthode `logout` du AuthController

### 3.5 Les templates

Comme c'est notre première étape avec les templates, nous allons devoir préparer notre fichier `layout.phtml`. Récupére celui de la correction du projet Secured Blog : https://github.com/Gaellan/bre01-blog-secu/blob/main/templates/layout.phtml. Enlevez ce dont vous n'avez pas besoin, comme les liens vers les catégories.

Vous allez devoir mettre en place les formulaires de connexion et de création de compte, dans deux templates séparés :

- `login.phtml` pour la connexion (vous pouvez réutiliser celui de la correction de Secure blog en enlevant ce qui ne vous sert pas https://github.com/Gaellan/bre01-blog-secu/blob/main/templates/login.phtml)
- `register.phtml` pour la création de compte (vous pouvez réutiliser celui de la correction de Secure blog en enlevant ce qui ne vous sert pas https://github.com/Gaellan/bre01-blog-secu/blob/main/templates/register.phtml)

### 3.6 Mettre à jour l'autoload

Nous allons mettre à jour notre fichier `autoload.php`avec nos nouvelles classes. N'oubliez pas l'ordre d'appel de vos fichiers est important :

- les models
- l'abstract manager
- les managers
- l'abstract controller
- les controllers
- le routeur

Comme c'est notre première étape, il faut également remplir notre index.php, récupérez celui de la correction de Secure Blog et retirez la gestion des tokens CSRF https://github.com/Gaellan/bre01-blog-secu/blob/main/index.php.

### 3.7 Tester

Utilisez les routes déjà présentes dans la nav pour tester votre travail. Comme vous n'avez pas de page par défaut vous devrez passer la route dans votre barre d'URL la première fois "index.php?route=login" par exemple.


## Étape 4 : Gérer la page de détails d'un produit

Pour cette partie nous allons nous ocuper de créer une page qui permet de voir les informations d'un produit.

### 4.1 Le model Product

En observant le modèle de données vous pouvez voir que la table `products` a la structure suivante :

| id  | name    | description | price    | image_id        | category_id       |
|-----|---------|-------------|----------|-----------------|-------------------|
| int | varchar | varchar     | int      | int : images.id | int categories.id |

Vous pouvez donc en déduire que votre modèle Product aura les attributs suivants :

- int $id (qui peut également être null tant qu'on ne l'a pas inscrit en base de données)
- string $name 
- string $description
- string $image_url (comme nous n'avons pas de gestion de l'upload nous n'allons pas créer de model pour les images)
- string $image_alt
- Category $category

Comme d'habitude les attributs de votre classe doivent être private, et vous y accéder grâce à des getters et setters. 
Les paramètres du constructeur initialisent vos attributs, à l'exception de $id qui a la valeur null par défaut.

### 4.2 Le ProductManager

Pour l'instant nous allons gérer une action :

- chercher un produit à partir de son id.

Votre classe ProductManager devra donc contenir une méthode publique:

- `findById(int $id) : ? Product` qui va retourner le Product qui a l'id passé en paramètres ou null s'il n'existe pas

Pour récupérer l'url et l'alt de l'image, utilisez un JOIN. Pour la Category, instanciez une catégorie vide (pour le moment vous y reviendrez quand le modèle sera prêt).

📘 Quand la méthode fetch de PDO ne peut pas trouver ce que vous lui demandez dans la BDD, elle renvoie false, pensez à gérer ce cas d'erreur proprement pour renvoyer null si cette situation se présente (fetchAll, elle renvoie un tableau vide).

### 4.3 Le ProductController

Votre classe ProductController devra donc contenir 1 méthode publique:

- `product(int $id) : void` qui affiche la page de détails d'un produit avec ses informations en utilisant la méthode render

### 4.4 Le Routeur

Vous allez ajouter une route à votre méthode `handleRequest` :

- Si `$get["route"]` existe et vaut "product" et que `$get["product"]` existe : transformer `$get["product"]` en int et appeler la méthode product de votre ProductController en lui passant cet int.

### 4.5 Les templates

Voici le contenu statique de votre template `product.phtml`, il ne vous reste plus qu'à le dynamiser avec les bonnes informations, y compris pour l'image.

```html
<main class="container py-5">
    <img src="https://picsum.photos/id/104/800/600" class="img-fluid" alt="Alt de l'image">
    <h2 class="my-4">Nom du produit</h2>
    <p class="my-4">
        Description du produit
    </p>
    <p class="text-bold">
        Prix du produit $
    </p>
</main>
```

### 4.6 Mettre à jour l'autoload

Rajoutez vos nouvelles classes dans votre `autoload.php`, attention, vu que votre modèle Product utilise votre modèle Category, mettez Category avant Product.

### 4.7 Tester

Utilisez les routes déjà présentes dans la nav pour tester votre travail. Comme vous n'avez pas de page par défaut vous devrez passer la route dans votre barre d'URL la première fois "index.php?route=product&product=1" par exemple.


## Étape 5 : Gérer la page d'une catégorie

### 5.1 Le model Category

En observant le modèle de données vous pouvez voir que la table `categories` a la structure suivante :

| id  | name    | description |
|-----|---------|-------------|
| int | varchar | varchar     |

Vous pouvez donc en déduire que votre modèle Category aura les attributs suivants :

- int $id (qui peut également être null tant qu'on ne l'a pas inscrit en base de données)
- string $name 
- string $description

Comme d'habitude les attributs de votre classe doivent être private, et vous y accéder grâce à des getters et setters. 
Les paramètres du constructeur initialisent vos attributs, à l'exception de $id qui a la valeur null par défaut.

### 5.2 Le CategoryManager

Pour l'instant nous allons gérer une action :

- chercher une catégorie à partir de son id.

Votre classe CategoryManager devra donc contenir une méthode publique:

- `findById(int $id) : ? Category` qui va retourner la Category qui a l'id passé en paramètres ou null si elle n'existe pas


Nous allons aussi modifier notre ProductManager et lui ajouter une action :

- chercher des produits à parti de l'id d'une catégorie

Votre classe ProductManager devra donc contenir une méthode publique supplémentaire:

- `findByCategory(int $categoryId) : array` qui va retourner les produits qui ont la Category qui a l'id passé en paramètres 

📘 Quand la méthode fetch de PDO ne peut pas trouver ce que vous lui demandez dans la BDD, elle renvoie false, pensez à gérer ce cas d'erreur proprement pour renvoyer null si cette situation se présente (fetchAll, elle renvoie un tableau vide).

### 5.3 Le CategoryController

Votre classe CategoryController devra donc contenir 1 méthode publique:

- `category(int $id) : void` qui affiche la page d'une catégorie avec ses informations et ses produits en utilisant la méthode render

### 5.4 Le Routeur

Vous allez ajouter une route à votre méthode `handleRequest` :

- Si `$get["route"]` existe et vaut "category" et que `$get["category"]` existe : transformer `$get["category"]` en int et appeler la méthode category de votre CategoryController en lui passant cet int.

### 5.5 Les templates

### 5.6 Mettre à jour l'autoload

Rajoutez vos nouvelles classes dans votre `autoload.php`, attention, mettez le CategoryManager, avant le ProductManager.

### 5.7 Tester

Utilisez les routes déjà présentes dans la nav pour tester votre travail. Comme vous n'avez pas de page par défaut vous devrez passer la route dans votre barre d'URL la première fois "index.php?route=category&category=1" par exemple.


## Étape 6 : Gérer la page d'accueil

### 6.1 Le ProductManager

### 6.2 Le HomeController

### 6.3 Le Routeur

### 6.4 Les templates

### 6.5 Tester


## Étape 7 : dynamiser les catégories de la nav

### 7.1 L'AbstractController

### 7.2 Les templates

### 7.3 Tester


## Étape 8 : Gérer les commandes

### 8.1 Le model Order

### 8.2 Le OrderManager

### 8.3 Le OrderController

### 8.4 Le Routeur

### 8.5 Les templates

### 8.6 Mettre à jour l'autoload

### 8.7 Tester

