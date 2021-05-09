
    <%@ page import="com.happypets.web.utils.*" %>
      <%@include file="/html/common/header.jsp"%>
   
<body>
	<%List<Provincia> provincias = (List<Provincia>)request.getAttribute(AttributeNames.PROVINCIA);
	List<Cuidador>cuidadores = (List<Cuidador>) request.getAttribute(AttributeNames.CUIDADOR);
	%>
   <h2>Búsqueda de cuidadores</h2>
  <section id="search">
   <form action= "<%=UrlBuilder.builderUrlForm(request, ContextsPath.CUIDADOR) %>" method="post">
    

   <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.CUIDADOR_BUSCAR%>"/>
   

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
	Provincia<br>
	<select name="<%=ParameterNames.PROVINCIA%>" id="provincia">
	    <option value="0">- selecciona una provincia-</option>
	 	<%for(Provincia p: provincias) {%>
	 		<option value="<%=p.getidProvincia()%>"><%=p.getNombre()%></option>
	 	<%}%>
	
	</select>
</p>
<p>
    Población:<br>
     <select name="<%=ParameterNames.POBLACION%>" id="poblacion">
      <option value="0">- selecciona una poblacion-</option>
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


    <input id="buscarB" type="submit" value="buscar">
</form>

<section>
<p>Resultados de tu búsqueda:<%=cuidadores.size()%></p>
	<%
	
	for(Cuidador c: cuidadores){
		%>
		<section class="results">
		<a href="<%=UrlBuilder.builderUrlForm(request,"/cuidador?action=detail&" + ParameterNames.ID_CUIDADOR + "=")%>
		<%=c.getIdcuidador()%>"><%=c.getNombre()%> <%=c.getApellidos()%></a>
	
	<div class="caracteristicas">
		<h4>Idiomas:</h4>
		<div class="carP">
		<%for(Idioma i: c.getIdiomas()){ %>
		<p><%=i.getIdioma()%></p>
		<%} %>
		</div>
	</div>
	<div class="caracteristicas">
		<h4>Experiencia:</h4>
	<div class="carP">
		<p><%=c.getExperiencia().getValor()%></p>
		</div>
		</div>
		
		<div class="caracteristicas">
		<h4>Especies:</h4>
		<div class="carP">
		<%for(TipoEspecie e: c.getEspecies()){ %>
			<p><%=e.getNombre()%></p>
		<%} %>
		</div>
		</div>
		<div class="caracteristicas">
		<h4>Servicios:</h4>
		<div class="carP">
		<%for (ServicioOfrecido so: c.getServiciosOfrecidos()){ %>
		<p><%=so.getNombreServicio()%></p>
		<p><%=so.getPrecio()%> euros</p>
		<%} %>
		</div>
		</div >
		<div class="caracteristicas">
		<h4>Teléfono:</h4>
		<div class="carP">
			<p><%=c.getTelefono()%></p>
			</div>
			</div>
			<div class="caracteristicas">
			<h4>Población</h4>
			<div class="carP">
			<p><%=c.getDireccion().getNombrePoblacion()%></p>
			</div>
			</div>
			<div class="caracteristicas">
			<h4>Provincia:</h4>
			<div class="carP">
			<p><%=c.getDireccion().getNombreProvincia()%></p>
			</div>
			</div>
			<div class="caracteristicas">
			<h4>Puntuación media:</h4>
			<div class="carP">
			<p><%=c.getPuntuacionMedia()%></p>
			</div>
			</div>
			</section>
	<%
	}
%>


</section>
</section>
      <%@include file="/html/common/footer.jsp"%>