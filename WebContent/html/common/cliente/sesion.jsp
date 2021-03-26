      <%@ page import="com.happypets.aplicacion.model.*, java.util.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
   <div class="perfil">
        <button><%=cliente.getNombre()%></button>
        <div>
        <p>Mi perfil</p>
          <p>Mis mascotas</p>
          <p>Historial de contratos</p>
	<a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.CLIENTE + "?" + ActionNames.ACTION + "=" + ActionNames.LOG_OUT)%>">Cerrar sesión</a>
        </div>
      </div>