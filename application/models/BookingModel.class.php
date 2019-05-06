<?php
class BookingModel {
    public function bookTable($values,$userId){
        $data = new Database();
        $time = $values["bookHours"].$values["bookMins"];
        $result = $data->executeSql("
        INSERT INTO booking (bookingDate, bookingTime, numberOfSeats, userId)
        VALUES (?,?,?,?)", array($values['bookDate'], $time, $values['bookSeats'], $userId));
        return $result;
    }
}

