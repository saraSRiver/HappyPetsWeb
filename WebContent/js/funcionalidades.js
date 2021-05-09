	 
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
	
	
	      if(recordarUs!=null){
			
			recordarUs.addEventListener("click", recordarCookie);
			inputCuidador.addEventListener("click", imprimirCookie);
			inputCliente.addEventListener("click", imprimirCookie);
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

		

		
	
	    	