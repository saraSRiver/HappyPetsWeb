package com.happypets.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.model.Puntuacion;
import com.happypets.aplicacion.service.ClienteService;
import com.happypets.aplicacion.service.CuidadorService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.PuntuacionService;
import com.happypets.aplicacion.serviceImpl.ClienteServiceImpl;
import com.happypets.aplicacion.serviceImpl.CuidadorServiceImpl;
import com.happypets.aplicacion.serviceImpl.PuntuacionServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ContextsPath;
import com.happypets.web.utils.MapPrint;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;
import com.happypets.web.utils.ViewsNames;

/**
 * Servlet implementation class PuntuacionServlet
 */
@WebServlet("/puntuacion")
public class PuntuacionServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(PuntuacionServlet.class);
	private ClienteService cliServ;
	private CuidadorService cuidServ;
	private PuntuacionService puntServ;

	public PuntuacionServlet() {

		cliServ= new ClienteServiceImpl();
		cuidServ= new CuidadorServiceImpl();
		puntServ= new PuntuacionServiceImpl();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if(logger.isDebugEnabled()) {
			logger.debug(MapPrint.print(request.getParameterMap()));

		}
		String action = request.getParameter(ActionNames.ACTION);
		String target=null;
		boolean redirect=false;
		Cliente cliente = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
	
		 if(ActionNames.PUNTUAR_CUIDADOR.equalsIgnoreCase(action)) {
			String puntuacion=request.getParameter(ParameterNames.PUNTOS);
			String idCuidador = request.getParameter(ParameterNames.ID_CUIDADOR);
			String comentario = request.getParameter(ParameterNames.COMENTARIO);
			Puntuacion punt= new Puntuacion();
			try {
				punt.setIdCliente(cliente.getIdcliente());
				punt.setIdCuidador(Long.valueOf(idCuidador));
				punt.setPuntuacion(Double.valueOf(puntuacion));
				punt.setComentario(comentario);
				puntServ.create(punt);
				target=UrlBuilder.getUrlForController(request, ContextsPath.PUNTUACION, 
						ActionNames.CUIDADORES_PUNTUADOS, redirect);
			} catch (DataException e) {
				e.printStackTrace();
			}
		}
		else if(ActionNames.ACTUALIZAR_PUNTUACION.equalsIgnoreCase(action)) {
			String puntuacion=request.getParameter(ParameterNames.PUNTOS);
			String comentario = request.getParameter(ParameterNames.COMENTARIO);
			String cuidador = request.getParameter(ParameterNames.ID_CUIDADOR);
			Puntuacion punt= new Puntuacion();

			try {
				punt.setPuntuacion(Double.valueOf(puntuacion));
				punt.setComentario(comentario);
				punt.setIdCliente(cliente.getIdcliente());
				punt.setIdCuidador(Long.valueOf(cuidador));

				puntServ.update(punt);
				target=UrlBuilder.getUrlForController(request, ContextsPath.PUNTUACION, 
						ActionNames.CUIDADORES_PUNTUADOS, redirect);
			} catch (DataException e) {
				e.printStackTrace();
			}
		}
		else if(ActionNames.CUIDADORES_PUNTUADOS.equalsIgnoreCase(action)) {
			String idCuidador = request.getParameter(ParameterNames.ID_CUIDADOR);
			try {
				Long cuidador = Long.valueOf(idCuidador);
				Cuidador cuid = cuidServ.findById(cuidador);
				Puntuacion punt = puntServ.findPuntuacion(cliente.getIdcliente(), cuidador);

				request.setAttribute(AttributeNames.CUIDADOR, cuid);
				request.setAttribute(AttributeNames.PUNTUACION, punt);
				target = ViewsNames.PUNTUACION_CUIDADOR;
			} catch ( DataException e) {
				e.printStackTrace();
			}
		}
		if(redirect) {
			logger.info("Redirect to..."+ target);
			response.sendRedirect(UrlBuilder.builderUrlForm(request, target));
		}else {
			logger.info("Forwading to..." + target);
			request.getRequestDispatcher(target).forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
