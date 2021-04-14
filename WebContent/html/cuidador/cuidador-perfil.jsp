
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cuidador c = (Cuidador)SessionManager.get(request,AttributeNames.CUIDADOR);
%>
<h2><%=c.getNombre()%> <%= c.getApellidos()%></h2>
<div  class="cuidador">
<a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.CUIDADOR, ActionNames.HISTORIAL_CUIDADOR, ParameterNames.ID_CUIDADOR, String.valueOf(c.getIdcuidador())) %>">Tus contratos</a>
<div class="cuidador1">
    <p>Servicios</p>
   <%for (ServicioOfrecido so: c.getServiciosOfrecidos()){ %>
		<p><%=so.getNombreServicio()%></p>
		<p><%=so.getPrecio()%></p>
			
		<%} %>
		<h4>Experiencia:</h4>
<p><%=c.getExperiencia().getValor()%></p>
</div>

<div class="cuidador2">
<p>Datos personales</p>
<%=c.getDireccion().getCalle()%>, <%=c.getDireccion().getPortal()%>,
<%=c.getDireccion().getPiso()%>.<%=c.getDireccion().getNombrePoblacion()%>,
<%=c.getDireccion().getNombreProvincia()%></p>
<p>Teléfono: <%=c.getTelefono()%></p>
<p>Correo electrónico: <%=c.getEmail()%></p>
<p>Idiomas: <%for(Idioma i: c.getIdiomas()){ %>
		<%=i.getIdioma()%>
		<%} %></p> 

<div class="cuidador3">
    <p>Especies</p>
<%for(TipoEspecie e: c.getEspecies()){ %>
			<p><%=e.getNombre()%></p>
		<%} %>
</div>

</div>
<button>Editar perfil</button>

     <%@include file="/html/common/footer.jsp"%>