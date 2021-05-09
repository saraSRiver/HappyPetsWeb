
    <%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
   <%@include file="/html/common/header.jsp"%>

<%
	Cuidador c = (Cuidador) request.getAttribute(AttributeNames.CUIDADOR);
%>
<div id="imgCuid">
<img src="<%=UrlBuilder.builderUrlImg(request, "cuidadores/" + String.valueOf(c.getIdcuidador()))+ "-detail.jpg"%>"/>
</div>
<h2><%=c.getNombre()%> <%=c.getApellidos()%> <span><%=c.getPuntuacionMedia()%></span></h2>
<div class="detailCuid">
<h4>Especies:</h4>
</div>	
<div class="detailP">
<%for(TipoEspecie e: c.getEspecies()){ %>
			<p><%=e.getNombre()%></p>
		<%} %>
	</div>	
	
	<div class="detailCuid">
<h4>Experiencia:</h4>
</div>	
<div class="detailP">
<p><%=c.getExperiencia().getValor()%></p>
</div>	

<div class="detailCuid">
<h4>Servicios:</h4>
</div>
<div class="detailP">
<%for (ServicioOfrecido so: c.getServiciosOfrecidos()){ %>
		<p><%=so.getNombreServicio()%></p>
		<p><%=so.getPrecio()%></p>
		<%} %>
		</div>	
		
		<div class="detailCuid">
<h4>Idiomas:</h4>
</div>
<div class="detailP">
<%for(Idioma i: c.getIdiomas()){ %>
		<p><%=i.getIdioma()%></p>
		<%} %>
		</div>
	
	<div class="detailCuid">	
<h4>Dirección:</h4>
</div>
<div class="detailP">
<p><%=c.getDireccion().getNombrePoblacion()%></p>

<p><%=c.getDireccion().getCalle()%></p>

<p>Portal <%=c.getDireccion().getPortal()%></p>

<p>Piso <%=c.getDireccion().getPiso()%></p>
</div>
  <button id= "botContratar"><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.PRECREATE, ActionNames.CONTRATAR, ParameterNames.ID_CUIDADOR, String.valueOf(c.getIdcuidador()))%>">Contratar</a></button>

  <%@include file="/html/common/footer.jsp"%>
