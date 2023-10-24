<?php
$ID_Cliente = 55;

$db = 'mysql:host=localhost;dbname=EconomiaDB;charset=utf8';
$user = 'root';
$pass = '';

$conn = new PDO($db, $user, $pass);

// Selecciono las cuentas que solo tienen un cliente y veo si el cliente que quiero borrar está en alguna de esas cuentas

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

    // var_dump($resultado);

    foreach ($resultado as $c) {
        echo $c["ID_Cuenta"] . "<br>";
        

        // Eliminar de Cliente_Cuenta
        $sql = "DELETE FROM Cliente_Cuenta WHERE ID_Cuenta = :ID_Cuenta";
        echo "hola <br>";
        $consulta = $conn->prepare($sql);
        echo "prepare <br>";
        $consulta -> bindParam("ID_Cuenta", $c["ID_Cuenta"]);
        echo "bindparam <br>";
        $consulta -> execute();

        
        echo "Eliminado de Cliente_Cuenta <br>";
        
    //     // Eliminar de Cuenta
    //     $sql = "DELETE FROM Cuenta WHERE ID_Cuenta = :ID_Cuenta";
    //     $consulta = $conn->prepare($sql);
    //     $consulta -> bindParam("", $c["ID_Cuenta"], PDO::PARAM_INT);
    //     $consulta -> execute();

        
    }

?>