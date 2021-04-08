<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
List<Contrato> contratos = (List<Contrato>) request.getAttribute(AttributeNames.CONTRATOS);
%>
<h2 class=>Historial del cliente</h2>
<form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CONTRATOS) %>" method="post">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HISTORIAL_CLIENTE%>"/>
<div class="contenedorHistorial">
<div class="seccionesHistorial">
    <button>Contratos actuales</button>
    <button>Volver a contratar</button>
</div>

<div class="seccionesHistorial">
<%
			for(Contrato ct: contratos){
				%>
    <p><strong><%=ct.getIdCuidador()%></strong></p>
    <p><strong><%=ct.getIdServicio()%></strong></p>
    <p><strong><%=ct.getPrecioFinal()%></strong></p>
    <p><a href="#">Detalles</a></p>
   
  
</div>

<div class="seccionesHistorial">
    <p><%=ct.getFechaContrato()%></p>
    <button>Cancelar contrato</button>
</div>
<div class="seccionesHistorial">
    <p><strong><%=ct.getIdEstado()%></strong></p>
</div>
  <%} %>
   <%@include file="/html/common/footer.jsp"%>