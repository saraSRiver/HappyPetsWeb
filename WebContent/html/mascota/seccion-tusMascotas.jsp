<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cliente cl = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);

%>
    <h2>Tus mascotas</h2>
<h4>Marca cuál de ellas quieres que participe en la promoción de la Mascota del Mes</h4>
<div class="mascotas">
<div class="mascotas1">
<%for(Mascota mas: cl.getMascotas()){
				%>
    <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(mas.getIdMascota())+"-mascota.jpg")%>">
    <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.PERFIL_MASCOTA) %>"><%=mas.getNombre()%></a>
    	<%} %>
    <input type="radio" name="favorito">
</div>
<div class="mascotas1">
<%for(Mascota mas: cl.getMascotas()){
				%>
    <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(mas.getIdMascota())+"-mascota.jpg")%>">
     <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.PERFIL_MASCOTA) %>"><%=mas.getNombre()%></a>
    	<%} %>
    <input type="radio" name="favorito">
</div>
<div class="mascotas1">
<%for(Mascota mas: cl.getMascotas()){
				%>
    <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(mas.getIdMascota())+"-mascota.jpg")%>">
     <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.PERFIL_MASCOTA) %>"><%=mas.getNombre()%></a>
    	<%} %>
    <input type="radio" name="favorito">
</div>
</div>


   <%@include file="/html/common/footer.jsp"%>