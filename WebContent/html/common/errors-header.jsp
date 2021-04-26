<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.web.utils.*"%>
<!--  Cabecera de errores -->
<%

	Errors errors = (Errors) request.getAttribute(AttributeNames.ERRORS);
	if (errors == null) {
		errors = new Errors();
	}
	
%>