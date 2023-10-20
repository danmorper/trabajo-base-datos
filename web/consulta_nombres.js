var formulario = document.getElementById("formulario_nombre");
var respuesta = document.getElementById("contenido_nombre");

formulario.addEventListener("submit", function (e) {
    e.preventDefault(); // Evita que se recargue la página

    var datos = new FormData(formulario);
    console.log(datos.get("nombre")); // Obtiene el valor del campo name = "nombre"
    console.log(datos.get("apellido")); // Obtiene el valor del campo name = "apellido"
    fetch("consulta_nombres.php", {
        method: "POST",
        body: datos
    })
    // promesas
        .then(res => res.json()) 
        .then(data => {
            console.log(data);
            respuesta.innerHTML = ""; // Clear existing content

            if (data.length > 0) { // Check if there are elements in the response
                data.forEach(element => {
                    respuesta.innerHTML += `
                        <tr>
                            <td>${element.ID_Cliente}</td>
                            <td>${element.Nombre}</td>
                            <td>${element.Apellido}</td>
                            <td>${element.Fecha_nacimiento}</td>
                        </tr>
                    `;
                });
            } else {
                console.log("No results found");
                respuesta.innerHTML = "<tr><td colspan='4'>No se encontraron resultados</td></tr>";
            }
        })
});



