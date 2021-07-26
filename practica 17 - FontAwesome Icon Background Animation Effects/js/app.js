var fondo = document.createElement("div");
fondo.id = "fondo"
fondo.classList.add("fondo");
for (let f = 0; f < 25; f++) {
    var fila = document.createElement("div");
    fila.id = "row"
    fila.classList.add('row');
    for (let i = 0; i < 10; i++) {
        var tramos = document.createElement("div");
        for (let e = 0; e < 18; e++) {
            var contenido = document.createElement("i");
            switch (e) {
                case 0:
                    contenido.classList.add('far', 'fa-address-book');
                    break;
                case 1:
                    contenido.classList.add('fas', 'fa-bath');
                    break;
                case 2:
                    contenido.classList.add('fas', 'fa-thermometer-half');
                    break;
                case 3:
                    contenido.classList.add('fas', 'fa-balance-scale');
                    break;
                case 4:
                    contenido.classList.add('fas', 'fa-battery-half');
                    break;
                case 5:
                    contenido.classList.add('fas', 'fa-bell');
                    break;
                case 6:
                    contenido.classList.add('fas', 'fa-bicycle');
                    break;
                case 7:
                    contenido.classList.add('fas', 'fa-bolt');
                    break;
                case 8:
                    contenido.classList.add('fas', 'fa-bullhorn');
                    break;
                case 9:
                    contenido.classList.add('far', 'fa-comment-dots');
                    break;
                case 10:
                    contenido.classList.add('far', 'fa-envelope');
                    break;
                case 11:
                    contenido.classList.add('fas', 'fa-gift');
                    break;
                case 12:
                    contenido.classList.add('fas', 'fa-glass-martini');
                    break;
                case 13:
                    contenido.classList.add('fas', 'fa-globe');
                    break;
                case 14:
                    contenido.classList.add('fas', 'fa-graduation-cap');
                    break;
                case 15:
                    contenido.classList.add('far', 'fa-heart');
                    break;
                case 16:
                    contenido.classList.add('fas', 'fa-hourglass-end');
                    break;
                case 17:
                    contenido.classList.add('fab', 'fa-twitter');
                    break;
                default:
                    break;
            }
            tramos.appendChild(contenido);
        }
        fila.appendChild(tramos);
    }
    fondo.appendChild(fila);
}
document.body.appendChild(fondo);