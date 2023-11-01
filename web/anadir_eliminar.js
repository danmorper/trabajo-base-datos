var formulario_anadir_eliminar = document.getElementById("formulario_anadir_eliminar");

formulario_anadir_eliminar.addEventListener("submit", function (e) {
    e.preventDefault(); // Evita que se recargue la página
    
    var datos = new FormData(formulario_anadir_eliminar);
    console.log(datos);
    console.log(datos.get("anadir?eliminar?"));
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

// getelementbyid con id anadir
// getelementbyid con id eliminar

var anadir = document.getElementById("anadir");
var eliminar = document.getElementById("eliminar");

// si eliminar esta seleccionado, no se puede introducir nombre, apllido, fecha_nacimiento, ID_Cuenta

anadir.addEventListener("click", function () {
    document.getElementById("nombre_anadir_eliminar").disabled = false;
    document.getElementById("apellido_anadir_eliminar").disabled = false;
    document.getElementById("fecha_anadir_eliminar").disabled = false;
    document.getElementById("ID_Cuenta_anadir_eliminar").disabled = false;
});

eliminar.addEventListener("click", function () {
    document.getElementById("nombre_anadir_eliminar").disabled = true;
    document.getElementById("apellido_anadir_eliminar").disabled = true;
    document.getElementById("fecha_anadir_eliminar").disabled = true;
    document.getElementById("ID_Cuenta_anadir_eliminar").disabled = true;
});