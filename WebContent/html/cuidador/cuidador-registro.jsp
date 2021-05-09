
<%@ page import="com.happypets.aplicacion.model.*, java.util.*"%>
<%@ page import="com.happypets.web.utils.*"%>
<%@include file="/html/common/header.jsp"%>
<h2>Hazte cuidador</h2>
<%List<Idioma> idiomas = (List<Idioma>)request.getAttribute(AttributeNames.IDIOMA);
 List<Experiencia> experiencia = (List<Experiencia>)request.getAttribute(AttributeNames.EXPERIENCIA);
 List<TipoEspecie> tipoEspecie = (List<TipoEspecie>)request.getAttribute(AttributeNames.TIPO_ESPECIE);

 List<Provincia> provincia = (List<Provincia>)request.getAttribute(AttributeNames.PROVINCIA);
 List<Servicio> servicios = (List<Servicio>)request.getAttribute(AttributeNames.SERVICIOS);
 %>
<div id="access">
	<form action="<%=UrlBuilder.builderUrlForm(request, "/cuidador") %>"
		method="post">
		<input type=hidden name="<%=ActionNames.ACTION%>"
			value="<%=ActionNames.REGISTRO_CUIDADOR%>" />
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
				<option value="0">--Selecciona provincia</option>
				<%for(Provincia p: provincia){%>
				<option value="<%=p.getidProvincia()%>"><%=p.getNombre()%></option>
				<%} %>
			</select>
		</p>
		<p>
			Población:<br> <select name="<%=ParameterNames.POBLACION%>"
				id="poblacion">
				<option value="0">--Selecciona poblacion</option>

			</select>
		</p>
		<p class="idiomaYanimales">
			<label>Idiomas</label><br>
			<%for(Idioma i: idiomas){%>
			<label><input type="checkbox" name="<%=ParameterNames.IDIOMAS%>" id="1"
				value="<%=i.getIdIdioma()%>"><%=i.getIdioma()%></label><br>
			<%}%>
		</p>
		<p>
			Experiencia<br> <select name="<%=ParameterNames.EXPERIENCIA%>">
				<option value="0">--Selecciona tu experiencia</option>
				<%for(Experiencia e: experiencia){%>
				<option value="<%=e.getIdExperiencia()%>"><%=e.getValor()%></option>
				<%} %>

			</select>
		</p>


		<p class="idiomaYanimales">

			¿Qué animales te interesa cuidar?<br>

			<%for(TipoEspecie tp: tipoEspecie){%>
			<label><input type="checkbox" name="<%=ParameterNames.ESPECIES%>" id="1"
				value="<%=tp.getIdTipoEspecie()%>"><%=tp.getNombre()%></label><br>
			<%}%>

		</p>
		<p>

			¿Qué servicios te interesa ofrecer?<br>

			<% for(Servicio s: servicios){%>
		
		<p>Precio:</p>
		<input type="text" name="<%=ParameterNames.PRECIO_SERVICIO %>"><br>
		<label><input type="checkbox" name="<%=ParameterNames.SERVICIOS %>"
			value="<%=s.getIdServicio()%>"><%=s.getNombreServicio()%></label><br>
		<%}%>

		</p>

		<input type="reset" value="Borrar datos"> <input type="submit"
			value="Listo">
	</form>
</div>
<%@include file="/html/common/footer.jsp"%>