	 
	 //Cookies: para recordar el email del usuario
	 
	  //función para crear la cookie
	 function setCookie(nombre, valor, tExpirar) {
	    let tiempo = new Date();
	     tiempo.setTime(tiempo.getTime() + (tExpirar*24*60*60*1000));
	    let expiracion = "expires="+ tiempo.toUTCString();
	     document.cookie = nombre + "=" + valor + ";" + expiracion + ";path=/";
	    }
	    
	
	  //función para obtener la cookie
	    let getCookie = name => {
	        let nameEQ = name + "=";
	        let ca = document.cookie.split(";");
	        for (var i = 0; i < ca.length; i++) {
	        let c = ca[i];
	        while (c.charAt(0) === " ") c = c.substring(1, c.length);
	        if (c.indexOf(nameEQ) === 0) return c.substring(nameEQ.length,
	            c.length);
	        }
	       return null;
	       };
	       
	         //función para establecer las cookies relacionadas con 
	        //el recordatorio de usuario
	        
		    function recordarCookie(){
		    if(recordarUsuario.checked){
			   let email=mail.value;
				let usuario = "";
			if(inputCliente.checked){
				usuario = inputCliente.value;
			}
			else{
				usuario = inputCuidador.value;
			}
	        if(recordarCook==null){
	            setCookie(usuario,email,20);
	        }
			else{
			recordarCook;
			}
			}
			formLogin.submit();
	    }
		
		function imprimirCookie(e){
			let target = "";
			if(e != null){
				target = e.currentTarget.value;
			}
			mail.value = "";
			mail.value = getCookie(target);
		}
		
	 
	        //variables relacionadas con el HTML
	       let recordarCook= getCookie("usuarioMail");
			let formLogin = document.getElementById("formLogin");
			let inputCuidador = document.querySelectorAll("input")[1];
				let inputCliente = document.querySelectorAll("input")[2];
	       let mail = document.querySelectorAll("input")[3];
	       let pass = document.querySelectorAll("input")[4];
	       let recordarUs = document.querySelector("#formLogin button");
	      let accessCook=document.getElementById("login");
	 let recordarUsuario = document.querySelectorAll("input")[5];
	
	      if(recordarUs!=null){
			
			recordarUs.addEventListener("click", recordarCookie);
			inputCuidador.addEventListener("click", imprimirCookie);
			inputCliente.addEventListener("click", imprimirCookie);
		}
		

	  //Expresiones regulares: para los registros de cliente y cuidador
	 
	 $(".buscar").click(function(){
	let error = [];
    error.push(ValidarNombre());
    error.push(ValidarApellidos());
    error.push(ValidarEmail());
    error.push(ValidarRepEmail());
    error.push(ValidarTelefono());
    error.push(ValidarPassword());
    error.push(ValidarRepPassword());
    error.push(ValidarCP());
    error.push(ValidarPortal());
    error.push(ValidarPiso());
    error.push(ValidarCalle());
    if(!error.includes(true)){
    	$("#access > form").submit();
    }
});

function ValidarNombre(){
let regExpNombre= new RegExp(/^[a-zA-Z\u00C0-\u024F\u1E00-\u1EFF]{3,45}$/);
let nombre=document.getElementsByTagName("input")[1];
if(regExpNombre.test(nombre.value)){
nombre.style.backgroundColor="white";
return false;
}
else{
nombre.style.backgroundColor="red";
return true;
}

}

function ValidarApellidos(){
let regExpApellidos= new RegExp(/^[A-Za-z\u00C0-\u024F\u1E00-\u1EFF]{1,45}$/);
let apellidos=document.getElementsByTagName("input")[2];
if(regExpApellidos.test(apellidos.value)){
    apellidos.style.backgroundColor="white";
    return false;
   }
   else{
    apellidos.style.backgroundColor="red";
    return true;
   }

}

function ValidarPassword(){
    let regExpPassword= new RegExp(/.+/);
    let pass=document.getElementsByTagName("input")[3];
    
    if(regExpPassword.test(pass.value)){
       pass.style.backgroundColor="white";
       return false;
       }
       else{
        pass.style.backgroundColor="red";
        return true;
       }
    }
    
    function ValidarRepPassword(){
    let regExpRegPassword= new RegExp(/.+/);

    let repPass=document.getElementsByTagName("input")[4];
    
    if(regExpRegPassword.test(repPass.value)){
        if(repPass.value==pass.value){
            repPass.style.backgroundColor="white";
            return false;
        }
        else{
            repPass.style.backgroundColor="red";
            return true;
        }
    }
}

