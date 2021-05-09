
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cliente cl = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
List<Mascota>mascotas= (List<Mascota>)request.getAttribute( AttributeNames.MASCOTA);
%>
<div class="mascotas">
    <h2>Tus mascotas</h2>
<h4>Marca cuál de ellas quieres que participe en la promoción de la Mascota del Mes</h4>



<%for(Mascota mas: cl.getMascotas()){
				%>
				<div class="fotoMascota">
    <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(mas.getIdMascota())+"-mascota.jpg")%>">
        </div>
    <label><input type="radio" name="favorito"><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA, ActionNames.DETAIL, ParameterNames.ID_MASCOTA, String.valueOf(mas.getIdMascota()))%>"><%=mas.getNombre()%></a></label>
    
    
    
     

	<%} %>
<%if(cliente.getMascotas().size() < 3){%>
	<button><a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.PRECREATE, ActionNames.ADD_MASCOTA)%>">Añadir mascota</a></button>
<%}%>
  </div>

   <%@include file="/html/common/footer.jsp"%>
 