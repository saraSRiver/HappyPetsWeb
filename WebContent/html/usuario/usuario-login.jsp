<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="com.happypets.web.utils.*"%>

<%@include file="/html/common/header.jsp"%>

<h2>¿Eres cuidador o cliente?</h2>
<form action= "<%=UrlBuilder.builderUrlForm(request, "/usuario") %>" method="post" id="formLogin">
    <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.LOGIN%>"/>  
	<input type="radio"  name="tipoUsuario" value="cuidador">Cuidador<br>
    <input type="radio"  name="tipoUsuario" value="cliente">Cliente<br>
	<%
		String emailError = errors.getError(ParameterNames.EMAIL);
		if (emailError!=null) { 
			%>
			<p><%=emailError%>
			<%}%>
			</p>
	<input type="text" name="email">
	
		<%
		String passwordError = errors.getError(ParameterNames.PASSWORD);
		if (passwordError!=null) { 
			%>
			<p><%=passwordError%>
			<%}%>
			</p>
	<input type="text" name="password">
	 <input type="radio" name="" value="1">Recordar usuario<br>
	
            <button class="buscar" type="button">Iniciar sesión</button>
<%@include file="/html/common/footer.jsp"%>