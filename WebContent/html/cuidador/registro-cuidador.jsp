<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
 <h2>Hazte cuidador</h2>
 <form action= "<%=UrlBuilder.builderUrlForm(request, "/cuidador") %>" method="post">
 <input type=hidden name="<%=ParameterNames.ACTION%>" value="<%=ActionNames.REGISTRO_CUIDADOR%>"/>
  <p>
            Nombre:<br>
        <input type="text" name="<%=ParameterNames.NOMBRE%>" >
    </p>
    <p>
        Apellidos:<br>
        <input type="text" name="<%=ParameterNames.APELLIDOS%>">
    </p>

    <p>
        Contraseña:<br>
        <input type="password" name="<%=ParameterNames.PASSWORD%>" >
    </p>
    <p>
        Repetir contraseña:<br>
        <input type="password" name="<%=ParameterNames.REP_PASSWORD%>">
    </p>
    <p>
        Correo electrónico:<br>
    <input type="email" name="<%=ParameterNames.EMAIL%>" >
</p>
<p>
    Repetir correo electrónico:<br>
<input type="email" name="<%=ParameterNames.REP_EMAIL%>" >
</p>
<p>
    Teléfono:<br>
    <input type="text" name="<%=ParameterNames.TELEFONO%>">
</p>
<p>
    Piso:<br>
    <input type="text" name="<%=ParameterNames.PISO%>">
</p>
<p>
    Número de vivienda/portal:<br>
    <input type="text" name="<%=ParameterNames.PORTAL%>" >
</p>
<p>
    Código Postal:<br>
    <input type="text" name="<%=ParameterNames.CP%>" >
</p>
<p>
    Calle:<br>
    <input type="text" name="<%=ParameterNames.CALLE%>">
</p>
<p>
    Población:<br>
     <select name="<%=ParameterNames.POBLACION%>">
                <option  value="1">Chantada</option>
                <option value="2">O Grove</option>
                <option value="3">A Coruña</option>
                <option value="4">Ferrol</option>
                 <option value="5">Lalín</option>
                  <option value="6">Sanxexo</option>
                   <option value="7">Portonovo</option>
                    <option value="8">Neda</option>
                      <option value="9">Fene</option>
                        <option value="10">Narón</option>
            </select>
          </p>  
<p>
Provincia<br>
<select name="<%=ParameterNames.PROVINCIA%>">
    <option value="0">- selecciona tu provincia-</option>
    <option value="1">A Coruña</option>
    <option value="2">Pontevedra</option>
    <option value="3">Lugo</option>
    <option value="4">Ourense</option>

</select>
</p>
<p>
	Idiomas<br>
	<input type="checkbox"  name="<%=ParameterNames.IDIOMAS %>" id="1" value="es">Español<br>
	<input type="checkbox"  name="<%=ParameterNames.IDIOMAS %>" id="2" value="en">English<br>
	<input type="checkbox"  name="<%=ParameterNames.IDIOMAS %>" id="3" value="ga">Galego<br>
	</p>
<p>
    Experiencia<br>
    <select name="<%=ParameterNames.EXPERIENCIA%>">
        <option value="0">Menos de 1 año</option>
        <option value="1">1 año</option>
        <option value="2">2 años</option>
        <option value="3">Más de 2 años</option>
    
    </select>
    </p>

  
    <p>
      
        ¿Qué animales te interesa cuidar?<br>
      
        <input type="checkbox" name="<%=ParameterNames.ESPECIES %>">Perros<br>
        <input type="checkbox" name="<%=ParameterNames.ESPECIES %>">Gatos<br>
        <input type="checkbox" name="<%=ParameterNames.ESPECIES %>">Roedores<br>
        <input type="checkbox" name="<%=ParameterNames.ESPECIES %>">Aves<br>
        <input type="checkbox" name="<%=ParameterNames.ESPECIES %>">Peces<br>
        <input type="checkbox" name="<%=ParameterNames.ESPECIES %>">Reptiles<br>
       
        </p>
        <p>
           
            ¿Qué servicios te interesa ofrecer?<br>
            
            <input type="checkbox" name="<%=ParameterNames.SERVICIOS %>">Paseos<br>
            <p>Precio:</p>
            <input type="text" name="<%=ParameterNames.PRECIO_SERVICIO %>"><br>
            <input type="checkbox" name="<%=ParameterNames.SERVICIOS %>">Visitas a domicilio<br>
            <p>Precio:</p>
            <input type="text" name="<%=ParameterNames.PRECIO_SERVICIO %>"><br>
            <input type="checkbox" name="<%=ParameterNames.SERVICIOS %>">Cuidados a domicilio<br>
            <p>Precio:</p>
            <input type="text" name="<%=ParameterNames.PRECIO_SERVICIO %>"><br>
            <input type="checkbox" name="<%=ParameterNames.SERVICIOS %>">Guardería de día<br>
            <p>Precio:</p>
            <input type="text" name="<%=ParameterNames.PRECIO_SERVICIO %>"><br>
            <input type="checkbox" name="<%=ParameterNames.SERVICIOS %>">Alojamiento<br>
            <p>Precio:</p>
            <input type="text" name="<%=ParameterNames.PRECIO_SERVICIO %>"><br>
            
            </p>

    <input type="reset" value="Borrar datos">
    <input type="submit" value="Listo">
 
     <%@include file="/html/common/footer.jsp"%>