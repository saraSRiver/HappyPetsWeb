<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
   <%@include file="/html/common/header.jsp"%>

<%
	Cuidador c = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
%>

<img src="<%=UrlBuilder.builderUrlImg(request, "cuidadores/" + String.valueOf(c.getIdcuidador()))+ "-detail.jpg"%>"/>
<h2><%=c.getNombre()%> <%=c.getApellidos()%></h2>
<h4>Especies:</h4>
<%for(TipoEspecie e: c.getEspecies()){ %>
			<p><%=e.getNombre()%></p>
		<%} %>
		
<h4>Experiencia:</h4>
<p><%=c.getExperiencia().getValor()%></p>
<h4>Servicios:</h4>
<%for (ServicioOfrecido so: c.getServiciosOfrecidos()){ %>
		<p><%=so.getNombreServicio()%></p>
		<p><%=so.getPrecio()%></p>
			
		<%} %>
<h4>Idiomas:</h4>
<%for(Idioma i: c.getIdiomas()){ %>
		<p><%=i.getIdioma()%></p>
		<%} %>
<h4>Dirección:</h4>
<p><%=c.getDireccion().getNombrePoblacion()%></p>
<h5>Calle:</h5>
<p><%=c.getDireccion().getCalle()%></p>
<h5>Portal:</h5>
<p><%=c.getDireccion().getPortal()%></p>
<h5>Piso:</h5>
<p><%=c.getDireccion().getPiso()%></p>
   <input class="buscar" type="submit" value="Contratar">
  <%@include file="/html/common/footer.jsp"%>