
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cliente cl = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
Mascota m = (Mascota)request.getAttribute( AttributeNames.MASCOTA);
List<TipoEspecie>especies=(List<TipoEspecie>)request.getAttribute(AttributeNames.ESPECIES);
%>

<h2><%=m.getNombre()%></h2>
	 <div class="mascotas">
    <form action= "<%=UrlBuilder.builderUrlForm(request, ContextsPath.MASCOTA)%>"  method="post">
  <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.EDIT_PERFIL_MASCOTA%>"/>
   <input type=hidden name="<%=ParameterNames.ID_MASCOTA%>" value="<%=m.getIdMascota()%>">    
       
        <div class="fotoMascota">
        
       <img src="<%=UrlBuilder.builderUrlImgMascotas(request, String.valueOf(m.getIdMascota())+"-mascota.jpg")%>" width="250" height="350">
   <p>
        <strong>Descripción:</strong><br>
        <textarea id="descripcion" name="<%=ParameterNames.DESCRIPCION%>"><%if(m.getDescripcion() != null){%><%=m.getDescripcion()%><%}%></textarea>
    </p>
    </div>
    
   	<div>
      
         <p>
            <strong>Nombre:</strong><br>
            <input type="text" name="<%=ParameterNames.NOMBRE_MASCOTA%>"  value="<%=m.getNombre()%>">
        </p>
    
        <p>
            <strong>Fecha de nacimiento (aproximada):</strong><br>
            <input type="date" name="<%=ParameterNames.FECHA_NACIMIENTO%>"  value="<%=m.getFechaNacimiento()%>">
        </p>
    
        <p>
        	
            <strong>Especie:</strong><br>
         
            <select name="<%=ParameterNames.ESPECIES%>">
               <%
			for(TipoEspecie e: especies){
				%>
                <option value="<%=e.getIdTipoEspecie()%>"
                <%if(m.getIdTipo() == e.getIdTipoEspecie()){%>selected<%}%>><%=e.getNombre()%></option>
			<%} %>
            
            </select>
            	
        </p>
        <p>
            <strong>¿Tiene microchip?</strong><br>
            <select name="<%=ParameterNames.MICROCHIP%>">
                <option value="true" <%if(m.getMicrochip()){%>selected<%}%>>Sí</option>
                <option value="false" <%if(!m.getMicrochip()){%>selected<%}%>>No</option>
            
            </select>
        </p>
        <p>
            <strong>¿Está vacunado?</strong><br>
            <select name="<%=ParameterNames.VACUNADO%>">
                  <option value="true" <%if(m.getVacunado()){%>selected<%}%>>Sí</option>
                <option value="false" <%if(!m.getVacunado()){%>selected<%}%>>No</option>
            
            </select>
    </p>
    <p>
        <strong>¿Está desparasitado?</strong><br>
        <select name="<%=ParameterNames.DESPARASITADO%>">
            <option value="true" <%if(m.getDesparasitado()){%>selected<%}%>>Sí</option>
                <option value="false" <%if(!m.getDesparasitado()){%>selected<%}%>>No</option>
        
        </select>
    </p>
    <p>
        <strong>¿Padece alguna alergia? (señala cuál en la sección de descripción)</strong><br>
        <select name="<%=ParameterNames.ALERGIA%>">
           <option value="true" <%if(m.getAlergia()){%>selected<%}%>>Sí</option>
                <option value="false" <%if(!m.getAlergia()){%>selected<%}%>>No</option>
        
        </select>
    </p>
    <p>
       <strong> ¿Está bajo tratamiento? (señala cuál en la sección de descripción)</strong><br>
        <select name="<%=ParameterNames.TRATAMIENTO%>">
             <option value="true" <%if(m.getTratamiento()){%>selected<%}%>>Sí</option>
                <option value="false" <%if(!m.getTratamiento()){%>selected<%}%>>No</option>
        
        </select>
    </p>
    <p>
        <strong>¿Se lleva bien con otros animales?</strong><br>
        <select name="<%=ParameterNames.BIEN_CON_ANIMALES%>">
             <option value="true" <%if(m.getBuenoConAnimales()){%>selected<%}%>>Sí</option>
                <option value="false" <%if(!m.getBuenoConAnimales()){%>selected<%}%>>No</option>
        
        </select>
    </p>
    <p>
        <strong>¿Se lleva bien con los niños?</strong><br>
        <select name="<%=ParameterNames.BIEN_CON_NINOS%>">
          <option value="true" <%if(m.getBuenoConNinos()){%>selected<%}%>>Sí</option>
                <option value="false" <%if(!m.getBuenoConNinos()){%>selected<%}%>>No</option>
        
        </select>
    </p>
    
    
    <button type="submit" value="Guardar">Actualizar perfil</button>
 </div>
  </form>
  </div>
     <%@include file="/html/common/footer.jsp"%>