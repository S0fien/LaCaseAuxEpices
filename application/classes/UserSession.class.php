<?php
/**
 * Created by PhpStorm.
 * User: wa130-10
 * Date: 21/03/19
 * Time: 11:36
 */

class UserSession{
    function __construct(){
            session_start();
    }
    function addField($fieldName, $value){
        $_SESSION[$fieldName] = $value;
    }

    function getField($fieldName){
        return $_SESSION[$fieldName];
    }

    function destroy(){
        session_destroy();
    }
}