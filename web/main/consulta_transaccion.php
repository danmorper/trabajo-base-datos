<?php
$fecha = $_GET["fecha"];
$divisa = $_GET["divisa"];

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

if ($divisa == "") {
    $sql = "SELECT * FROM Transaccion WHERE Fecha > :fecha";

    // Preparar la consulta
    $consulta = $conn -> prepare($sql);

    // Asignar valores a los parámetros
    $consulta -> bindParam(':fecha', $fecha);

} else {
    $sql = "SELECT T.ID_Transaccion, T.Fecha, T.Monto, T.Descripcion, T.ID_Cuenta, T.ID_Divisa
    FROM Transaccion as T INNER JOIN Divisa as D ON T.ID_Divisa = D.ID_Divisa 
    WHERE T.Fecha > :fecha AND D.Codigo = :divisa";

    // Preparar la consulta
    $consulta = $conn -> prepare($sql);

    // Asignar valores a los parámetros
    $consulta -> bindParam(':fecha', $fecha);
    $consulta -> bindParam(':divisa', $divisa);
}

// Ejecutar la consulta
$consulta -> execute();

// Ceramos consexión a BD
$conn = null;


// Arreglo asociativo de la consulta
$resultado = $consulta -> fetchAll(PDO::FETCH_ASSOC);

// Paso el arreglo a JSON
echo json_encode($resultado);




?>