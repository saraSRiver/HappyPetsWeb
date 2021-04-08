<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    
    <%
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
    %>
<h2><%=cl.getNombre()%>  <%=cl.getApellidos()%></h2>
 <form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CLIENTE) %>"  method="post">
  <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.PERFIL_CLIENTE%>"/>
<div  class="cliente">
<div class="cliente1">
<a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.TUS_MASCOTAS) %>">Tus mascotas</a>
</div>
<div class="cliente2">
<p>Datos personales</p>
<p>Residencia: <%=cl.getDireccion().getCalle()%>, <%=cl.getDireccion().getPortal()%>,
<%=cl.getDireccion().getPiso()%>.<%=cl.getDireccion().getNombrePoblacion()%>,
<%=cl.getDireccion().getNombreProvincia()%></p>
<p>Teléfono: <%=cl.getTelefono()%></p>
<p>Correo electrónico: <%=cl.getEmail()%></p>
<p>Idiomas: <%for(Idioma i: cl.getIdiomas()){ %>
		<%=i.getIdioma()%>
		<%} %></p>
</div>   
</div>

<button>Editar perfil</button>

     <%@include file="/html/common/footer.jsp"%>