<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.happypets.web.utils.*"%>
<%@include file="/html/common/header.jsp"%>

  <%
    List<ContratoDTO> contratos = (List<ContratoDTO>) request.getAttribute(AttributeNames.CONTRATOS);
  Contrato co=(Contrato)request.getAttribute(AttributeNames.CONTRATO);
%>
<h2 class=>Historial del cliente</h2>
<form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CONTRATOS) %>" method="post">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HISTORIAL_CUIDADOR%>"/>
<div class="contenedorHistorial">
<div class="seccionesHistorial">
</div>

<div class="seccionesHistorial">
<%
			for(ContratoDTO ct: contratos){
				%>
    <p><strong><%=ct.getNombreCliente()%> <%=ct.getApellidosCliente()%></strong></p>
     <p><strong><%=ct.getNombreMascota()%> (<%=ct.getNombreEspecie()%>)</strong></p>
    <p><strong><%=ct.getNombreServicio()%></strong></p>
     <p><strong><%=ct.getFechaInicio()%></strong></p>
      <p><strong><%=ct.getFechaFinal()%></strong></p>
    <p><strong><%=ct.getPrecioFinal()%></strong></p>
</div>

<div class="seccionesHistorial">
	<%if(!"P".equals(ct.getIdEstado())){%>
      <button>Aceptar contrato</button>
        <button>Rechazar contrato</button>
    
        <%} %>
</div>
</p>
<div class="seccionesHistorial">
    <p><strong><%=ct.getIdEstado()%></strong></p>
</div>
  <%} %>

<%@include file="/html/common/footer.jsp"%>