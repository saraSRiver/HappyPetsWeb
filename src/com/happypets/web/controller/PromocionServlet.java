package com.happypets.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.service.PromocionService;
import com.happypets.aplicacion.serviceImpl.PromocionServiceImpl;
import com.happypets.web.utils.ActionNames;

/**
 * Servlet implementation class PromocionServlet
 */
@WebServlet("/promocion")
public class PromocionServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(PromocionServlet.class);  
    private PromocionService promServ;   
	
    public PromocionServlet() {
    	promServ=new PromocionServiceImpl();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String action = request.getParameter(ActionNames.ACTION);
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		if (ActionNames.CONTRATAR.equalsIgnoreCase(action)) {
			
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		doGet(request, response);
	}

}
