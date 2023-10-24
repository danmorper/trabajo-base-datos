var formulario_anadir_eliminar = document.getElementById("formulario_anadir_eliminar");

formulario_anadir_eliminar.addEventListener("submit", function (e) {
    e.preventDefault(); // Evita que se recargue la página
    
    var datos = new FormData(formulario);
    if (datos.get("anadir?eliminar?") == null) {
        alert("Seleccione si desea añadir o eliminar");
    } else {
        console.log(datos.get("ID_Cliente")); // Obtiene el valor del campo name = "ID_Cliente"
        console.log(datos.get("nombre")); // Obtiene el valor del campo name = "nombre"
        console.log(datos.get("apellido")); // Obtiene el valor del campo name = "apellido"
        console.log(datos.get("fecha_nacimiento")); // Obtiene el valor del campo name = "fecha_nacimiento"
        console.log(datos.get("ID_Cuenta")); // Obtiene el valor del campo name = "ID_Cuenta"
        console.log(datos.get("anadir?eliminar?")); // Obtiene el valor del campo name = "anadir?eleminar?"

        fetch("anadir_eliminar.php", {
            method: "POST",
            body: datos
    });
    }
});