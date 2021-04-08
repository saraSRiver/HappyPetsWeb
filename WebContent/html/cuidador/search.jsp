<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.web.utils.*" %>
      <%@include file="/html/common/header.jsp"%>
   
<body>

   <h2>Búsqueda de cuidadores</h2>
   <form action= "<%=UrlBuilder.builderUrlForm(request, AttributeNames.CUIDADOR) %>" method="post">
    

   <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.CUIDADOR_BUSCAR%>"/>
   
<section>
    <div class="busqueda">
   
        <p>
            Experiencia<br>
            <select name="<%=ParameterNames.EXPERIENCIA%>">
                <option value="1">Menos de 1 año</option>
                <option value="2">1 año</option>
                <option value="3">2 años</option>
                <option value="4">Más de 2 años</option>
            
            </select>
            </p>
        </div>
            <div class="especiesServicios">
            <p>
              
                ¿Qué tipo de animal hay que cuidar?<br>
                <input type="radio"  name="<%=ParameterNames.ESPECIES %>" id="1" value="1">Perros<br>
                <input type="radio"  name="<%=ParameterNames.ESPECIES %>" id="2" value="2">Gatos<br>
                <input type="radio"  name="<%=ParameterNames.ESPECIES %>" id="3" value="3">Roedores<br>
                <input type="radio"  name="<%=ParameterNames.ESPECIES %>" id="4" value="4">Aves<br>
                <input type="radio"  name="<%=ParameterNames.ESPECIES %>" id="5" value="5">Peces<br>
                <input type="radio"  name="<%=ParameterNames.ESPECIES %>" id="6" value="6">Reptiles<br>
                </p>
                <p>
                   
                    ¿Qué servicio necesitas?<br>
                 
                    <input type="radio" name="<%=ParameterNames.SERVICIOS %>" id="1" value="1">Paseos<br>
                    <input type="radio" name="<%=ParameterNames.SERVICIOS %>" id="2" value="2">Visitas a domicilio<br>
                    <input type="radio"  name="<%=ParameterNames.SERVICIOS %>" id="3" value="3">Cuidados a domicilio<br>
                    <input type="radio"  name="<%=ParameterNames.SERVICIOS %>" id="4" value="4">Guardería de día<br>
                    <input type="radio"  name="<%=ParameterNames.SERVICIOS %>" id="5" value="5">Alojamiento<br>
                    </p>
               
                </div>
        
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
	    <option value="1">- selecciona una provincia-</option>
	    <option value="2">A Coruña</option>
	    <option value="3">Pontevedra</option>
	    <option value="4">Lugo</option>
	    <option value="5">Ourense</option>
	
	</select>
</p>
<p>
	Idiomas<br>
	<input type="radio"  name="<%=ParameterNames.IDIOMAS %>" id="1" value="es">Español<br>
	<input type="radio"  name="<%=ParameterNames.IDIOMAS %>" id="2" value="en">English<br>
	<input type="radio"  name="<%=ParameterNames.IDIOMAS %>" id="3" value="ga">Galego<br>
	</p>
<p>
    Precio desde:<br>
    <input type="text" name="<%=ParameterNames.PRECIO_DESDE %>" >
</p>
<p>
    Precio hasta:<br>
    <input type="text" name="<%=ParameterNames.PRECIO_HASTA %>" >
</p>
 </section>

    <input class="buscar" type="submit" value="buscar">


      <%@include file="/html/common/footer.jsp"%>