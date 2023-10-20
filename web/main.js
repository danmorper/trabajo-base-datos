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
