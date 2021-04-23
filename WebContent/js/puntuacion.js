
///dibujar puntuacion///

if($("span") != null){
let num=$("span").html();
let decimal = num %1.0;

let absoluto = num - decimal;
$("span").html("");

for(let i=0;i<5;i++){
    if(i < absoluto){
    let elemento=document.createElement("label");
    elemento.setAttribute("class","full-star");
$("span").append(elemento);
    }
    else if(decimal > 0){
        let elemento=document.createElement("label");
        elemento.setAttribute("class","half-star");
    $("span").append(elemento);
    decimal = -1;
    }
    else{
        let elemento=document.createElement("label");
        elemento.setAttribute("class","star");
    $("span").append(elemento);
    }

}
}

//puntuar///
let formulario = document.querySelector("#puntuacion");
if(formulario !=null){
let inputs  = formulario.querySelectorAll("input");

for(let item of inputs){
 if(item.checked){actualizarPuntuacion(item)};
   item.addEventListener("click", puntuacion);
}}

function  puntuacion(e){
    let padre = e.currentTarget.parentElement;
    let estrellas  = document.querySelectorAll(".star, .full-star");
    for(let i = 0; i < estrellas.length; i++){
        if(estrellas[i] == padre){
            estrellas[i].setAttribute("class", "full-star");
         
            for(let f = i+1; f < estrellas.length; f++){
                estrellas[f].setAttribute("class", "star");
            }
            i = estrellas.length;
        
        }
        else{
            estrellas[i].setAttribute("class", "full-star");
        }
    }
}
function  actualizarPuntuacion(valor){
    let padre = valor.parentElement;
    let estrellas  = document.querySelectorAll(".star, .full-star");
    for(let i = 0; i < estrellas.length; i++){
        if(estrellas[i] == padre){
            estrellas[i].setAttribute("class", "full-star");
         
            for(let f = i+1; f < estrellas.length; f++){
                estrellas[f].setAttribute("class", "star");
            }
            i = estrellas.length;
        
        }
        else{
            estrellas[i].setAttribute("class", "full-star");
        }
    }
}