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
  <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.EDIT_PERFIL_MASCOTA%>"/>
        <div class="mascotas">
        <div class="fotoMascota">
        
       <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(mas.getIdMascota())+"-mascota.jpg")%>" width="250" height="350">
    </div>
    <%} %>
    <div class="mascotasInfo">
        <form>
        <p>
            Fecha de nacimiento (aproximada):<br>
            <input type="date" name="mascota">
        </p>
    
        <p>
            Especie:<br>
            <select name="menu">
                <option value="0">- selecciona la especie-</option>
                <option value="1">Perro</option>
                <option value="2">Gato</option>
                <option value="3">Ave</option>
                <option value="5">Roedor</option>
                <option value="6">Reptil</option>
                <option value="7">Pez</option>
            
            </select>
        </p>
        <p>
            Tiene microchip?<br>
            <select name="menu">
                <option value="0">Sí</option>
                <option value="1">No</option>
            
            </select>
        </p>
        <p>
            Está vacunado?<br>
            <select name="menu">
                <option value="0">Sí</option>
                <option value="1">No</option>
            
            </select>
    </p>
    <p>
        Está esterilizado?<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Padece alguna alergia? (señala cuál en la sección de descripción)<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Está bajo tratamiento? (señala cuál en la sección de descripción)<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Se lleva bien con otros animales?<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Se lleva bien con los niños?<br>
        <select name="menu">
            <option value="0">Sí</option>
            <option value="1">No</option>
        
        </select>
    </p>
    <p>
        Descripción:<br>
        <textarea id="descripcion"></textarea>
    </p>
     </div>
</div>
    <input type="submit" value="Guardar">

     <%@include file="/html/common/footer.jsp"%>