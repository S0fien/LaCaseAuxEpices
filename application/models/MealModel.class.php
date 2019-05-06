<?php
class MealModel {
    public function getAll() {
        $data = new Database();
        $meals = $data->query("SELECT * FROM meal");
        return $meals;
    }
    function getOneMeal($id){
        $db = new Database();
        return $db->queryOne("SELECT * FROM meal WHERE Id = ?", [$id]);
    }
}

?>