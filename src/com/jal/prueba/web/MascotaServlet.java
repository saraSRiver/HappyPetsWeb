package com.jal.prueba.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;

/**
 * Servlet implementation class PerfilMascota
 */
@WebServlet("/perfilMascota")
public class MascotaServlet extends HttpServlet {
    private MascotaService mascServ;
    public MascotaServlet() {
    	mascServ= new MascotaServiceImpl();
       
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if ("search".equalsIgnoreCase(action)) {
			
		
		}
		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		doGet(request, response);
	}

}
