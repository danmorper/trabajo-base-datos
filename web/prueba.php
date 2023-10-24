<?php
$ID_Cliente = 13;

$db = 'mysql:host=localhost;dbname=EconomiaDB;charset=utf8';
$user = 'root';
$pass = '';

$conn = new PDO($db, $user, $pass);


$sql = "INSERT INTO Cliente (ID_Cliente) 
VALUES (:ID_Cliente)";

$consulta = $conn->prepare($sql);

$consulta -> bindParam(":ID_Cliente", $ID_Cliente);

$consulta -> execute();



?>