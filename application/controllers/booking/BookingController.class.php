<?php

class BookingController
{
    public function httpGetMethod(Http $http, array $queryFields)
    {

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
        echo "ma session est démarrée ?";
        $datBooking = new BookingModel();
        $session = new UserSession();
        $datBooking->bookTable($formFields,$session->getField("userId"));
        $http->redirectTo("/");
    }
}