<?php

class OrderModel{
    // que des fonctions effectuant des actions sur la bdd

    function insertOrder($totalAmount){
        $db = new Database();
        $id = $db->executeSql("INSERT INTO orders (userId, totalAmount, taxAmount) VALUES (?,?,?)", [$_SESSION["userId"], $totalAmount, $totalAmount*0.2]);
        return $id;
    }

    function insertOrderline($quantity, $mealId, $orderId, $priceEach){
        $db = new Database();
        $db->executeSql("INSERT INTO orderline (quantityOrdered, mealId, orderId, priceEach) VALUES(?,?,?,?)", [$quantity, $mealId, $orderId, $priceEach]);
    }

    function getUserByOrder($id){
        $db = new Database();
        return $db->queryOne("SELECT * FROM user INNER JOIN orders ON orders.userId = user.id WHERE orders.id = ?", [$id]);
    }

    function getOrder($id){
        $db = new Database();
        return $db->query("SELECT meal.photo, meal.id, meal.name, meal.salePrice, orders.totalAmount, orders.creationTimeStamp, orders.taxAmount, orderline.quantityOrdered, orderline.mealId, orderline.priceEach from orders 
			INNER JOIN 
			orderline ON orders.id = orderline.orderId INNER JOIN meal ON meal.id = orderline.mealId WHERE orders.id = ?", [$id]);
    }
}

?>