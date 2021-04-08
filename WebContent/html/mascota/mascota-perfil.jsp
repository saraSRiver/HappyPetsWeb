<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cliente cl = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);

%>

<%for(Mascota mas: cl.getMascotas()){	%>
    <h2><%=mas.getNombre()%></h2>
	
    <form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.MASCOTA) %>"  method="post">
  <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.PERFIL_MASCOTA%>"/>
   
        <div class="mascotas">
        <div class="fotoMascota">
        <!--imagen de la masctoa-->
       <img src="" width="250" height="300">
    </div>
      <%} %>
    <div class="mascotasInfo">
        <form>
        <p>
            Fecha de nacimiento (aproximada):<br>
            <p></p>
        </p>
    
        <p>
            Especie:<br>
            <p></p>
        </p>
        <p>
            Tiene microchip?<br>
            <p></p>
        </p>
        <p>
            Está vacunado?<br>
            <p></p>
    </p>
    <p>
        Está esterilizado?<br>
        <p></p>
    </p>
    <p>
        Padece alguna alergia? (señala cuál en la sección de descripción)<br>
        <p></p>
    </p>
    <p>
        Está bajo tratamiento? (señala cuál en la sección de descripción)<br>
        <p></p>
        
        </select>
    </p>
    <p>
        Se lleva bien con otros animales?<br>
        <p></p>
        
        </select>
    </p>
    <p>
        Se lleva bien con los niños?<br>
        <p></p>
        
        </select>
    </p>
    <p>
        Descripción:<br>
        <textarea id="descripcion"></textarea>
    </p>
    <form>
    <input type="submit" value="Guardar">

    </div>
</div>
  </form>
     <%@include file="/html/common/footer.jsp"%>