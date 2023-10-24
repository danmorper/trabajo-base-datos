<?php
$ID_Cliente = $_POST["ID_Cliente"];
$nombre = $_POST["nombre"];
$apellido = $_POST["apellido"];
$fecha_nacimiento = $_POST["fecha_nacimiento"];
$ID_Cuenta = $_POST["ID_Cuenta"];
$anadir_eliminar = $_POST["anadir?eliminar?"];

echo $nombre . " ". $apellido ." " . $fecha_nacimiento . " " . $ID_Cuenta . " " . $anadir_eliminar;
// $ID_Cliente = 13;
// $nombre = "Paco";
// $apellido = "Perez";
// $fecha_nacimiento = "1600-01-01";
// $ID_Cuenta = 9;
// $anadir_eliminar = "anadir";

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
    $sql = "INSERT INTO Cliente (ID_Cliente, Nombre, Apellido, Fecha_nacimiento) 
            VALUES (:ID_Cliente, :Nombre, :Apellido, :Fecha_Nacimiento)";

    $consulta = $conn->prepare($sql);

    $consulta -> bindParam(":ID_Cliente", $ID_Cliente, PDO::PARAM_INT);
    $consulta -> bindParam(":Nombre", $nombre, PDO::PARAM_STR);
    $consulta -> bindParam(":Apellido", $apellido, PDO::PARAM_STR);
    $consulta -> bindParam(":Fecha_Nacimiento", $fecha_nacimiento);

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

    

    $resultado = $consulta -> fetchAll(PDO::FETCH_ASSOC);

    // eliminamos todas las cuentas asociadas al cliente que solo tenga el cliente
    foreach ($resultado as $c) {
        // Eliminar de Cliente_Cuenta
        $sql = "DELETE FROM Cliente_Cuenta WHERE ID_Cuenta = :ID_Cuenta";
        // Puedo poner solo ID_Cuenta para eliminar porque ya he comprobado que esa cuenta solo tiene un cliente (el que voy a borrar)
        $consulta = $conn->prepare($sql);
        $consulta -> bindParam("ID_Cuenta", $c["ID_Cuenta"]);
        $consulta -> execute();

        

        //NO ELIMINO LA CUENTA PORQUE PUEDE HABER TRANSACCIONES A ESA CUENTA, SI ELIMINO CUENTA ELIMINO LOS REGISTROS
        // DE TRANSACCIONES A ESA CUENTA
        // // Eliminar de Cuenta
        // $sql = "DELETE FROM Cuenta WHERE ID_Cuenta = :ID_Cuenta";
        // $consulta = $conn->prepare($sql);
        // $consulta -> bindParam("ID_Cuenta", $c["ID_Cuenta"]);
        // $consulta -> execute();
        
    }

    

    // Eliminar de Cliente
    $sql = "DELETE FROM Cliente WHERE ID_Cliente = :ID_Cliente";

    $consulta = $conn->prepare($sql);
    $consulta -> bindParam(":ID_Cliente", $ID_Cliente);
    $consulta -> execute();

    $conn = null;
}

?>