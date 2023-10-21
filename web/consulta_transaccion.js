var respuesta = document.getElementById("contenido_transaccion");
var formulario = document.getElementById("formulario_transaccion");



formulario.addEventListener("submit", function (e) {

    var divisaSeleccionada = document.querySelectorAll('input[name="divisa"]:checked');
    console.log(divisaSeleccionada);
    var fecha = document.getElementById("fecha");

    e.preventDefault(); // Evita que se recargue la página
    
    let url = "http://localhost/bd2022/trabajo-base-datos/web/consulta_transaccion.php";
    url = new URL(url);
    url.searchParams.append("fecha", fecha.value);
    // añade divisa si es seleccionada
    if (divisaSeleccionada != null) {
        divisaSeleccionada.forEach(divisa => {
            url.searchParams.append("divisa", divisa);
        });
    } else {
        url.searchParams.append("divisa", "");
    }


    url
    console.log(url);
    fetch(url, {method: "GET"})

        .then(res => res.json())

        .then(data => {
            console.log(data);
            respuesta.innerHTML = ``;
            data.forEach(element => {
                respuesta.innerHTML += `
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