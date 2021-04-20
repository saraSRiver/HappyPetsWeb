<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    
    <%
    List<ContratoDTO> contratos = (List<ContratoDTO>) request.getAttribute(AttributeNames.CONTRATOS);
	Cuidador c = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
    %>
    
    <h2 class=>Contratar otra vez</h2>
    <form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CONTRATOS) %>" method="post">
 <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.HIRE_AGAIN%>"/>
 
<div class="seccionesHistorial">
<%for(ContratoDTO ct: contratos){%>
    <p><strong><%=ct.getNombreCuidador()%> <%=ct.getApellidosCuidador()%></strong></p>
      <%} %>
    
       <button class= "boton"><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.PRECREATE, ActionNames.CONTRATAR, ParameterNames.ID_CUIDADOR, String.valueOf(c.getIdcuidador()))%>">Contratar</a></button>
      </div>
      </form>
       <%@include file="/html/common/footer.jsp"%>