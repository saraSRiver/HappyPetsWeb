package com.jal.prueba.web;

import java.io.IOException;

import java.text.ParseException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.Contrato;
import com.happypets.aplicacion.service.ContratoService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.serviceImpl.ContratoServiceImpl;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;
import com.happypets.aplicacion.util.DBDataUtils;
import com.jal.prueba.utils.ActionNames;
import com.jal.prueba.utils.AttributeNames;
import com.jal.prueba.utils.ContextsPath;
import com.jal.prueba.utils.ParameterNames;
import com.jal.prueba.utils.SessionManager;
import com.jal.prueba.utils.UrlBuilder;
import com.jal.prueba.utils.ViewsNames;

/**
 * Servlet implementation class Contrato
 */
@WebServlet("/contrato")
public class ContratoServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(ContratoServlet.class);  
	private ContratoService contrServ;
	private MascotaService mascServ;
	public ContratoServlet() {
		contrServ= new ContratoServiceImpl();
		mascServ= new MascotaServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ActionNames.ACTION);
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		String target=null;
		boolean redirect=false;
		if (ActionNames.CONTRATAR.equalsIgnoreCase(action)) {
			Cliente cliente  = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
			String mascota=request.getParameter(ParameterNames.ID_MASCOTA);
			String servicio=request.getParameter(ParameterNames.SERVICIOS);
			String cuidador=request.getParameter(ParameterNames.ID_CUIDADOR);
			String fechaInicio=request.getParameter(ParameterNames.FECHA_INICIO);
			String fechaFin=request.getParameter(ParameterNames.FECHA_FIN);
			String promocion=request.getParameter(ParameterNames.PROMOCION);
			if (logger.isInfoEnabled()) {
				logger.info("Procesando tu solicitud");
			}
			Contrato contrato=	new Contrato();
			contrato.setIdCliente(cliente.getIdcliente());
			contrato.setIdCuidador(Long.valueOf(cuidador));
			contrato.setIdMascota(Long.valueOf(mascota));
			contrato.setIdServicio(Long.valueOf(servicio));
			try {
				contrato.setFechaInicio(DBDataUtils.formatDate(fechaInicio));
				contrato.setFechaFinal(DBDataUtils.formatDate(fechaFin));
			} catch (ParseException e1) {

				e1.printStackTrace();
			}
	
			contrato.setFechaContrato(new Date());
			contrato.setIdServicio(Long.valueOf(servicio));
			contrato.setIdEstado('P');


			try {
				contrServ.create(contrato);
				redirect = true;
				target=UrlBuilder.getUrlForController(request, ContextsPath.CONTRATO, ActionNames.HISTORIAL_CLIENTE);;
				
			} catch (DataException e) {

				e.printStackTrace();
			}
		}
		else if(ActionNames.HISTORIAL_CLIENTE.equals(action)){
			Cliente cliente= new Cliente();
			List<Contrato> contratos = null;
			try {
				contratos = contrServ.findByHistorialCliente(cliente.getIdcliente());
			} catch (DataException e) {

				e.printStackTrace();
			}
			request.setAttribute(AttributeNames.CONTRATOS, contratos);
			target = UrlBuilder.getUrlForController(request, ViewsNames.HISTORIAL_CLIENTE);
		}
		if(redirect) {
			logger.info("Redirect to..."+ target);
			response.sendRedirect( target);
		}else {
			logger.info("Forwading to..." + target);
			request.getRequestDispatcher(target).forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
