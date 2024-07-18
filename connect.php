<?php
    class DbConnect{
        function getDbConnect() {
            $dbConn = new mysqli("localhost", "root", "", "recipe")
            or die("Connection failed: " . $dbConn->connect_error);
            return $dbConn;
        }
    }
?>