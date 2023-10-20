<?php
// Consulta a BD preparedas

//Obtenemos los datos del formulario
$nombre = $_POST['nombre'];
$apellido = $_POST['apellido'];

// Prueba por si en la web no funciona
// $nombre = 'Antonio';

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
//si lo que hay después del try no es exitoso, 
//se ejecuta el catch y muestra el error que se produjo en la conexión (getMessage())

// Consulta a BD
$sql = "SELECT * FROM Cliente WHERE Nombre = :nombre OR Apellido = :apellido" ;

// Preparar la consulta
$consulta = $conn -> prepare($sql);

// Asignar valores a los parámetros
$consulta -> bindParam(':nombre', $nombre);
$consulta -> bindParam(':apellido', $apellido);

// Ejecutar la consulta
$consulta -> execute();


// Ceramos consexión a BD
$conn = null;

// Arreglo asociativo de la consulta
$resultado = $consulta -> fetchAll(PDO::FETCH_ASSOC);

// // Mostrar resultados
// while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
//     // $fila contiene los datos de la fila actual como un arreglo asociativo
//     echo "Nombre: " . $fila['Nombre'] . "<br>";
//     echo "Apellido: " . $fila['Apellido'] . "<br>";
//     // Puedes mostrar otros campos según la estructura de tu tabla
// }

// Paso el arreglo a JSON
echo json_encode($resultado);

?>