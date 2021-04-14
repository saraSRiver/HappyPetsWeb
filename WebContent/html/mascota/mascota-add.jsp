
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    <%
Cliente cl = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
List<TipoEspecie>especies=(List<TipoEspecie>)request.getAttribute(AttributeNames.TIPO_ESPECIE);
%>

<h2>Nueva mascota</h2>
	
    <form action= "<%=UrlBuilder.builderUrlForm(request, ContextsPath.MASCOTA)%>"  method="post">
  <input type=hidden name="<%=ActionNames.ACTION%>" value="<%=ActionNames.ADD_MASCOTA%>"/>

        <div class="mascotas">
        <div class="fotoMascota">
        
       <img src="" width="250" height="350">
    </div>
    
    <div class="mascotasInfo">
        <form>
        
         <p>
            <strong>Nombre:</strong><br>
            <input type="text" name="<%=ParameterNames.NOMBRE_MASCOTA%>">
        </p>
    
        <p>
            <strong>Fecha de nacimiento (aproximada):</strong><br>
            <input type="date" name="<%=ParameterNames.FECHA_NACIMIENTO%>">
        </p>
    
        <p>
        	
            <strong>Especie:</strong><br>
         
            <select name="<%=ParameterNames.ESPECIES%>">
               <%
			for(TipoEspecie e: especies){
				%>
                <option value="<%=e.getIdTipoEspecie()%>"
                ><%=e.getNombre()%></option>
			<%} %>
            
            </select>
            	
        </p>
        <p>
            <strong>Tiene microchip?</strong><br>
            <select name="<%=ParameterNames.MICROCHIP%>">
                <option value="true">Sí</option>
                <option value="false" >No</option>
            
            </select>
        </p>
        <p>
            <strong>Está vacunado?</strong><br>
            <select name="<%=ParameterNames.VACUNADO%>">
                  <option value="true">Sí</option>
                <option value="false" >No</option>
            
            </select>
    </p>
    <p>
        <strong>Está desparasitado?</strong><br>
        <select name="<%=ParameterNames.DESPARASITADO%>">
            <option value="true" >Sí</option>
                <option value="false">No</option>
        
        </select>
    </p>
    <p>
        <strong>Padece alguna alergia? (señala cuál en la sección de descripción)</strong><br>
        <select name="<%=ParameterNames.ALERGIA%>">
           <option value="true" >Sí</option>
                <option value="false">No</option>
        
        </select>
    </p>
    <p>
       <strong> Está bajo tratamiento? (señala cuál en la sección de descripción)</strong><br>
        <select name="<%=ParameterNames.TRATAMIENTO%>">
             <option value="true" >Sí</option>
                <option value="false">No</option>
        
        </select>
    </p>
    <p>
        <strong>Se lleva bien con otros animales?</strong><br>
        <select name="<%=ParameterNames.BIEN_CON_ANIMALES%>">
             <option value="true" >Sí</option>
                <option value="false">No</option>
        
        </select>
    </p>
    <p>
        <strong>Se lleva bien con los niños?</strong><br>
        <select name="<%=ParameterNames.BIEN_CON_NINOS%>">
          <option value="true" >Sí</option>
          <option value="false" >No</option>
        
        </select>
    </p>
    <p>
        <strong>Descripción:</strong><br>
        <textarea id="descripcion" name="<%=ParameterNames.DESCRIPCION%>"></textarea>
    </p>
     </div>
</div>
 <input type="submit" value="Guardar">

     <%@include file="/html/common/footer.jsp"%>