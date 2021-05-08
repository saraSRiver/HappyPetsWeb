
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cuidador c = (Cuidador)SessionManager.get(request,AttributeNames.CUIDADOR);
%>
<h2><%=c.getNombre()%> <%= c.getApellidos()%></h2>
<div class= "perfil2">
<div  class="cuidador">

<p class="datos">Datos personales</p>
<%=c.getDireccion().getCalle()%>, <%=c.getDireccion().getPortal()%>,
<%=c.getDireccion().getPiso()%>.<%=c.getDireccion().getNombrePoblacion()%>,
<%=c.getDireccion().getNombreProvincia()%></p>
<p>Teléfono: <%=c.getTelefono()%></p>
<p>Correo electrónico: <%=c.getEmail()%></p>
<p>Idiomas: <%for(Idioma i: c.getIdiomas()){ %>
		<%=i.getIdioma()%>
		<%} %></p> 
</div>

<div id="datos">
    <p class="datos">Servicios</p>
   <%for (ServicioOfrecido so: c.getServiciosOfrecidos()){ %>
		<p><%=so.getNombreServicio()%>, <%=so.getPrecio()%> euros</p>
		

		<%} %>
		<p class="datos">Experiencia:</p>
<p><%=c.getExperiencia().getValor()%></p>
    <p class="datos">Especies</p>
<%for(TipoEspecie e: c.getEspecies()){ %>
			<p><%=e.getNombre()%></p>
		<%} %>
		
</div>


 </div> 
 <div id="editar">
	<button type="button" value="Eliminar"> <a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CUIDADOR, ActionNames.ELIMINAR, ParameterNames.ID_CUIDADOR, 
    		String.valueOf(c.getIdcuidador()))%>">Darse de baja de Happy Pets</a></button>
   <button type="button"><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.CUIDADOR, ActionNames.HISTORIAL_CUIDADOR, ParameterNames.ID_CUIDADOR, String.valueOf(c.getIdcuidador())) %>">Tus contratos</a></button>
</div>
     <%@include file="/html/common/footer.jsp"%>