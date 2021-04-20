<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
      <%
      List<ContratoDTO> contratos = (List<ContratoDTO>) request.getAttribute(AttributeNames.CONTRATOS);
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
    Integer pt=(Integer)request.getAttribute(AttributeNames.PUNTUACION);
%> 
<h2 class=>Cuidadores que has valorado</h2>
<form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.PUNTUACION) %>" method="post">
 <%for(ContratoDTO ct: contratos){%>
 <input type=hidden name="<%=ActionNames.ACTION%>" 
 			<%if(pt == 0){%>
				value="<%=ActionNames.PUNTUAR_CUIDADOR%>"/><%}
 			else{%>
				value="<%=ActionNames.ACTUALIZAR_PUNTUACION%>"
				<%}%> <input type="hidden"
				 name="<%=ParameterNames.ID_CUIDADOR%>"value="<%=ct.getIdCuidador()%>">

<div class="seccionesHistorial">

    <p><strong><%=ct.getNombreCuidador()%> <%=ct.getApellidosCuidador()%></strong></p>

 		<input type="text" value="1" name="<%=ParameterNames.PUNTOS%>"><%if(pt == 1){%>checked<%}%>
        <input type="text" value="2" name="<%=ParameterNames.PUNTOS%>" ><%if(pt == 2){%>checked<%}%>
        <input type="text" value="3" name="<%=ParameterNames.PUNTOS%>" ><%if(pt == 3){%>checked<%}%>
        <input type="text" value="4" name="<%=ParameterNames.PUNTOS%>" ><%if(pt == 4){%>checked<%}%>
        <input type="text" value="5"  name="<%=ParameterNames.PUNTOS%>" ><%if(pt == 5){%>checked<%}%>
         <%} %>
</div>
<button type="submit" class="Buscar"><%if(pt == null){%>Valorar cuidador
			<%}else{%>Actualizar valoración<%}%></button>
  </form>
     <%@include file="/html/common/footer.jsp"%>