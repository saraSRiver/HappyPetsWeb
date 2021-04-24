<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="com.happypets.web.utils.*"%>

<%@include file="/html/common/header.jsp"%>

<h2>Eres cuidador o cliente?</h2>

<%@include file="/html/common/errors-header.jsp"%>

<form action= "<%=UrlBuilder.builderUrlForm(request, "/usuario") %>" method="post">
    <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.LOGIN%>"/>  
	<input type="radio"  name="tipoUsuario" value="cuidador">Cuidador<br>
    <input type="radio"  name="tipoUsuario" value="cliente">Cliente<br>
	<%
		String emailError = errors.getError(ParameterNames.EMAIL);
		if (emailError!=null) { 
			%><%=emailError%>
			<%}%>
	<input type="text" name="email">
	
		<%
		String passwordError = errors.getError(ParameterNames.PASSWORD);
		if (passwordError!=null) { 
			%><%=passwordError%>
			<%}%>
	<input type="text" name="password">
            <input class="buscar" type="submit" value="Listo">
<%@include file="/html/common/footer.jsp"%>