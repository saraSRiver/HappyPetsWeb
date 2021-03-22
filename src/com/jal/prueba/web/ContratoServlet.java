package com.jal.prueba.web;

import java.io.IOException;
import java.lang.ProcessBuilder.Redirect;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Contrato;
import com.happypets.aplicacion.service.ContratoService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.serviceImpl.ContratoServiceImpl;
import com.jal.prueba.utils.ActionNames;
import com.jal.prueba.utils.ParameterNames;
import com.jal.prueba.utils.UrlBuilder;
import com.jal.prueba.utils.ViewsNames;

/**
 * Servlet implementation class Contrato
 */
@WebServlet("/Contrato")
public class ContratoServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(ContratoServlet.class);  
	private ContratoService contrServ;

	public ContratoServlet() {
		contrServ= new ContratoServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ParameterNames.ACTION2);
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		if (ActionNames.CONTRATAR.equalsIgnoreCase(action)) {
			String mascota=request.getParameter(ParameterNames.ID_MASCOTA);
			String especie=request.getParameter(ParameterNames.ESPECIES2);
			String servicio=request.getParameter(ParameterNames.SERVICIOS2);
			String cuidador=request.getParameter(ParameterNames.ID_CUIDADOR);
			String cliente=request.getParameter(ParameterNames.ID_CLIENTE);
			String fechaInicio=request.getParameter(ParameterNames.FECHA_INICIO);
			String fechaFin=request.getParameter(ParameterNames.FECHA_FIN);
			String horas=request.getParameter(ParameterNames.HORAS);
			String poblacion=request.getParameter(ParameterNames.POBLACION2);
			String provincia=request.getParameter(ParameterNames.PROVINCIA);
			String precioFinal=request.getParameter(ParameterNames.PRECIO_FINAL);
			if (logger.isInfoEnabled()) {
				logger.info("Procesando su solicitud");
			}
			Contrato contrato=	new Contrato();
			contrato.setIdCliente(Long.valueOf(cliente));
			contrato.setIdCuidador(Long.valueOf(cuidador));
			contrato.setIdMascota(Long.valueOf(mascota));
			contrato.setIdServicio(Long.valueOf(servicio));
			contrato.setFechaInicio(Date.valueOf(fechaInicio));
			contrato.setFechaFinal(Date.valueOf(fechaFin));
			
			contrato.setIdEstado('P');
			contrato.setPrecioFinal(Double.valueOf(precioFinal));
		
			try {
				contrServ.create(contrato);
			} catch (DataException e) {
				
				e.printStackTrace();
			}
			if(contrato==null) {
				Redirect.(UrlBuilder.builderUrlForm(request, "/html/"+ViewsNames.INDEX));
	
			}
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
