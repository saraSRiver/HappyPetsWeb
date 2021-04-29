<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*"%>
    <%@ page import="com.happypets.web.utils.*" %>
      <%@include file="/html/common/header.jsp"%>
   
 <h2>Hazte cliente</h2>
    <form action= "<%=UrlBuilder.builderUrlForm(request, ContextsPath.CLIENTE) %>"  method="post">
    <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.REGISTRO_CLIENTE%>"/>
  
  <p>
            Nombre:<br>
        <input type="text" name="<%=ParameterNames.NOMBRE%>" >
    </p>
    <p>
        Apellidos:<br>
        <input type="text" name="<%=ParameterNames.APELLIDOS%>">
    </p>

    <p>
        Contrase�a:<br>
        <input type="password" name="<%=ParameterNames.PASSWORD%>" >
    </p>
    <p>
        Repetir contrase�a:<br>
        <input type="password" name="<%=ParameterNames.REP_PASSWORD%>" >
    </p>
    <p>
        Correo electr�nico:<br>
    <input type="email" name="<%=ParameterNames.EMAIL%>" >
</p>
<p>
    Repetir correo electr�nico:<br>
<input type="email" name="<%=ParameterNames.REP_EMAIL%>" >
</p>
<p>
    Tel�fono:<br>
    <input type="text" name="<%=ParameterNames.TELEFONO%>">
</p>
<p>
    Piso:<br>
    <input type="text" name="<%=ParameterNames.PISO%>" >
</p>
<p>
    N�mero de vivienda/portal:<br>
    <input type="text" name="<%=ParameterNames.PORTAL%>" >
</p>

<p>
    C�digo Postal:<br>
    <input type="text" name="<%=ParameterNames.CP%>" >
</p>
<p>
    Calle:<br>
    <input type="text" name="<%=ParameterNames.CALLE%>">
</p>
<p>
    Poblaci�n:<br>
     <select name="<%=ParameterNames.POBLACION%>">
                <option  value="1">Chantada</option>
                <option value="2">O Grove</option>
                <option value="3">A Coru�a</option>
                <option value="4">Ferrol</option>
                 <option value="5">Lal�n</option>
                  <option value="6">Sanxexo</option>
                   <option value="7">Portonovo</option>
                    <option value="8">Neda</option>
                      <option value="9">Fene</option>
                        <option value="10">Nar�n</option>
            </select>
          </p>  
<p>
Provincia<br>
<select name="<%=ParameterNames.PROVINCIA%>">
    <option value="0">- selecciona tu provincia-</option>
    <option value="1">A Coru�a</option>
    <option value="2">Pontevedra</option>
    <option value="3">Lugo</option>
    <option value="4">Ourense</option>

</select>
</p>
<p>
	Idiomas<br>
	<input type="checkbox"  name="<%=ParameterNames.IDIOMAS %>" id="1" value="es">Espa�ol<br>
	<input type="checkbox"  name="<%=ParameterNames.IDIOMAS %>" id="2" value="en">English<br>
	<input type="checkbox"  name="<%=ParameterNames.IDIOMAS %>" id="3" value="ga">Galego<br>
	</p>
      
        <input class="buscar" type="submit" value="Listo">
         </form>
      <%@include file="/html/common/footer.jsp"%>