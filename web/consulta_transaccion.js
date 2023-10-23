var respuesta_transaccion = document.getElementById("contenido_transaccion");
let formulario_transaccion = document.getElementById("formulario_transaccion");



formulario_transaccion.addEventListener("submit", function (e) {
    e.preventDefault(); // Evita que se recargue la página

    let divisaSeleccionada = document.querySelectorAll('input[name="divisa"]:checked');
    let divisaSeleccionada2 = Array.from(divisaSeleccionada);
    console.log(divisaSeleccionada);
    var fecha = document.getElementById("fecha");

    
    let url = "http://localhost/bd2022/trabajo-base-datos/web/consulta_transaccion.php";
    url = new URL(url);
    url.searchParams.append("fecha", fecha.value);
    // añade divisa si es seleccionada
    if (divisaSeleccionada != null) {
        // divisaSeleccionada.forEach(divisa => {
            url.searchParams.append("divisa", JSON.stringify(divisaSeleccionada2.map(divisa => divisa.id)));

        // });
    } else {
        url.searchParams.append("divisa", "");
    }


    console.log(url.toString());

    fetch(url, {method: "GET"})

        .then(res => res.json())

        .then(data => {
            console.log(data);
            respuesta_transaccion.innerHTML = ``;
            data.forEach(element => {
                respuesta_transaccion.innerHTML += `
                <tr scope="row">
                <td>${element.ID_Transaccion}</td>
                <td>${element.Fecha}</td>
                <td>${element.Monto}</td>
                <td>${element.Descripcion}</td>
                <td>${element.ID_Cuenta}</td>
                <td>${element.ID_Divisa}</td>
                </tr>
            `
            })
        })

}
);