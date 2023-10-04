<?php

// mysqli no lo hemos usado, mirar apuntes de Luis, hemos usado PDO

//Estructura básica para entender los queries en PHP

// check this video: https://www.youtube.com/watch?v=u4HmQjLvNe8
// First of all I need to connect the database
$mysqli = new mysqli("localhost", "root", "", "EconomiaDB");

// Check connection
if ($mysqli->connect_errno) {
    printf("Connect failed: %s\n", $mysqli->connect_error);
    exit();
}

// Now I need to get the data from the database
$query = "SELECT * FROM `cliente`";
$result = $mysqli->query($query);


print_r( $result-> fetch_assoc());

echo "<br>";

// Now I need to display the data
while($row = $result-> fetch_assoc()) {
    $products[] = $row; // We're adding every product to the products[] array. When the loop is finished we'll have an array with all the products
}

echo "<br>";

print_r($products);

echo "<br>";
echo "<br>";
echo "<br>";

// To access the products[] array's values, we use a foreach loop. For example:
foreach($products as $product) {
    echo $product['Nombre']; // This will echo the product's name
}

?>