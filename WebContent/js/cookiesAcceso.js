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

       //variables relacionadas con el HTML
       let recordarCook= getCookie("usuarioMail");
		let formLogin = document.getElementById("formLogin");
		let inputCuidador = document.querySelectorAll("input")[1];
			let inputCliente = document.querySelectorAll("input")[2];
       let mail = document.querySelectorAll("input")[3];
       let pass = document.querySelectorAll("input")[4];
       let recordarUsuario = document.querySelector("input")[5];
       let recordarUs = document.querySelector("#formLogin button");
     
      let accessCook=document.getElementById("login");

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
	if(recordarUs!=null){
		
		recordarUs.addEventListener("click", recordarCookie);
		inputCuidador.addEventListener("click", imprimirCookie);
		inputCliente.addEventListener("click", imprimirCookie);
	}
    	
  