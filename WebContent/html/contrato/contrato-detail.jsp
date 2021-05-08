<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
     <%
     Cuidador c = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
	Contrato co=(Contrato) request.getAttribute(AttributeNames.CONTRATO);
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
%>

    <h2 class=>Detalles</h2>

<div id="titulosHistorial">
<p>Dirección</p>
<p>Mascota</p>
<p>Especie</p>
<p>Servicio</p>
<p>Duración</p>
<p>Precio</p>
</div>

<div class="seccionesDetail">
  <p><strong><%=cl.getDireccion().getCalle()%>, <%=cl.getDireccion().getPortal()%>,
    		<%=cl.getDireccion().getPiso()%>.<%=cl.getDireccion().getNombrePoblacion()%>,
    		<%=cl.getDireccion().getNombreProvincia()%>.</strong></p>
    <p id="nMas"><strong><%=co.getNombreMascota()%></strong></p>
     <p id="nEs"><strong><%=co.getNombreEspecie()%></strong></p>
      <p id="nSe"><strong><%=co.getNombreServicio()%></strong></p>
    <p id="fechaDuracion"><strong><%=co.getFechaInicio()%> hasta <%=co.getFechaFinal()%></strong></p>
    <p id="pr"><strong><%=co.getPrecioFinal()%></strong></p>
</div>
	<p id="contador"></p>

       <%@include file="/html/common/footer.jsp"%>