
<%@ page import="com.happypets.web.utils.*"%>
<!--  Cabecera de errores -->
<%

	Errors errors = (Errors) request.getAttribute(AttributeNames.ERRORS);
	if (errors == null) {
		errors = new Errors();
	}
	
%>