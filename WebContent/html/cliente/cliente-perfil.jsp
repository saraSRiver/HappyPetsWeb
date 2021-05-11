<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    
    <%
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
    %>
<h2><%=cl.getNombre()%>  <%=cl.getApellidos()%></h2>
<div  class="cliente">
 <form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CLIENTE) %>"  method="post">
  <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.PERFIL_CLIENTE%>"/>

<p class="datos">Datos personales</p>
<p>Residencia: <%=cl.getDireccion().getCalle()%>, <%=cl.getDireccion().getPortal()%>,
<%=cl.getDireccion().getPiso()%>.<%=cl.getDireccion().getNombrePoblacion()%>,
<%=cl.getDireccion().getNombreProvincia()%></p>
<p>Teléfono: <%=cl.getTelefono()%></p>
<p>Correo electrónico: <%=cl.getEmail()%></p>
<p>Idiomas: <%for(Idioma i: cl.getIdiomas()){ %>
		<%=i.getIdioma()%>
		<%} %></p>
  

<div id="editar">
  <button type="button" value="Editar perfil" id="editar"> 
    <a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.PRECREATE,
    		ActionNames.EDIT_PERFIL_CLIENTE)%>">Editar perfil</a></button>
    	<%if(cliente.getMascotas().size() < 3){%>
	<button id="editar" type="button"><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.PRECREATE, ActionNames.ADD_MASCOTA)%>">Añadir mascota</a></button>
<%}%>
    		<button type="button" value="Eliminar" id="editar"><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CLIENTE, ActionNames.ELIMINAR, ParameterNames.ID_CLIENTE, 
    		String.valueOf(cl.getIdcliente()))%>"> Darse de baja de Happy Pets</a></button>
    		
    </div>
	
 </form>
 </div> 
 <div class="contenedorImg">
 <%for(Mascota mas: cl.getMascotas()){
				%>
 <figure style="background-image:url(<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(mas.getIdMascota())+"-mascota.jpg")%>); background-repeat:no-repeat; background-size: cover; position:relative; background-position:bottom;"> 
 <figcaption><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA, ActionNames.DETAIL, ParameterNames.ID_MASCOTA, String.valueOf(mas.getIdMascota()))%>"><%=mas.getNombre()%></a></figcaption>
 </figure>
 <%}%>

 </div>
     <%@include file="/html/common/footer.jsp"%>