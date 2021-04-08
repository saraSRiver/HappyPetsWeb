<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
<h2 class=>Historial del cliente</h2>
<form action= "<%=UrlBuilder.builderUrlForm(request, "/contrato") %>" method="post">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HISTORIAL_CLIENTE%>"/>
<div class="contenedorHistorial">
<div class="seccionesHistorial">
    <button>Contratos actuales</button>
    <button>Volver a contratar</button>
</div>

<div class="seccionesHistorial">
    <p><strong>Nombre</strong></p>
    <p><strong>Servicio</strong></p>
    <p><strong>Precio</strong></p>
    <p><a href="#">Detalles</a></p>
</div>
<div class="seccionesHistorial">
    <p>Fecha de contrato</p>
    <button>Cancelar contrato</button>
</div>
<div class="seccionesHistorial">
    <p><strong>Estado del contrato</strong></p>
</div>
   <%@include file="/html/common/footer.jsp"%>