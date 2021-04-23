<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
<%@ page import="java.util.List" %>
    <%@ page import="com.happypets.web.utils.*" %>
      <%@include file="/html/common/header.jsp"%>
<%
List<Cuidador>cuidadores = (List<Cuidador>) request.getAttribute(AttributeNames.CUIDADOR);
%>
<p>Resultados de tu b�squeda:<%=cuidadores.size()%></p>
	<%
	
	for(Cuidador c: cuidadores){
		%>
		<a href="<%=UrlBuilder.builderUrlForm(request,"/cuidador?action=detail&" + ParameterNames.ID_CUIDADOR + "=")%>
		<%=c.getIdcuidador()%>"><%=c.getNombre()%></a>
		<p><%=c.getApellidos()%></p>
		<h4>Idiomas:</h4>
		<%for(Idioma i: c.getIdiomas()){ %>
		<p><%=i.getIdioma()%></p>
		<%} %>
	
		<h4>Experiencia:</h4>
	
		<p><%=c.getExperiencia().getValor()%></p>
		
		<h4>Especies:</h4>
		<%for(TipoEspecie e: c.getEspecies()){ %>
			<p><%=e.getNombre()%></p>
		<%} %>
		<h4>Servicios:</h4>
		<%for (ServicioOfrecido so: c.getServiciosOfrecidos()){ %>
		<p><%=so.getNombreServicio()%></p>
		<p><%=so.getPrecio()%></p>
			
		<%} %>
		<h4>Tel�fono:</h4>
			<p><%=c.getTelefono()%></p>
			<h4>Poblaci�n</h4>
			<p><%=c.getDireccion().getNombrePoblacion()%></p>
			<h4>Provincia:</h4>
			<p><%=c.getDireccion().getNombreProvincia()%></p>
			<h4>Puntuaci�n media:</h4>
			<span><%=c.getPuntuacionMedia()%></span>
			
	<%
	}
%>
   <%@include file="/html/common/footer.jsp"%>