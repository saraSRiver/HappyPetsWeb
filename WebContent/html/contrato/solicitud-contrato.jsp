<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="java.util.List"%>
<%@ page import="com.jal.prueba.utils.*"%>
<%@include file="/html/common/header.jsp"%>

<%
Cuidador c = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
%>
<%
List<Mascota> mascotas= (List<Mascota>)request.getAttribute(AttributeNames.MASCOTA);
%>

<h2>
	Has solicitado los servicios de <%=c.getNombre()%></h2>
<section>
	<div class="solicitud">
		<form>
			<p>
			<%
			for(Mascota m: mascotas){
				%>
			
				Nombre de la mascota:<br> <select name="menu">
					<option value="0"></option>
					<option value="1">Mascota2</option>
					<option value="2">Mascota3</option>
						
				</select>
				<%} %>
			</p>

			<p>
				Especie de la mascota:<br>
			<p></p>
			</p>
			<p>
				Servicio:<br> <select name="menu">
					<option value="0">Paseos</option>
					<option value="1">Visitas a domicilio</option>
					<option value="2">Cuidados a domicilio</option>
					<option value="3">Guardería de día</option>
					<option value="4">Alojamiento</option>

				</select>
			</p>
			<p>
				Fecha de comienzo del contrato:<br> <input type="date"
					name="fechaIn">
			</p>
			<p>
				Fecha del fin del contrato:<br> <input type="date"
					name="fechaFin">
			</p>

			<p>
				Piso:<br> <input type="text" name="piso">
			</p>
			<p>
				Número de vivienda/portal:<br> <input type="text" name="portal">
			</p>
			<p>
				Calle:<br> <input type="text" name="calle">
			</p>
			<p>
				Población:<br> <select name="menu">
					<option value="0">- selecciona una provincia-</option>
					<option value="1">A Coruña</option>
					<option value="2">Pontevedra</option>
					<option value="3">Lugo</option>
					<option value="4">Ourense</option>

				</select>
			</p>
			<p>
				Provincia<br> <select name="menu">
					<option value="0">- selecciona tu provincia-</option>
					<option value="1">A Coruña</option>
					<option value="2">Pontevedra</option>
					<option value="3">Lugo</option>
					<option value="4">Ourense</option>

				</select>
			</p>


			<input type="checkbox" name="promocion">Tienes una promoción
			en este servicio, deseas aplicarla?<br>
			<p>
				Precio<br>
			<p></p>

			</p>
	</div>

</section>
<input class="borrar" type="reset" value="Borrar datos">
<input class="listo" type="submit" value="Listo">

</form>

<%@include file="/html/common/footer.jsp"%>