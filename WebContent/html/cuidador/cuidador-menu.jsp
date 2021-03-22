
<%@ page import="com.jal.prueba.utils.*"%>
<%@ page import="com.happypets.aplicacion.model.*"%>

<%
	Cuidador user= (Cuidador) SessionManager.get(request, "usuario");
	if(user==null){
		%>
		<a href="<%=UrlBuilder.builderUrlForm(request, "/html/cuidador/login.jsp")%>"></a>
	
	<%
	}
	else{
		
		%>
		<p><%=user.getNombre()%></p>
	<%
	}
	%>
