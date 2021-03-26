<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
    Cliente cl= (Cliente)request.getAttribute(AttributeNames.CLIENTE);
    %>
<h2><%=cl.getNombre()%>  <%=cl.getApellidos()%></h2>
<div  class="cliente">
<div class="cliente1">
<a href="<%=UrlBuilder.builderUrlForm(request, "/html/seccion-tusMascotas.jsp") %>">Tus mascotas<a>
</div>
<div class="cliente2">
<p>Datos personales</p>
<p>Residencia: <%=cl.getDireccion()%></p>
<p>Teléfono: <%=cl.getTelefono()%></p>
<p>Correo electrónico: <%=cl.getEmail()%></p>
<p>Idiomas: <%for(Idioma i: cl.getIdiomas()){ %>
		<%=i.getIdioma()%>
		<%} %></p>
</div>   
</div>
<button>Editar perfil</button>
    
    
    
     <%@include file="/html/common/footer.jsp"%>