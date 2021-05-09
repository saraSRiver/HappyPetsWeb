
<%@ page import="com.happypets.aplicacion.model.*"%>
<%@ page import="com.happypets.web.utils.*"%>

<%@include file="/html/common/header.jsp"%>


    <div id="usuarioNull">
<h2>Nos consta que usted se ha dado de baja de nuestra aplicación, por lo tanto, ya no goza de sus beneficios
    como usuario de ella. 
</h2>
<h3 >Si desea volver a disfrutar de sus beneficios como usario, es bienvenido a hacerse una cuenta nueva.</h3>
<div id="null">
<img src="<%=UrlBuilder.builderUrlImgCommon(request,"usuarioNulo.svg")%>" id="nulo">
</div>
</div>

<%@include file="/html/common/footer.jsp"%>