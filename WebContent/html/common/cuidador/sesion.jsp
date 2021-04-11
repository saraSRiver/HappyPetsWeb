   <%@page import="com.happypets.web.utils.AttributeNames"%>
<%@page import="com.happypets.web.utils.ActionNames"%>
<%@page import="com.happypets.web.utils.ContextsPath"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
<div class="perfil">
   <%
Cuidador c = (Cuidador)SessionManager.get(request,AttributeNames.CUIDADOR);
%>
        <button><%=c.getNombre()%></button>
        <div>
                  <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.PERFIL_CUIDADOR) %>"> Mi perfil</a>
          <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.HISTORIAL_CUIDADOR)%>">Historial de contratos</a>
          <a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.CUIDADOR + "?" + ActionNames.ACTION + "=" + ActionNames.LOG_OUT)%>">Cerrar sesión</a>
        </div>
      </div>