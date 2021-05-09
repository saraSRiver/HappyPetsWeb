
<%@ page import="com.happypets.aplicacion.model.*, java.util.*"%>
<%@ page import="com.happypets.web.utils.*"%>
<%@include file="/html/common/header.jsp"%>
<%
Cuidador cd = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
Cliente cl = (Cliente) SessionManager.get(request, AttributeNames.CLIENTE);
Puntuacion pt = (Puntuacion) request.getAttribute(AttributeNames.PUNTUACION);
%>
<h2 class=>Valoración del cuidador</h2>
<form
	action="<%=UrlBuilder.builderUrlForm(request, ContextsPath.PUNTUACION)%>"
	method="post" id="puntuacion">

	<input type=hidden name="<%=ActionNames.ACTION%>" <%if (pt == null) {%>
		value="<%=ActionNames.PUNTUAR_CUIDADOR%>"> <%} else {%>
		value="<%=ActionNames.ACTUALIZAR_PUNTUACION%>">
	<%
	}
	%>
	<input type="hidden" name="<%=ParameterNames.ID_CUIDADOR%>"
		value="<%=cd.getIdcuidador()%>">

	<div class="seccionesHistorial">

		<p>
			<strong><%=cd.getNombre()%> <%=cd.getApellidos()%></strong>
		</p>

		<label class="star"><input type="radio" value="1"
			name="<%=ParameterNames.PUNTOS%>"
			<%if (pt != null) {
	if (pt.getPuntuacion() == 1) {%> checked <%}
}%>></label>
		<label class="star"><input type="radio" value="2"
			name="<%=ParameterNames.PUNTOS%>"
			<%if (pt != null) {
	if (pt.getPuntuacion() == 2) {%> checked <%}
}%>></label>
		<label class="star"><input type="radio" value="3"
			name="<%=ParameterNames.PUNTOS%>"
			<%if (pt != null) {
	if (pt.getPuntuacion() == 3) {%> checked <%}
}%>></label>
		<label class="star"><input type="radio" value="4"
			name="<%=ParameterNames.PUNTOS%>"
			<%if (pt != null) {
	if (pt.getPuntuacion() == 4) {%> checked <%}
}%>></label>
		<label class="star"> <input type="radio" value="5"
			name="<%=ParameterNames.PUNTOS%>"
			<%if (pt != null) {
	if (pt.getPuntuacion() == 5) {%> checked <%}
}%>></label>

	</div>
	<div id="comentario">
	<%
	if (pt != null) {
	%>
	<textarea name="<%=ParameterNames.COMENTARIO%>">
	<%
		if (pt.getComentario() != null) {
		%><%=pt.getComentario()%>
		<%
		}
		%></textarea>
	<%
	} else {
	%>
	<textarea name="<%=ParameterNames.COMENTARIO%>"></textarea>
	<%
	}
	%>
	<button type="submit" value="Guardar">
		<%
		if (pt == null) {
		%>
		Valorar cuidador
		<%
		} else {
		%>Actualizar valoración
		<%}%>
	</button>
	</div>
</form>
<%@include file="/html/common/footer.jsp"%>