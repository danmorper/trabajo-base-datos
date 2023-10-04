<?php
echo "Conexión a BD con PDO<br>";
// Consulta a BD preparedas

//Obtenemos los datos del formulario
$nombre = $_POST['nombre'];
// $apellido = $_POST['apellido'];


// db, user y pass
$db = 'mysql:host=localhost;dbname=coches;charset=utf8';
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
$sql = "SELECT * FROM coche WHERE nombre = :nombre";

// Preparar la consulta
$consulta = $conn -> prepare($sql);

// Asignar valores a los parámetros
$consulta -> bindParam(':nombre', $nombre);
// $consulta -> bindParam(':apellido', $apellido);

// Ejecutar la consulta
$consulta -> execute();

// Ceramos consexión a BD
$conn = null;

var_dump($consulta);

// Mostrar resultados
while ($fila = $consulta->fetch(PDO::FETCH_ASSOC)) {
    // $fila contiene los datos de la fila actual como un arreglo asociativo
    echo "Nombre: " . $fila['nombre'] . "<br>";
    // echo "Apellido: " . $fila['apellido'] . "<br>";
    echo "codigo coche: " . $fila['codcoche'] . "<br>";
    // Puedes mostrar otros campos según la estructura de tu tabla
}