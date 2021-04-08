<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
        <%@ page import="com.happypets.web.utils.*" %>
     
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Happy Pets</title>

	
  <link rel= "stylesheet" href="http://<%=request.getServerName()%>:<%=request.getServerPort()%>/<%=request.getContextPath()%>/css/estilos.css">
</head>
<header>
  	<%Cliente cliente = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
  	Cuidador cuidador = (Cuidador)SessionManager.get(request, AttributeNames.CUIDADOR);
  	%>
    <img class="logo" src="<%=UrlBuilder.builderUrlImgCommon(request, "/LogoHappyPets.png")%>" width="87" height="100">
      <div class="ContenedorHeader">
     
      <nav class="nav1">
          <div class="secciones">
          <button class= "boton" type="button"><a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.INDEX) %>">Página principal</a></button>
      </div>
          <div class="secciones">
          <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.BUSQUEDA_CUIDADORES)%>">Buscar cuidadores</a></button>

          </div>
         <%if(cuidador==null){%>
      <div class="secciones">
          <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.PRECREATE + "?" + ActionNames.ACTION + "=" + ActionNames.REGISTRO_CUIDADOR)%>">Conviértete en cuidador</a></button>
        
      </div>
   		<%}%>
    
      </nav>
      <%if(cliente != null){%>
      <%@include file="/html/common/cliente/sesion.jsp"%>
      <%}if(cuidador !=null){%>
       <%@include file="/html/common/cuidador/sesion.jsp"%>
      <%}%>
	<%if(cuidador == null&& cliente==null){%>
      <div class="nav2">
        <div class="secciones2">
        <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request, "/html/usuario/usuario-login.jsp")%>">Acceder</a></button>
    </div>
    <%}%>
  
    <%if(cliente == null){%>
    <div class="secciones2">
        <button class= "boton"><a href="<%=UrlBuilder.builderUrlForm(request,"/html/cliente/registro-cliente.jsp")%>">Hazte cliente</a></button>
    </div>
    <%} %>
      </div>

    </div>
    
    <%@include file="/html/cuidador/cuidador-menu.jsp"%>
    </header>
    