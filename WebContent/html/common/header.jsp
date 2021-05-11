<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.happypets.web.utils.*" %>
     
<!DOCTYPE html>
<html  style="background-image: url(<%=UrlBuilder.builderUrlImgCommon(request, "/fondoPatas.jpg")%>); position:relative;">
<head>
<meta charset="UTF-8">
<title>Happy Pets</title>
  <link rel= "stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/<%=request.getContextPath()%>/css/estilos.css">
<script defer src ="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/<%=request.getContextPath()%>/js/puntuacion.js"></script>
 <script src="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/<%=request.getContextPath()%>/js/jquery-3.6.0.js"></script>
<script defer src ="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/<%=request.getContextPath()%>/js/funcionalidades.js"></script>
</head>
	<%@include file="/html/common/errors-header.jsp"%>
<header>
  	<%Cliente cliente = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
  	Cuidador cuidador = (Cuidador)SessionManager.get(request, AttributeNames.CUIDADOR);
  	%>
    <img class="logo" src="<%=UrlBuilder.builderUrlImgCommon(request, "/LogoHappyPets.png")%>" width="87" height="100">
      <div class="ContenedorHeader">
     
      <nav class="nav1">
          <div class="secciones">
          <button class= "boton" type="button"><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX) %>">Página principal</a></button>
      </div>
          <div class="secciones">
          <button class= "boton"><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.PRECREATE, ActionNames.CUIDADOR_BUSCAR)%>">Buscar cuidadores</a></button>

          </div>
         <%if(cuidador==null){%>
      <div class="secciones">
          <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.PRECREATE + "?" + ActionNames.ACTION + "=" + ActionNames.REGISTRO_CUIDADOR)%>">Conviértete en cuidador</a></button>
        
      </div>
   		<%}%>
    
      </nav>
    
	<%if(cuidador == null&& cliente==null){%>
      <div class="nav2">
        <div class="secciones2">
        <button class= "boton" id="login"><a href="<%=UrlBuilder.builderUrlForm(request, "/html/usuario/usuario-login.jsp")%>">Acceder</a></button>
    </div>
    <%}%>
    <%if(cliente != null){%>
      <%@include file="/html/common/cliente/sesion.jsp"%>
      <%}if(cuidador !=null){%>
       <%@include file="/html/common/cuidador/sesion.jsp"%>
      <%}%>
    <%if(cliente == null){%>
    <div class="secciones2">
        <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.PRECREATE + "?" + ActionNames.ACTION + "=" + ActionNames.REGISTRO_CLIENTE)%>">Hazte cliente</a></button>
    </div>
    <%} %>
      </div>

    </div>
    
    <%@include file="/html/cuidador/cuidador-menu.jsp"%>
    </header>
    