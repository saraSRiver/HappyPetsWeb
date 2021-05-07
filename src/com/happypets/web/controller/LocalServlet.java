package com.happypets.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.happypets.aplicacion.model.Poblacion;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.PoblacionService;
import com.happypets.aplicacion.serviceImpl.PoblacionServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.ParameterNames;


public class LocalServlet extends HttpServlet {

	private PoblacionService poblacionService = null;
       
  
    public LocalServlet() {
  
       poblacionService = new PoblacionServiceImpl();
      
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ActionNames.ACTION);
		
		
		 if(ActionNames.POBLACION.equals(action)) {
			String provincia = request.getParameter(ParameterNames.PROVINCIA);
			List<Poblacion> poblaciones;
			try {
				poblaciones = poblacionService.findByProvincia(Long.valueOf(provincia));
		
			Gson gson = new Gson();
			response.setContentType("application/json; charset=ISO-8859-1");
			response.getOutputStream().write(gson.toJson(poblaciones).getBytes());
			} catch ( DataException e) {
	
				e.printStackTrace();
			}
		}
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		doGet(request, response);
	}

}
