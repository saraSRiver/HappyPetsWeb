<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
<%@ page import="java.util.List" %>
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
          <button class= "boton"><a href=RegistroCuidador.html>Conviértete en cuidador</a></button>
        
      </div>
    
      </nav>

      <div class="nav2">
        <div class="secciones2">
        <button class= "boton"><a href=acceso.html>Acceder</a></button>
    </div>
    <div class="secciones2">
        <button class= "boton"><a href=registro_cliente.html>Registrarse</a></button>
    </div>
      </div>

    </div>
    </header>
<%
List<Cuidador>cuidadores = (List<Cuidador>) request.getAttribute(ViewsNames.RESULTS);
%>
<p>Resultados de tu búsqueda:<%=cuidadores.size()%></p>
	<%
	
	for(Cuidador c: cuidadores){
		%>
		<a href="http://localhost:8080/HelloWorld1/busquedaCuidador?action=detail&id=
		<%=c.getIdcuidador()%>"><%=c.getNombre()%></a>
		<p><%=c.getApellidos()%></p>
		<h4>Idiomas:</h4>
		<%for(Idioma i: c.getIdiomas()){ %>
		<p><%=i.getIdioma()%></p>
		<%} %>
	
		<h4>Experiencia:</h4>
	
		<p><%=c.getExperiencia().getValor()%></p>
		
		<h4>Especies:</h4>
		<%for(TipoEspecie e: c.getEspecies()){ %>
			<p><%=e.getNombre()%></p>
		<%} %>
		<h4>Servicios:</h4>
		<%for (ServicioOfrecido so: c.getServiciosOfrecidos()){ %>
		<p><%=so.getNombreServicio()%></p>
		<p><%=so.getPrecio()%></p>
			
		<%} %>
		<h4>Teléfono:</h4>
			<p><%=c.getTelefono()%></p>
			<h4>Población</h4>
			<p><%=c.getDireccion().getNombrePoblacion()%></p>
			<h4>Provincia:</h4>
			<p><%=c.getDireccion().getNombreProvincia()%></p>
			<h4>Puntuación media:</h4>
			<p><%=c.getPuntuacionMedia()%></p>
			
	<%
	}
%>
</body>
</html>