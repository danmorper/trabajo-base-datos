var formulario = document.getElementById("formulario");
var respuesta = document.getElementById("contenido");

formulario.addEventListener("submit", function (e) {
    e.preventDefault(); // Evita que se recargue la página

    var datos = new FormData(formulario);
    //console.log(datos.get("nombre")); // Obtiene el valor del campo name = "nombre"
    //console.log(datos.get("apellido")); // Obtiene el valor del campo name = "apellido"
    fetch("consulta_nombres.php", {
        method: "POST",
        body: datos
    })
    // promesas
        .then(res => res.json()) 
        .then(data => {
            console.log(data[0]); 
            contenido.innerHTML = ``
            data.forEach(element => {
                respuesta.innerHTML += `
                <tr scope="row">
                <td>${element.ID_Cliente}</td>
                <td>${element.Nombre}</td>
                <td>${element.Apellido}</td>
                <td>${element.Fecha_nacimiento}</td>
                <\tr>
            `
            })
        })
});