<?php
//  $fecha = $_GET["fecha"];
// $divisa = $_GET["divisa"];

$fecha = date("2020-01-01");
$divisa = array("EUR", "GBP", "CHF");

// var_dump($divisa);
// db, user y pass

$db = 'mysql:host=localhost;dbname=EconomiaDB;charset=utf8';
$user = 'root';
$pass = '';

// conexión a la BD
try {
    $conn = new PDO($db, $user, $pass);
} catch (PDOException $e) {
    echo "Error de conexión a la BD";
    exit;
}
// Consulta a BD

if (empty($divisa)) {
    $sql = "SELECT * FROM Transaccion WHERE Fecha > :fecha";

    // Preparar la consulta
    $consulta = $conn -> prepare($sql);

    // Asignar valores a los parámetros
    $consulta -> bindParam(':fecha', $fecha);

    // Ejecutar la consulta
    $consulta -> execute();

    echo json_encode($consulta -> fetchAll(PDO::FETCH_ASSOC));
} else {
    
    // En vez del foreach, se puede hacer una consulta con IN, pero no me funcionaba.

    foreach($divisa as $d) {
        echo $d;
        // No muestra GBP, luego no entra en el bucle. Por qué?
        // Si quito la consulta y solo dejo el echo, sí que muestra GBP
        $sql = "SELECT T.ID_Transaccion, T.Fecha, T.Monto, T.Descripcion, T.ID_Cuenta, T.ID_Divisa
        FROM Transaccion as T INNER JOIN Divisa as D ON T.ID_Divisa = D.ID_Divisa 
        WHERE T.Fecha > :fecha AND D.Codigo = :divisa";

        // Preparar la consulta
        $consulta = $conn -> prepare($sql);

        // Asignar valores a los parámetros
        $consulta -> bindParam(':fecha', $fecha);
        $consulta -> bindParam(':divisa', $d);

        // Ejecutar la consulta
        $consulta -> execute();

        // Solucionar posibles fallos de arrays no válidos a JSON
        $resultado = $consulta->fetchAll(PDO::FETCH_ASSOC);
        echo json_encode($resultado);
        $resultado = array_merge($resultado_guardar, $resultado);
        $resultado_guardar = $resultado;
        echo json_encode($resultado_guardar);
    }
    echo json_encode($resultado_guardar);
}

?>