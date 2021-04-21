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
<form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CONTRATOS) %>" method="post">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HISTORIAL_CUIDADOR%>"/>


<div class="seccionesHistorial">
<%
			for(ContratoDTO ct: contratos){
				%>
    <p><strong><%=ct.getNombreCliente()%> <%=ct.getApellidosCliente()%></strong></p><br>
     <p><strong><%=ct.getNombreMascota()%> (<%=ct.getNombreEspecie()%>)</strong></p><br>
    <p><strong><%=ct.getNombreServicio()%></strong></p><br>
     <p><strong><%=ct.getFechaInicio()%></strong></p><br>
      <p><strong><%=ct.getFechaFinal()%></strong></p><br>
    <p><strong><%=ct.getPrecioFinal()%></strong></p>
</div>
<div class="seccionesHistorial">
    <p><strong><%=ct.getIdEstado()%></strong></p>
</div>
<div class="seccionesHistorial">
	<%if(ct.getIdEstado()=='P'){%>
      <button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CONTRATO, ActionNames.ACEPTAR, ParameterNames.ID_CONTRATO, 
    		String.valueOf(ct.getIdContrato()))%>">Aceptar contrato</a></button>
        <button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CONTRATO, ActionNames.ELIMINAR, ParameterNames.ID_CONTRATO, 
    		String.valueOf(ct.getIdContrato()))%>">Rechazar contrato</a></button>
    </div>
</p>
        <%} %>
  <%} %>
</form>
<%@include file="/html/common/footer.jsp"%>