<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.jal.prueba.utils.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Happy Pets</title>

	
  <link rel= "stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/<%=request.getContextPath()%>/css/estilos.css">
</head>
<header>
  
    <img class="logo" src="<%=UrlBuilder.builderUrlImgCommon(request, "/LogoHappyPets.png")%>" width="87" height="100">
      <div class="ContenedorHeader">
     
      <nav class="nav1">
          <div class="secciones">
          <button class= "boton" type="button"><a href="<%=UrlBuilder.builderUrlForm(request, "/html/index.jsp") %>">Página principal</a></button>
      </div>
          <div class="secciones">
          <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request, "/html/cuidador/search.jsp")%>">Buscar cuidadores</a></button>

          </div>
      <div class="secciones">
          <button class= "boton"><a href=#>Conviértete en cuidador</a></button>
        
      </div>
    
      </nav>

      <div class="nav2">
        <div class="secciones2">
        <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request, "/html/usuario/login.jsp")%>">Acceder</a></button>
    </div>
    <div class="secciones2">
        <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request,"/html/cliente/registro-cliente.jsp")%>">Hazte cliente</a></button>
    </div>
      </div>

    </div>
    
    <%@include file="/html/cuidador/cuidador-menu.jsp"%>
    </header>
    