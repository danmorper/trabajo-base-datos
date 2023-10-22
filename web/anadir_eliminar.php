<?php
// $ID_Cliente = $_POST["ID_Cliente"];
// $nombre = $_POST["Nombre"];
// $apellido = $_POST["Apellido"];
// $fecha_nacimiento = $_POST["Fecha_Nacimiento"];
// $ID_Cuenta = $_POST["ID_Cuenta"];
// $anadir_eliminar = $_POST["anadir?eliminar?"];

$ID_Cliente = 13;
$nombre = "Paco";
$apellido = "Perez";
$fecha_nacimiento = "1600-01-01";
$ID_Cuenta = 9;
$anadir_eliminar = "anadir";

$db = 'mysql:host=localhost;dbname=EconomiaDB;charset=utf8';
$user = 'root';
$pass = '';

try {
    $conn = new PDO($db, $user, $pass);
} catch (PDOException $e) {
    echo "Error de conexión a la BD";
    exit;
}

// Consulta a BD

if ($anadir_eliminar == "anadir") {

    // Añadir a Cliente
    $sql = "INSERT INTO Cliente (ID_Cliente, Nombre, Apellido, Fecha_Nacimiento, ID_Cuenta) VALUES (:ID_Cliente, :Nombre, :Apellido, :Fecha_Nacimiento, :ID_Cuenta)";

    $consulta = $conn->prepare($sql);

    $consulta -> bindParam(":ID_Cliente", $ID_Cliente);
    $consulta -> bindParam(":Nombre", $nombre);
    $consulta -> bindParam(":Apellido", $apellido);
    $consulta -> bindParam(":Fecha_Nacimiento", $fecha_nacimiento);
    $consulta -> bindColumn(":ID_Cuenta", $ID_Cuenta);

    $consulta -> execute();

    

    // Comprobar si ha pasado cuenta
    if ($ID_Cuenta != null) {
        
        // Añadir a Cliente_Cuenta
        $sql = "INSERT INTO Cliente_Cuenta (ID_Cliente, ID_Cuenta) VALUES (:ID_Cliente, :ID_Cuenta)";

        $consulta = $conn->prepare($sql);

        $consulta -> bindParam(":ID_Cliente", $ID_Cliente);
        $consulta -> bindParam(":ID_Cuenta", $ID_Cuenta);

        $consulta -> execute();

        
        
    }
} else {

    // Comprobar si las cuentas asociadas que tenga el cliente está el solo y si es asi borrar la cuenta tambien
    
    $sql = 
    "SELECT ID_Cuenta FROM Cliente_Cuenta 
    WHERE ID_Cuenta IN
    (SELECT ID_Cuenta
    FROM Cliente_Cuenta
    GROUP BY ID_Cuenta 
    HAVING COUNT(*) = 1)
    AND ID_Cliente = :ID_Cliente";

    $consulta = $conn->prepare($sql);
    $consulta -> bindParam(":ID_Cliente", $ID_Cliente);
    
    $consulta -> execute();

    

    $consulta -> fetchAll(PDO::FETCH_ASSOC);

    // eliminamos todas las cuentas asociadas al cliente que solo tenga el cliente
    foreach ($consulta as $c) {

        

        // Eliminar de Cliente_Cuenta
        $sql = "DELETE FROM Cliente_Cuenta WHERE ID_Cuenta = :ID_Cuenta";
        $consulta = $conn->prepare($sql);
        $consulta -> bindParam("", $c);
        $consulta -> execute();

        

        
        // Eliminar de Cuenta
        $sql = "DELETE FROM Cuenta WHERE ID_Cuenta = :ID_Cuenta";
        $consulta = $conn->prepare($sql);
        $consulta -> bindParam("", $c);
        $consulta -> execute();

        
    }

    

    // Eliminar de Cliente
    $sql = "DELETE FROM Cliente WHERE ID_Cliente = :ID_Cliente";

    $consulta = $conn->prepare($sql);
    $consulta -> bindParam(":ID_Cliente", $ID_Cliente);
    $consulta -> execute();

    $conn = null;
}

?>