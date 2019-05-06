<?php

class OrderController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        /*
         * Méthode appelée en cas de requête HTTP GET
         *
         * L'argument $http est un objet permettant de faire des redirections etc.
         * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
         */
        $datMeal = new MealModel();
        $meals = $datMeal->getAll();
        if (isset($queryFields["q"])) {
            return "Le passage est ok !";
        }
        return ["meals"=>$meals];

    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        /*
         * Méthode appelée en cas de requête HTTP POST
         *
         * L'argument $http est un objet permettant de faire des redirections etc.
         * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
         */
        $panier = $formFields["panier"];
        new UserSession();
        $orderModel = new OrderModel();
        $idCommande = $orderModel->insertOrder($formFields["totalAmount"]);

        foreach($panier as $repas){
            $orderModel->insertOrderLine($repas["quantity"], $repas["id"], $idCommande, $repas["salePrice"]);
        }
        $http->sendJsonResponse($idCommande);
    }
}