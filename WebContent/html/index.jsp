<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.jal.prueba.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
          <div class="MascotaMes">
            <h2>Mascota del mes</h2>
                <%
	Mascota m = (Mascota) request.getAttribute("mascota");
%>
             <form action="<%=UrlBuilder.builderUrlForm(request, "/html/")%><%=ViewsNames.INDEX%><%=m.getIdMascota()%>" method="post">
              <input type=hidden name="<%=ActionNames.ACTION%>" value="index"/>
      <figure>
        
        <div class="ContenedorIMG">
      
          
      <img src="<%=UrlBuilder.builderUrlImgFav(request, String.valueOf(m.getIdMascota())+"-mascota.jpg")%>" alt="Mascota del mes" class="MASCMES" style="width:100%">
      <div class="middle">
        <div class="text"><%=m.getNombre()%></div>
      </div>
    </div>
      <figcaption>Marzo 2021</figcaption>
    </figure>
</div>

<h2>Nuestros servicios</h2>
<div class="servicios">

<figure>
  <img src="<%=UrlBuilder.builderUrlImgIndex(request,"dog.svg")%>" alt="paseos" width="120" height="140">
  <figcaption>Paseos</figcaption>
  <div>
    <p>Nuestros cuidadores pasearán a tus mascotas dónde y cuándo necesites.</p>
  </div>
</figure>
<figure>
  <img src="<%=UrlBuilder.builderUrlImgIndex(request,"visitas.svg")%>" alt="visitas a domicilio" width="120" height="140">
  <figcaption>Visitas a domicilio</figcaption>
   <div>
    <p>Nuestros cuidadores acudirán durante un breve tiempo a tu domicilio al día para velar por el bienestar de tus mascotas.</p>
  </div>
</figure>

<figure>
  <img src="<%=UrlBuilder.builderUrlImgIndex(request,"cuidados.svg")%>" alt="cuidados a domicilio" width="120" height="140">
  <figcaption>Cuidados a domicilio</figcaption>
  <div>
    <p>Nuestros cuidadores acudirán a tu hogar durante un tiempo prolongado al día para cuidar de tus mascotas.</p>
  </div>
</figure>

<figure>
  <img src="<%=UrlBuilder.builderUrlImgIndex(request,"guarderia.svg")%>" alt="guardería de día" width="120" height="140">
  <figcaption>Guardería de día</figcaption>
  <div>
    <p>Tus mascotas quedarán al cuidado de nuestros cuidores en sus domicilios durante un tiempo determinado al día.</p>
  </div>
</figure>
<figure>
  <img src="<%=UrlBuilder.builderUrlImgIndex(request,"animal-shelter.svg")%>" alt="alojamiento" width="120" height="140">
  <figcaption>Alojamiento</figcaption>
  <div>
    <p>Tus mascotas se alojarán en el domicilio de nuestros cuidadores durante los días que necesites.</p>
  </div>
</figure>

</div>

     <%@include file="/html/common/footer.jsp"%>