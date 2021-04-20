package com.happypets.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Mascota;
import com.happypets.aplicacion.service.ClienteService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.MapPrint;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.ViewsNames;

/**
 * Servlet implementation class MascotaMesIndex
 */
@WebServlet("/mascotaMesIndex")
public class MascotaMesIndexServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(MascotaMesIndexServlet.class);
	private MascotaService mascServ;
	private ClienteService client;

	public MascotaMesIndexServlet() {
		mascServ= new MascotaServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()) {
			logger.debug(MapPrint.print(request.getParameterMap()));
		}
		String action = request.getParameter(ActionNames.ACTION);
		if(action == null) {
			action = ActionNames.INDEX;
		}
		if( ActionNames.INDEX.equalsIgnoreCase(action)) {
		
			Mascota mascota= new Mascota();
			try {
				mascota = mascServ.findByPromocion(6);
				request.setAttribute(AttributeNames.MASCOTA,mascota);
				
				request.getRequestDispatcher(ViewsNames.INDEX).forward(request, response);
			} catch ( DataException e) {

				e.printStackTrace();
			}

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
