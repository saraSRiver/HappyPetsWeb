<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cliente cl = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
Mascota m = (Mascota)request.getAttribute( AttributeNames.MASCOTA);
TipoEspecie tp = (TipoEspecie)request.getAttribute(AttributeNames.TIPO_ESPECIE);
%>

    <h2><%=m.getNombre()%></h2>
	
    <form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.MASCOTA) %>"  method="post">
  <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.PERFIL_MASCOTA%>"/>
   
        <div class="mascotas">
        <div class="fotoMascota">
        <!--imagen de la masctoa-->
       <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(m.getIdMascota())+"-mascota.jpg")%>" width="250" height="300">
    </div>
 
    <div class="mascotasInfo">
        <form>
     
        <p>
            Fecha de nacimiento (aproximada):<br>
            <p><%=m.getFechaNacimiento()%></p>
        </p>
    
        <p>
        
            Especie:<br>
            <p><%=tp.getNombre()%></p>
        </p>
        <p>
            Tiene microchip?<br>
            <p><%=m.getMicrochip()?"si":"no"%></p>
        </p>
        <p>
            Está vacunado?<br>
            <p><%=m.getVacunado()?"si":"no"%></p>
    </p>
    <p>
        Está desparasitado?<br>
        <p><%=m.getDesparasitado()?"si":"no"%></p>
    </p>
    <p>
        Padece alguna alergia? (señala cuál en la sección de descripción)<br>
        <p><%=m.getAlergia()?"si":"no"%></p>
    </p>
    <p>
        Está bajo tratamiento? (señala cuál en la sección de descripción)<br>
        <p><%=m.getTratamiento()?"si":"no"%></p>
        
    </p>
    <p>
        Se lleva bien con otros animales?<br>
        <p><%=m.getBuenoConAnimales()?"si":"no"%></p>
        
     
    </p>
    <p>
        Se lleva bien con los niños?<br>
        <p><%=m.getBuenoConNinos()?"si":"no"%></p>
        
    </p>
    <p>
        Descripción:<br>
          <p><%=m.getDescripcion()%></p>
    </p>
   
   
    <button type="button" value="Editar perfil"> 
    <a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA,ActionNames.DETAIL, ParameterNames.ID_MASCOTA, 
    		String.valueOf(m.getIdMascota()), ActionNames.ACTION_UPDATE, ActionNames.UPDATE)%>">Editar perfil</a></button>

	<button type="button" value="Eliminar"> <a href="<%=UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA,ActionNames.ELIMINAR, ParameterNames.ID_MASCOTA, 
    		String.valueOf(m.getIdMascota()))%>">Eliminar</a></button>
    </div>
</div>
  </form>
     <%@include file="/html/common/footer.jsp"%>