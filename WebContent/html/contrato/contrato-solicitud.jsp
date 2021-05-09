
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.happypets.web.utils.*"%>
<%@include file="/html/common/header.jsp"%>

<%
Cuidador c = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
Contrato contrato = (Contrato) request.getAttribute(AttributeNames.CONTRATOS);
%>

<h2>Has solicitado los servicios de <%=c.getNombre()%> <%= c.getApellidos()%></h2>
<form action= "<%=UrlBuilder.builderUrlForm(request, ContextsPath.CONTRATO)%>" method="post">
    <input type="hidden" name="<%=ParameterNames.ID_CUIDADOR%>" value="<%=c.getIdcuidador()%>">
   <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.CONTRATAR%>"/>
<section>
	<div class="solicitud">

	<p>Nombre de la mascota:<br> <select name="<%=ParameterNames.ID_MASCOTA%>">
	
			<option value="0">--seleciona mascota</option>
								<%
			for(Mascota m: cliente.getMascotas()){
				%>
					<option value="<%=m.getIdMascota()%>"><%=m.getNombre()%></option>
							<%} %>
				</select></p>

			 <p>¿Qué servicios te interesan?<br>
            
           	<% for(ServicioOfrecido s: c.getServiciosOfrecidos()){%>
            <p>Precio:</p>
            <label><%=ParameterNames.PRECIO_SERVICIO %></label><br>
            <p><%=s.getPrecio()%></p>
            <input type="radio" name="<%=ParameterNames.SERVICIOS %>" value="<%=s.getIdServicio()%>"><%=s.getNombreServicio()%><br>
            <%}%> </p>
			<p>Fecha de comienzo del contrato:<br> <input type="text" placeholder="00-00-0000"
					name="<%=ParameterNames.FECHA_INICIO %>"></p>
			<p>Fecha del fin del contrato:<br> <input type="text" placeholder="00-00-0000"
					name="<%=ParameterNames.FECHA_FIN %>"></p>
			<%if(cliente.getPromocion() != null){ %>
			<input type="checkbox" name="<%=ParameterNames.PROMOCION %>">Tienes una promoción
			en este servicio, ¿deseas aplicarla?<br>
			
			<%}%>
			<p><%if(contrato !=null){%>
				Precio<br>
			<p><%=contrato.getPrecioFinal()%></p>
			<%}%>

			</p>
	</div>

</section>
<input class="borrar" type="reset" value="Borrar datos">
<input class="listo" type="submit" value="Listo">

</form>

<%@include file="/html/common/footer.jsp"%>