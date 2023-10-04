<?php


$usuario=$_POST['usuario'];
$contraseña=$_POST['contraseña'];

// $session no es necesario, pero lo dejo por si me sobra tiempo
if ($usuario=="admin" && $contraseña=="admin") {
    header("Location: ../buscador.html");
} else {
    echo "<script> window.alert('Usuario o contraseña incorrectos');
    window.location.href='login.html' </script>";
}