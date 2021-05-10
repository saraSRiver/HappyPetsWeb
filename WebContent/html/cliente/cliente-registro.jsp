
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="com.happypets.web.utils.*"%>
<%@include file="/html/common/header.jsp"%>

<%List<Provincia> provincias = (List<Provincia>)request.getAttribute(AttributeNames.PROVINCIA);%>
<h2>Hazte cliente</h2>
<div id="access">
	<form
		action="<%=UrlBuilder.builderUrlForm(request, ContextsPath.CLIENTE) %>"
		method="post">
		<input type=hidden name="<%=ActionNames.ACTION%>"
			value="<%=ActionNames.REGISTRO_CLIENTE%>" />

		<p>
			Nombre:<br> <input type="text" name="<%=ParameterNames.NOMBRE%>">
		</p>
		<p>
			Apellidos:<br> <input type="text"
				name="<%=ParameterNames.APELLIDOS%>">
		</p>

		<p>
			Contraseña:<br> <input type="password"
				name="<%=ParameterNames.PASSWORD%>">
		</p>
		<p>
			Repetir contraseña:<br> <input type="password"
				name="<%=ParameterNames.REP_PASSWORD%>">
		</p>
		<p>
			Correo electrónico:<br> <input type="email"
				name="<%=ParameterNames.EMAIL%>">
		</p>
		<p>
			Repetir correo electrónico:<br> <input type="email"
				name="<%=ParameterNames.REP_EMAIL%>">
		</p>
		<p>
			Teléfono:<br> <input type="text"
				name="<%=ParameterNames.TELEFONO%>">
		</p>
		<p>
			Piso:<br> <input type="text" name="<%=ParameterNames.PISO%>">
		</p>
		<p>
			Número de vivienda/portal:<br> <input type="text"
				name="<%=ParameterNames.PORTAL%>">
		</p>

		<p>
			Código Postal:<br> <input type="text"
				name="<%=ParameterNames.CP%>">
		</p>
		<p>
			Calle:<br> <input type="text" name="<%=ParameterNames.CALLE%>">
		</p>

		<p>
			Provincia<br> <select name="<%=ParameterNames.PROVINCIA%>"
				id="provincia">
				<option value="0">- selecciona una provincia-</option>
				<%for(Provincia p: provincias) {%>
				<option value="<%=p.getidProvincia()%>"><%=p.getNombre()%></option>
				<%}%>

			</select>
		</p>
		<p>
			Población:<br> <select name="<%=ParameterNames.POBLACION%>"
				id="poblacion">
				<option value="0">- selecciona una poblacion-</option>
			</select>
		</p>
		<p>
			<label>Idiomas</label><br> <input type="checkbox"
				name="<%=ParameterNames.IDIOMAS %>" id="1" value="es">Español<br>
			<input type="checkbox" name="<%=ParameterNames.IDIOMAS %>" id="2"
				value="en">English<br> <input type="checkbox"
				name="<%=ParameterNames.IDIOMAS %>" id="3" value="ga">Galego<br>
		</p>

		<button class="buscar" type="button" value="Listo">Registrar</button>
	</form>
</div>
<%@include file="/html/common/footer.jsp"%>