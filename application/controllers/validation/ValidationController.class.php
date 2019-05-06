<?php

class ValidationController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        $orderModel = new OrderModel();
        $user = $orderModel->getUserByOrder($queryFields["id"]);
        $order = $orderModel->getOrder($queryFields["id"]);
        return ["user"=>$user, "order"=>$order];
        /*
         * Méthode appelée en cas de requête HTTP GET
         *
         * L'argument $http est un objet permettant de faire des redirections etc.
         * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
         */


    }

    public function httpPostMethod(Http $http, array $formFields)
    {
        /*
         * Méthode appelée en cas de requête HTTP POST
         *
         * L'argument $http est un objet permettant de faire des redirections etc.
         * L'argument $formFields contient l'équivalent de $_POST en PHP natif.
         */
        //APPEL AJAX
        /*
        $datOrder = new OrderModel();
        $idMeal = array_values($formFields)[0];
        $newMeal = $datOrder->getDatMeal($idMeal);
        $http->sendJsonResponse($newMeal);
        //echo json_encode(array("newMeal"=>$newMeal));
        //return ["newMeal"=>$newMeal];
        */
    }
}