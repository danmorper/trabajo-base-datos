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
}
);

// Añadir div cuando se haga click en el botón con id "boton-sugerencia"

const boton = document.querySelector("#boton-sugerencia");
let sugerencias = document.querySelector("#anadir-sugerencias");
boton.addEventListener("click", () => {

    // Tomo titulo y texto de textarea
    let titulo = document.querySelector("#titulo").value;
    let texto = document.querySelector("#sugerencia").value;
    console.log(texto);

    // Creo 3 div uno para el titulo, otro para el texto y otro para los dos anteriores
    let div = document.createElement("div");
    let div_titulo = document.createElement("div");
    let div_texto = document.createElement("div");
    div_titulo.innerHTML = "<h3>" + titulo + "</h3>";
    div_texto.innerHTML = "<p>" + texto + "</p>";
    div.appendChild(div_titulo);
    div.appendChild(div_texto);
    sugerencias.appendChild(div);

    // Limpio titulo y textarea
    document.getElementById("titulo").value = "";
    document.querySelector("#sugerencia").value = "";
});