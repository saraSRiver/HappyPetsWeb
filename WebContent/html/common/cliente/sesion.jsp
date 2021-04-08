      <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
   <div class="perfil">
        <button><%=cliente.getNombre()%></button>
        <div>
      
        <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.PERFIL_CLIENTE) %>"> Mi perfil</a>
        <a href="<%=UrlBuilder.builderUrlForm(request, ViewsNames.TUS_MASCOTAS) %>">Tus mascotas</a>
          <p>Historial de contratos</p>
	<a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.CLIENTE + "?" + ActionNames.ACTION + "=" + ActionNames.LOG_OUT)%>">Cerrar sesión</a>
        </div>
      </div>