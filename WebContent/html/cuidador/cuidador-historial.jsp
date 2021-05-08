<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.happypets.web.utils.*"%>
<%@include file="/html/common/header.jsp"%>

  <%
    List<ContratoDTO> contratos = (List<ContratoDTO>) request.getAttribute(AttributeNames.CONTRATOS);
 
%>
<h2 class=>Historial del cuidador</h2>
<div id="contHistorial">
<form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CONTRATOS) %>" method="post">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HISTORIAL_CUIDADOR%>"/>

<div id="titulosHistorial">
<p>Cliente</p>
<p>Mascota</p>
<p>Servicio</p>
<p>Duración</p>
<p>Precio</p>
<p>Estado</p>
</div>


<%
			for(ContratoDTO ct: contratos){
				%>
				<div class="seccionesDetail">
    <p><strong><%=ct.getNombreCliente()%> <%=ct.getApellidosCliente()%></strong></p>
    
     <p><strong><%=ct.getNombreMascota()%> (<%=ct.getNombreEspecie()%>)</strong></p>
    <p><strong><%=ct.getNombreServicio()%></strong></p><br>
     <p><strong><%=ct.getFechaInicio()%> hasta <%=ct.getFechaFinal()%></strong></p>
 
    <p><strong><%=ct.getPrecioFinal()%></strong></p>
    <p><strong><%if(ct.getIdEstado()=='A'){%>Aceptado<%}else if(ct.getIdEstado() == 'P'){%>Pendiente<%}else{%>Rechazado<%}%></strong></p>
</div>


	<%if(ct.getIdEstado()=='P'){%>
	<div class="seccionesHistorial">
      <button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CONTRATO, ActionNames.ACEPTAR, ParameterNames.ID_CONTRATO, 
    		String.valueOf(ct.getIdContrato()))%>">Aceptar contrato</a></button>
        <button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CONTRATO, ActionNames.ELIMINAR, ParameterNames.ID_CONTRATO, 
    		String.valueOf(ct.getIdContrato()))%>">Rechazar contrato</a></button>
        <%} %>
  <%} %>
    </div>
</form>
 </div>
<%@include file="/html/common/footer.jsp"%>