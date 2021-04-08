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
            Est� vacunado?<br>
            <p></p>
    </p>
    <p>
        Est� esterilizado?<br>
        <p></p>
    </p>
    <p>
        Padece alguna alergia? (se�ala cu�l en la secci�n de descripci�n)<br>
        <p></p>
    </p>
    <p>
        Est� bajo tratamiento? (se�ala cu�l en la secci�n de descripci�n)<br>
        <p></p>
        
        </select>
    </p>
    <p>
        Se lleva bien con otros animales?<br>
        <p></p>
        
        </select>
    </p>
    <p>
        Se lleva bien con los ni�os?<br>
        <p></p>
        
        </select>
    </p>
    <p>
        Descripci�n:<br>
        <textarea id="descripcion"></textarea>
    </p>
    <form>
    <input type="submit" value="Guardar">

    </div>
</div>
  </form>
     <%@include file="/html/common/footer.jsp"%>