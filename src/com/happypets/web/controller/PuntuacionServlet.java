package com.happypets.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

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
import com.happypets.web.utils.MapPrint;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.ViewsNames;

/**
 * Servlet implementation class PuntuacionServlet
 */
@WebServlet("/Puntuacion")
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
		if (ActionNames.CUIDADOR_BUSCAR.equalsIgnoreCase(action)) {
			String idCuidador = request.getParameter(ParameterNames.ID_CUIDADOR);
			if(idCuidador!=null){
				Long id=Long.valueOf(idCuidador);
				try {
					Double mediaCuidador=puntServ.findByMedia(id);
					request.setAttribute(AttributeNames.PUNTUACION, mediaCuidador);
					target=ViewsNames.PUNTUACION_CUIDADOR;
				} catch (DataException e) {
					e.printStackTrace();
				}
			}
		}
		else if(ActionNames.PUNTUAR_CUIDADOR.equalsIgnoreCase(action)) {
			String puntuacion=request.getParameter(ParameterNames.PUNTOS);
			String idCuidador = request.getParameter(ParameterNames.ID_CUIDADOR);
			String idCliente = request.getParameter(ParameterNames.ID_CLIENTE);
			String comentario = request.getParameter(ParameterNames.COMENTARIO);
			if(idCliente!=null){
				Puntuacion punt= new Puntuacion();
				
				try {
					punt.setIdCliente(Long.valueOf(idCliente));
					punt.setIdCuidador(Long.valueOf(idCuidador));
					punt.setPuntuacion(Integer.valueOf(puntuacion));
					punt.setComentario(comentario);
					puntServ.create(punt);
					target=ViewsNames.BUSQUEDA_CUIDADORES;
				} catch (DataException e) {
					e.printStackTrace();
				}
			}
		}
		else if(ActionNames.ACTUALIZAR_PUNTUACION.equalsIgnoreCase(action)) {
			String puntuacion=request.getParameter(ParameterNames.PUNTOS);
			String idCliente = request.getParameter(ParameterNames.ID_CLIENTE);
			String comentario = request.getParameter(ParameterNames.COMENTARIO);
			if(idCliente!=null){
				Puntuacion punt= new Puntuacion();
				
				try {
					punt.setPuntuacion(Integer.valueOf(puntuacion));
					punt.setComentario(comentario);
					puntServ.update(punt);
					target=ViewsNames.BUSQUEDA_CUIDADORES;
				} catch (DataException e) {
					e.printStackTrace();
				}
			}
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
