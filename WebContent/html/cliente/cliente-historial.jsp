<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
    List<ContratoDTO> contratos = (List<ContratoDTO>) request.getAttribute(AttributeNames.CONTRATOS);
    
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
%>
<h2 class=>Historial de contratos</h2>
<div id="contHistorial">
<form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CONTRATOS) %>" method="post" id="historial">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HISTORIAL_CLIENTE%>"/>



<%for(ContratoDTO ct: contratos){%>
	<div class="seccionesHistorial">
    <p><strong><%=ct.getNombreCuidador()%> <%=ct.getApellidosCuidador()%></strong></p>
    <p><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CONTRATO, ActionNames.DETAIL, ParameterNames.ID_CONTRATO, 
    		String.valueOf(ct.getIdContrato()))%>">Detalles</a></p>
	</div>
<div id="contenedor">
<div class="seccionesHistorial2">
   <p><strong><%=ct.getNombreServicio()%></strong></p>
    <p><strong><%=ct.getPrecioFinal()%></strong></p>
    <p><%=ct.getFechaContrato()%></p>
     <p><strong><%if(ct.getIdEstado()=='A'){%>Aceptado<%}else if(ct.getIdEstado() == 'P'){%>Pendiente<%}else{%>Rechazado<%}%></strong></p>
     <a  href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.PUNTUACION, ActionNames.CUIDADORES_PUNTUADOS, ParameterNames.ID_CUIDADOR, 
    		String.valueOf(ct.getIdCuidador()))%>">Puntuar cuidador</a>
</div>
<div class="seccionesHistorial3">
   
    <%if(ct.getIdEstado()!='R'){%>
     <button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CONTRATO, ActionNames.ELIMINAR, ParameterNames.ID_CONTRATO, 
    		String.valueOf(ct.getIdContrato()))%>">Cancelar contrato</a></button>
    		<button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.PRECREATE, ActionNames.CONTRATAR, ParameterNames.ID_CUIDADOR, 
    		String.valueOf(ct.getIdCuidador()))%>">Volver a  contratar</a></button>
<%} %>
</div>

</div>
  

  <%} %>
  </form>
 </div>
 
   <%@include file="/html/common/footer.jsp"%>