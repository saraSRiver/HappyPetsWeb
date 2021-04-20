<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="com.happypets.aplicacion.model.*" %>
        <%@ page import="com.happypets.web.utils.*" %>
    <%@include file="/html/common/header.jsp"%>
    
    <%
    Cliente cl= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
    %>
    
    
    
    
       <%@include file="/html/common/footer.jsp"%>