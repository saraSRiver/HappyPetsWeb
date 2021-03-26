<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.jal.prueba.utils.*" %>

<footer role="contentinfo">
  <div class="contactos">
    <div class="ContenedorFooter">
      <h2><strong>Síguenos en las redes</strong></h2>
      <figure>
        <div class="redes"><img src="<%=UrlBuilder.builderUrlImgCommon(request, "facebook.svg")%>" alt="Facebook" ></div>
        <div  class="redes"><img src="<%=UrlBuilder.builderUrlImgCommon(request, "instagram.svg")%>" alt="Instagram" ></div>
        <div  class="redes"><img src="<%=UrlBuilder.builderUrlImgCommon(request, "twitter.png")%>" alt="Twitter"></div>
       </figure> 
    </div>
  <div>
    <div>
  <h2>Contacta con nosotros</h2>
<p><br><strong>Nuestro email</strong><br></p>    
<p>HappyPetsApp@gmail.com</p>  
<p><br><strong>Teléfono de Atención al Cliente</strong><br></p>  
<p>695509988</p>  
</div>
  
  <div>
  <figure>
    <img src="<%=UrlBuilder.builderUrlImgCommon(request,"contacto.svg")%>" alt="contactos" >
  </figure>
  
</div>

</footer>
</body>
</html>