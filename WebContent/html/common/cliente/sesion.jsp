      <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
   <div class="perfil">
       <%
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
    %>
        <button><%=cl.getNombre()%></button>
        <div>
      
        <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.PERFIL_CLIENTE) %>"> Mi perfil</a>
          <a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.CONTRATO, ActionNames.HISTORIAL_CLIENTE)%>">Historial de contratos</a>
	<a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.CLIENTE + "?" + ActionNames.ACTION + "=" + ActionNames.LOG_OUT)%>">Cerrar sesión</a>
        </div>
      </div>