// Cambiar el color de los párrafos al pasar el ratón por encima

const parrafos = document.querySelectorAll(".cambiar");

parrafos.forEach((parrafo) => {
    parrafo.addEventListener("mouseover", () => {
        parrafo.classList.add("nuevaClase");
    });

    parrafo.addEventListener("mouseout", () => {
        parrafo.classList.remove("nuevaClase");
    });
});

// Cambiar el tamaño de las imagenes al pasar el ratón por encima

const imagenes = document.querySelectorAll(".imagen");

imagenes.forEach((imagen) => {
    imagen.addEventListener("mouseover", () => {
        imagen.classList.add("nuevaClase2");
    });

    imagen.addEventListener("mouseout", () => {
        imagen.classList.remove("nuevaClase2");
    });
});

// Añadir div cuando se haga click en el botón con id "boton-sugerencia"

const boton = document.querySelector("#boton-sugerencia");
let sugerencias = document.querySelector("#anadir-sugerencias");
let num_sugerencias = 0; // Hay 0 sugerencias

boton.addEventListener("click", () => {
    // Tomo titulo y texto de textarea
    let titulo = document.querySelector("#titulo").value;
    let texto = document.querySelector("#texto-sugerencia").value;
    console.log(texto);
    if (titulo == "" || texto == "") {
        alert("Debes rellenar todos los campos");
    } else {
        num_sugerencias += 1; // Añado una sugerencia
        console.log(num_sugerencias);

        // Creo 3 div uno para el titulo, otro para el texto y otro para los dos anteriores
        let div = document.createElement("div");
        div.id = "divid" + num_sugerencias; // Le pongo una id para usarla luego para mostrar el texto
        div.classList.add("sugerencia"); // Le añado la clase sugerencia para usar queryselectorall
        div.innerHTML += "<h3 onclick='aparece(event)' id="+`titulo${num_sugerencias}>`+ titulo + "</h3>";
        div.innerHTML += "<p id="+`texto${num_sugerencias}>` + texto + "</p>";
        sugerencias.appendChild(div);

        // Limpio titulo y textarea
        document.getElementById("titulo").value = "";
        document.querySelector("#texto-sugerencia").value = "";

        // // Ocultar texto de la sugerencia que hemos añadido
        document.getElementById(`texto${num_sugerencias}`).style.display = "none";

    }
});


// Funcion para mostrar el texto de la sugerencia
function aparece(event) {
    let idtitulo = event.target.id; // Cojo el id del titulo
    console.log(idtitulo[6]);
    let texto = document.getElementById("texto"+idtitulo[6]);
    // console.log(texto);
    // console.log(texto.style.display);
    if (texto.style.display == "block") {
        texto.style.display = "none";
    } else {
        texto.style.display = "block";
    }
}