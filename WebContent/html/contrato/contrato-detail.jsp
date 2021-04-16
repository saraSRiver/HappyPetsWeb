<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
     <%
    List<ContratoDTO> contratos = (List<ContratoDTO>) request.getAttribute(AttributeNames.CONTRATOS);
	Contrato co=(Contrato) request.getAttribute(AttributeNames.CONTRATOS);
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
%>
    <h2 class=>Detalles</h2>
<p><%=co.getFechaContrato()%></p>
<div class="contenedorHistorial">
<div class="seccionesHistorial">
    <p><strong>Dirección</strong></p>
    <p><strong>Mascota</strong></p>
    <p><strong>Duración del servicio</strong></p>
    <p><strong>Resumen</strong></p>
</div>
<p> <%=cl.getDireccion().getCalle()%>, <%=cl.getDireccion().getPortal()%>,
<%=cl.getDireccion().getPiso()%>.<%=cl.getDireccion().getNombrePoblacion()%>.</p>
<p></p>
</div>
       <%@include file="/html/common/footer.jsp"%>