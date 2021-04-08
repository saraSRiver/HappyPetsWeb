<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cuidador c = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
%>
<h2><%=c.getNombre()%> <%= c.getApellidos()%></h2>
<div  class="cuidador">
<div class="cuidador1">
    <p>Servicios</p>
    <p>Paseos (9€)</p>
    <p>Visitas a domicilio (13€)</p>
    <p>Cuidados a domicilio (16€)</p>
</div>

<div class="cuidador2">
<p>Datos personales</p>
<p>Residencia:<%= c.getDireccion()%></p>
<p>Teléfono: <%= c.getTelefono()%></p>
<p>Correo electrónico: <%= c.getEmail()%></p>
<p>Idiomas: <%for(Idioma i: c.getIdiomas()){ %>
		<%=i.getIdioma()%>
		<%} %></p>
</div>  

<div class="cuidador3">
    <p>Especies</p>
<p>Perros</p>
<p>Gatos</p>
</div>

</div>
<button>Editar perfil</button>

     <%@include file="/html/common/footer.jsp"%>