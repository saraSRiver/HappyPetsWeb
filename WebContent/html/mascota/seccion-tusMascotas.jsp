<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cliente cl = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
List<Mascota>mascotas= (List<Mascota>)request.getAttribute( AttributeNames.MASCOTA);
%>
    <h2>Tus mascotas</h2>
<h4>Marca cu�l de ellas quieres que participe en la promoci�n de la Mascota del Mes</h4>
<div class="mascotas">
<div class="mascotas1">
<%for(Mascota mas: cl.getMascotas()){
				%>
    <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(mas.getIdMascota())+"-mascota.jpg")%>">
    <a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA, ActionNames.DETAIL, ParameterNames.ID_MASCOTA, String.valueOf(mas.getIdMascota()))%>"><%=mas.getNombre()%></a>
    
    <input type="radio" name="favorito">
    
 
     
</div>
	<%} %>
<%if(cliente.getMascotas().size() < 3){%>
	<button>a�adir mascota</button>
<%}%>


   <%@include file="/html/common/footer.jsp"%>