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
<form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CONTRATOS) %>" method="post">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HISTORIAL_CLIENTE%>"/>

<div class="seccionesHistorial">
   <a  href="<%=ViewsNames.HIRE_AGAIN%>">Volver a contratar</a>
    <a  href="<%=ViewsNames.PUNTUACION_CUIDADOR%>">Cuidadores que has valorado</a>
</div>

<div class="seccionesHistorial">
<%for(ContratoDTO ct: contratos){%>
    <p><strong><%=ct.getNombreCuidador()%> <%=ct.getApellidosCuidador()%></strong></p>
    <p><strong><%=ct.getNombreServicio()%></strong></p>
    <p><strong><%=ct.getPrecioFinal()%></strong></p>
    <p><a href="#">Detalles</a></p>
</div>

<div class="seccionesHistorial">
    <p><%=ct.getFechaContrato()%></p>
    
</div>
<div class="seccionesHistorial">
    <p><strong><%=ct.getIdEstado()%></strong></p>
    <%if(ct.getIdEstado()!='R'){%>
     <button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.CONTRATO, ActionNames.ELIMINAR, ParameterNames.ID_CONTRATO, 
    		String.valueOf(ct.getIdContrato()))%>">Cancelar contrato</a></button>
    		<button><a href="<%=UrlBuilder.getUrlForController
	(request, ContextsPath.PRECREATE, ActionNames.CONTRATAR, ParameterNames.ID_CUIDADOR, 
    		String.valueOf(ct.getIdCuidador()))%>">Volver a  contratar</a></button>
</div>

  <%} %>
  <%} %>
 
  </form>
   <%@include file="/html/common/footer.jsp"%>