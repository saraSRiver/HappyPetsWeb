   <%@page import="com.happypets.web.utils.ActionNames"%>
<%@page import="com.happypets.web.utils.ContextsPath"%>
<div class="perfil">
        <button><%=cuidador.getNombre()%></button>
        <div>
          <p>Mi perfil</p>
          <p>Historial de contratos</p>
          <a href="<%=UrlBuilder.builderUrlForm(request, ContextsPath.CUIDADOR + "?" + ActionNames.ACTION + "=" + ActionNames.LOG_OUT)%>">Cerrar sesi�n</a>
        </div>
      </div>