function ValidarEmail(){
let regExpEmail= new RegExp(/.+@.+\..+/);
let email=document.getElementsByTagName("input")[5];
if(regExpEmail.test(email.value)){
    email.style.backgroundColor="white";
    return false;
   }
   else{
    email.style.backgroundColor="red";
    return true;
   }
}
function ValidarRepEmail(){
    let regExpRepEmail= new RegExp(/.+@.+\..+/);
    let repEmail=document.getElementsByTagName("input")[6];
    if(regExpRepEmail.test(repEmail.value)){
        repEmail.style.backgroundColor="white";
        return false;
       }
       else{
        repEmail.style.backgroundColor="red";
        return true;
       }
    }

function ValidarTelefono(){
let regExpTelefono= new RegExp(/^[0-9]{9}$/);
let tlf=document.getElementsByTagName("input")[7];
if(regExpTelefono.test(tlf.value)){
    tlf.style.backgroundColor="white";
    return false;
   }
   else{
    tlf.style.backgroundColor="red";
    return true;
   }
}
function ValidarPiso(){
    let regExpPiso= new RegExp(/^[1-9][0-9]$|[1-9]$/);
    let piso=document.getElementsByTagName("input")[8];
    if(regExpPiso.test(piso.value)){
        piso.style.backgroundColor="white";
        return false;
       }
       else{
        piso.style.backgroundColor="red";
        return true;
       }
    }

    function ValidarPortal(){
        let regExpPortal= new RegExp(/[1-9][0-9]$|[1-9]$/);
        let portal=document.getElementsByTagName("input")[9];
        if(regExpPortal.test(portal.value)){
            portal.style.backgroundColor="white";
            return false;
           }
           else{
            portal.style.backgroundColor="red";
            return true;
           }
        }
        

function ValidarCP(){
let regExpCP= new RegExp(/^[0-9]{5}$/);
let cp=document.getElementsByTagName("input")[10];
if(regExpCP.test(cp.value)){
    cp.style.backgroundColor="white";
    return false;
   }
   else{
    cp.style.backgroundColor="red";
    return true;
   }
}
function ValidarCalle(){
    let regExpCalle= new RegExp(/\s*([A-Za-z\u00C0-\u024F\u1E00-\u1EFF]{1,45}){1,10}/);
    let calle=document.getElementsByTagName("input")[11];
    if(regExpCalle.test(calle.value)){
        calle.style.backgroundColor="white";
        return false;
       }
       else{
        calle.style.backgroundColor="red";
        return true;
       }
    }
	 //Date: para calcular la edad de una mascota
	 
	 let fecha = document.getElementById("fechaNacMasc");
	 if(fecha != null){
	 fecha = fecha.innerHTML;
	 }
	 

	function calcularEdad(){
		let dataNac = new Date(fecha);
		let dataAct = new Date();
		let letra = '&Ntilde';
		let years = Math.abs(dataNac.getFullYear() - dataAct.getFullYear());
		$("#fechaNacMasc").next().text(years + " a\u00f1os");
			
	}
	
	
	if(fecha != null){
	calcularEdad();
	}
	//date cuenta atrás contrato duracion
	
			
	let dataDesde = document.querySelector("#fechaDuracion strong");
	let contador = document.getElementById("contador");
	if(dataDesde != null){
		dataDesde = dataDesde.innerHTML;
		
	}	
	function cuentaAtras(){
	let fechas = dataDesde.split("hasta");
	
	let dataStart = new Date(fechas[0].trim());
	let dataEnd = new Date(fechas[1].trim());
	if(dataEnd > new Date()){
	let diferencia = Math.abs( dataStart - dataEnd);
	let seconds = diferencia / 1000;
	let years = Math.abs(dataStart.getFullYear() - dataEnd.getFullYear());
	let month = Math.abs(dataStart.getMonth() - dataEnd.getMonth());
	let dias = Math.floor(seconds/86400);
	
	contador.innerHTML = "El contrato finaliza en  " + month + " meses y " + dias +  " dias";
}
	}
	if(dataDesde !=null){
	
	cuentaAtras();

}

//llamada a AJAX: cargar las poblaciones según la provincia seleccionada en Acceso y Registro

let poblacion = document.getElementById("poblacion");
let prov = document.getElementById("provincia");
if(prov != null){
	prov.onchange = seleccionarPoblacion;

}
function seleccionarPoblacion(e){
	let prov = e.currentTarget.value;
	
	$.post("localidad",{
	action:"poblacion",
	provincia:prov},
	function(json){
		removeSelect(poblacion);
		for(item of json){
		let option = document.createElement("option");
		option.value = item.idPoblacion;
		option.innerHTML = item.nombre;
		poblacion.insertAdjacentElement("beforeend", option);
		}
	}
	)
}
function removeSelect(valor){
	for(let i = valor.options.length-1; i >= 1; i--){
	valor.options[i].remove();
	
	}
}

		

		
	
	    	