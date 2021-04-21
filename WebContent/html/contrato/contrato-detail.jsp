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
<p><%=co.getFechaContrato()%></p>
<div class="contenedorHistorial">
<div class="seccionesHistorial">
  <p><strong><%=cl.getDireccion().getCalle()%>, <%=cl.getDireccion().getPortal()%>,
    		<%=cl.getDireccion().getPiso()%>.<%=cl.getDireccion().getNombrePoblacion()%>,
    		<%=cl.getDireccion().getNombreProvincia()%>.</strong></p>
    <p><strong><%=co.getNombreMascota()%></strong></p>
     <p><strong><%=co.getNombreEspecie()%></strong></p>
      <p><strong><%=co.getNombreServicio()%></strong></p>
    <p><strong><%=co.getFechaInicio()%> hasta <%=co.getFechaFinal()%></strong></p>
    <p><strong><%=co.getPrecioFinal()%></strong></p>
</div>

</div>
       <%@include file="/html/common/footer.jsp"%>