<?php
class UserModel {
    public function addOne($values) {
        $pwd = password_hash($values['password'], PASSWORD_DEFAULT);
        $data = new Database();
        $result = $data->executeSql("
        INSERT INTO user (address, birthDay, city, country, email, firstName, lastName, password, phone, zipCode)
        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?); 
        ", array($values['address'], $values["birthDate"], $values['city'], $values['country'], $values['mail'], $values['firstName'], $values['lastName'], $pwd, $values['phone'], $values['zipCode']));
        return $result;
    }

    public function logIn($values) {
        $data = new Database();
        $result = $data->queryOne("
        SELECT * FROM user
        WHERE email = ?
        ", array($values["mail"]));
        if (password_verify($values["password"], $result["password"])) {
            echo "Utilisateur OK!";
            $data->executeSql("
            UPDATE user SET lastLoginTimestamp = now() WHERE email = ?
            ", array($values["mail"]));
            $session = new UserSession(true);
            $session->addField("userName",$result["firstName"]." ".$result["lastName"]);
            $session->addField("userId",$result["id"]);
        }
        else {
            echo "Mauvais mot de passe! ";
        }
        return $result;
    }

    public function getById($value) {
        $data = new Database();
        $result = $data->queryOne("
        SELECT * FROM user
        WHERE id = ?
        ", array($value));
        return $result;
    }
}

?>