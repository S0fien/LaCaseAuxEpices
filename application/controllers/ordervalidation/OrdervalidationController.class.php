<?php

class OrdervalidationController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {
        /*
         * Méthode appelée en cas de requête HTTP GET
         *
         * L'argument $http est un objet permettant de faire des redirections etc.
         * L'argument $queryFields contient l'équivalent de $_GET en PHP natif.
         */
        return "OK!";
    }

    public function httpPostMethod(Http $http, array $formFields)
    {

        $res = $formFields["test"];
        $totalCmd = 0;
        foreach($res as $resultat) {
            $totalCmd += $resultat["totalPrice"];
        }
        $newOrder = new OrderModel();
        $user = new UserSession();
        $datUserId = $user->getField("userId");
        $lastId = $newOrder->newOrder($res,$totalCmd, $datUserId);
        //$http->redirectTo("/validation");
        $http->sendJsonResponse($lastId);
        //return ["cart"=>$totalCmd];

    }
}