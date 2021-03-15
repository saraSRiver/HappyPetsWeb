package com.jal.prueba.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.happypets.aplicacion.model.Mascota;
import com.happypets.aplicacion.service.ClienteService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;

/**
 * Servlet implementation class MascotaMesIndex
 */
@WebServlet("/mascotaMesIndex")
public class MascotaMesIndex extends HttpServlet {
	private MascotaService mascServ;
	private ClienteService client;
	public MascotaMesIndex() {
		mascServ= new MascotaServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		if("index".equalsIgnoreCase(action)) {
			String fotoMascota= request.getParameter("mascota");
			Mascota mascota= new Mascota();
			try {
				mascota = mascServ.findById(Long.valueOf(fotoMascota));
				request.setAttribute("mascota",mascota);
				request.getRequestDispatcher("/html/index.jsp").forward(request, response);
			} catch (NumberFormatException | DataException e) {

				e.printStackTrace();
			}

		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
