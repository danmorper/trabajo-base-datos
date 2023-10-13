<?php
$fecha = $_GET["fecha"];

// db, user y pass
$db = 'mysql:host=localhost;dbname=EconomiaDB;charset=utf8';
$user = 'root';
$pass = '';

// Conexión a BD 

try {
    $conn = new PDO($db, $user, $pass);
} catch (PDOException $e) {
    echo "Error: " . $e -> getMessage();
}

// Consulta a BD

$sql = "SELECT * FROM transaccion WHERE Fecha > :fecha";

// Preparar la consulta
$consulta = $conn -> prepare($sql);

// Asignar valores a los parámetros
$consulta -> bindParam(':fecha', $fecha);

// Ejecutar la consulta
$consulta -> execute();

// Ceramos consexión a BD
$conn = null;


// Arreglo asociativo de la consulta
$resultado = $consulta -> fetchAll(PDO::FETCH_ASSOC);

// Paso el arreglo a JSON
echo json_encode($resultado);




?>