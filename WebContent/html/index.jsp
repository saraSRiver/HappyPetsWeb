<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Happy Pets</title>
<link rel= "stylesheet" href="http://localhost:8080/HelloWorld1/css/estilos.css">
</head>
<body>
 <header>
  <img class="logo" src="http://localhost:8080/HelloWorld1/img/LogoHappyPets.png" width="80" height="100">
      <div class="ContenedorHeader">
     
      <nav class="nav1">
          <div class="secciones">
          <button class= "boton"><a href=http://localhost:8080/HelloWorld1/html/index.jsp>Página principal</a></button>
      </div>
          <div class="secciones">
          <button class= "boton"><a href=http://localhost:8080/HelloWorld1/html/cuidador/search.jsp>Buscar cuidadores</a></button>

          </div>

      <div class="secciones">
          <button class= "boton"><a href=http://localhost:8080/HelloWorld1/html/cuidador/search.jsp>Conviértete en cuidador</a></button>
        
    
      </div>
    
      </nav>

      <div class="nav2">
        <div class="secciones2">
        <button class= "boton"><a href=http://localhost:8080/HelloWorld1/html/cuidador/login.jsp>Acceder</a></button>
    </div>
    <div class="secciones2">
        <button class= "boton"><a href=registro_cliente.html>Registrarse</a></button>
    </div>
      </div>

    </div>
    </header>
  
          <div class="MascotaMes">
            <h2>Mascota del mes</h2>
                <%
	Mascota m = (Mascota) request.getAttribute("mascota");
%>
             <form action=http://localhost:8080/HelloWorld1/mascotaMesIndex?action=index&mascota=<%=m.getIdMascota()%> method="post">
              <input type=hidden name="<%=ParameterNames.ACTION2%>" value="index"/>
      <figure>
        
        <div class="ContenedorIMG">
      
          
      <img src="http://localhost:8080/HelloWorld1/img/mascotas/favoritas/<%=m.getIdMascota()%>-<%=m.getNombre()%>.jpg" alt="Mascota del mes" class="MASCMES" style="width:100%">
      <div class="middle">
        <div class="text"><%=m.getNombre()%></div>
      </div>
    </div>
      <figcaption>Marzo 2021</figcaption>
    </figure>
</div>

<h2>Nuestros servicios</h2>
<div class="servicios">

<figure>
  <img src="http://localhost:8080/HelloWorld1/img/dog.svg" alt="paseos" width="120" height="140">
  <figcaption>Paseos</figcaption>
</figure>
<figure>
  <img src="http://localhost:8080/HelloWorld1/img/visitas.svg" alt="visitas a domicilio" width="120" height="140">
  <figcaption>Visitas a domicilio</figcaption>
</figure>

<figure>
  <img src="http://localhost:8080/HelloWorld1/img/cuidados.svg" alt="cuidados a domicilio" width="120" height="140">
  <figcaption>Cuidados a domicilio</figcaption>
</figure>

<figure>
  <img src="http://localhost:8080/HelloWorld1/img/guarderia.svg" alt="guardería de día" width="120" height="140">
  <figcaption>Guardería de día</figcaption>
</figure>
<figure>
  <img src="http://localhost:8080/HelloWorld1/img/animal-shelter.svg" alt="alojamiento" width="120" height="140">
  <figcaption>Alojamiento</figcaption>
</figure>

</div>

<footer role="contentinfo">
  <div class="contactos">
    <div class="ContenedorFooter">
      <h2><strong>Síguenos en las redes</strong></h2>
      <figure>
        <div class="redes"><img src="facebook.svg" alt="Facebook"></div>
        <div  class="redes"><img src="instagram.svg" alt="Instagram" ></div>
        <div  class="redes"><img src="twitter.png" alt="Twitter"></div>
       </figure> 
    </div>
  <div>
    <div>
  <h2>Contacta con nosotros</h2>
<p><br><strong>Nuestro email</strong><br></p>    
<p>HappyPetsApp@gmail.com</p>  
<p><br><strong>Teléfono de Atención al Cliente</strong><br></p>  
<p>695509988</p>  
</div>
  
  <div>
  <figure>
    <img src="http://localhost:8080/HelloWorld1/img/contacto.svg" alt="contactos" >
  </figure>
  
</div>

</footer>
</body>
</html>