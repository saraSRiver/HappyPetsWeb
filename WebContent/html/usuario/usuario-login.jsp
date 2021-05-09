
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="com.happypets.web.utils.*"%>

<%@include file="/html/common/header.jsp"%>

<h2>¿Eres cuidador o cliente?</h2>
<div id="access">
	<form action="<%=UrlBuilder.builderUrlForm(request, "/usuario") %>"
		method="post" id="formLogin">
		<input type=hidden name="<%=ActionNames.ACTION%>"
			value="<%=ActionNames.LOGIN%>" /> 
			<label><input type="radio" name="tipoUsuario" value="cuidador">Cuidador</label><br> 
			<label><input type="radio" name="tipoUsuario" value="cliente">Cliente</label><br>
		<%
		String emailError = errors.getError(ParameterNames.EMAIL);
		if (emailError!=null) { 
			%>
		<p><%=emailError%>

		</p>
		<%}%>
		<input type="text" name="email">

		<%
		String passwordError = errors.getError(ParameterNames.PASSWORD);
		if (passwordError!=null) { 
			%>
		<p><%=passwordError%>
			<%}%>
		</p>
		<input type="text" name="password"> <label><input
			type="radio" name="" value="1">Recordar usuario</label><br>

		<button class="buscar" type="button">Iniciar sesión</button>
	</form>
</div>
<%@include file="/html/common/footer.jsp"%>