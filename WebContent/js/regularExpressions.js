
$(".buscar").click(function(){
    ValidarNombre();
    ValidarApellidos();
    ValidarEmail();
    ValidarRepEmail();
    ValidarTelefono();
    ValidarPassword();
    ValidarRepPassword();
    ValidarCP();
    ValidarPortal();
    ValidarPiso();
    ValidarCalle();
});

function ValidarNombre(){
let regExpNombre= new RegExp(/^[a-zA-Z]{3,45}$/);
let nombre=document.getElementsByTagName("input")[1];
if(regExpNombre.test(nombre.value)){
nombre.style.backgroundColor="white";
}
else{
nombre.style.backgroundColor="red";
}

}

function ValidarApellidos(){
let regExpApellidos= new RegExp(/^[A-Za-z]{3,45}$/);
let apellidos=document.getElementsByTagName("input")[2];
if(regExpApellidos.test(apellidos.value)){
    apellidos.style.backgroundColor="white";
   }
   else{
    apellidos.style.backgroundColor="red";
   }

}

function ValidarPassword(){
    let regExpPassword= new RegExp(/.+/);
    let pass=document.getElementsByTagName("input")[3];
    
    if(regExpPassword.test(pass.value)){
       pass.style.backgroundColor="white";
       }
       else{
        pass.style.backgroundColor="red";
       }
    }
    
    function ValidarRepPassword(){
    let regExpRegPassword= new RegExp(/.+/);
    let pass=document.getElementsByTagName("input")[4];
    let repPass=document.getElementsByTagName("input")[7];
    
    if(regExpRegPassword.test(repPass.value)){
        if(repPass.value==pass.value){
            repPass.style.backgroundColor="white";
        }
        else{
            repPass.style.backgroundColor="red";
        }
    }
}

function ValidarEmail(){
let regExpEmail= new RegExp(/.+@.+\..+/);
let email=document.getElementsByTagName("input")[5];
if(regExpEmail.test(email.value)){
    email.style.backgroundColor="white";
   }
   else{
    email.style.backgroundColor="red";
   }
}
function ValidarRepEmail(){
    let regExpRepEmail= new RegExp(/.+@.+\..+/);
    let repEmail=document.getElementsByTagName("input")[6];
    if(regExpRepEmail.test(repEmail.value)){
        repEmail.style.backgroundColor="white";
       }
       else{
        repEmail.style.backgroundColor="red";
       }
    }

function ValidarTelefono(){
let regExpTelefono= new RegExp(/^[1-9][0-9]{8}$|^\+[0-9]{2}\s[0-9]{9}$/);
let tlf=document.getElementsByTagName("input")[7];
if(regExpTelefono.test(tlf.value)){
    tlf.style.backgroundColor="white";
   }
   else{
    tlf.style.backgroundColor="red";
   }
}
function ValidarPiso(){
    let regExpPiso= new RegExp(/^[1-9][0-9]{2}$/);
    let piso=document.getElementsByTagName("input")[8];
    if(regExpPiso.test(piso.value)){
        piso.style.backgroundColor="white";
       }
       else{
        piso.style.backgroundColor="red";
       }
    }

    function ValidarPortal(){
        let regExpPortal= new RegExp(/^[1-9][0-9]{2}$/);
        let portal=document.getElementsByTagName("input")[9];
        if(regExpPortal.test(portal.value)){
            portal.style.backgroundColor="white";
           }
           else{
            portal.style.backgroundColor="red";
           }
        }
        

function ValidarCP(){
let regExpCP= new RegExp(/^[0-9]{5}$/);
let cp=document.getElementsByTagName("input")[10];
if(regExpCP.test(cp.value)){
    cp.style.backgroundColor="white";
   }
   else{
    cp.style.backgroundColor="red";
   }
}
function ValidarCalle(){
    let regExpCalle= new RegExp(/^[A-Za-z]{4,45}$/);
    let calle=document.getElementsByTagName("input")[11];
    if(regExpCalle.test(calle.value)){
        calle.style.backgroundColor="white";
       }
       else{
        calle.style.backgroundColor="red";
       }
    }

