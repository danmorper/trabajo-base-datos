var fecha = document.getElementById("fecha");
var tabla = document.getElementById("tabla_transaccion_");
var formulario = document.getElementById("formulario_transaccion");

formulario.addEventListener("submit", function llamarServidor(e) {
    e.preventDefault(); // Evita que se recargue la página
    
    let url = "http://localhost/bd2022/trabajo-base-datos/web/main/consulta_transaccion.php";
    url = new URL(url);
    url.searchParams.append("fecha", fecha.value);

    fetch(url, {method: "GET"})

        .then(res => res.json())

        .then(data => {
            console.log(data[0]);
        })            

}
);