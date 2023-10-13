var fecha = document.getElementById("fecha");
var respuesta = document.getElementById("contenido_transaccion");
var formulario = document.getElementById("formulario_transaccion");

formulario.addEventListener("submit", function (e) {
    e.preventDefault(); // Evita que se recargue la página
    
    let url = "http://localhost/bd2022/trabajo-base-datos/web/main/consulta_transaccion.php";
    url = new URL(url);
    url.searchParams.append("fecha", fecha.value);

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