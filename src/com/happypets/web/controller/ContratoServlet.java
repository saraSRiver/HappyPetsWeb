package com.happypets.web.controller;

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
import com.happypets.aplicacion.model.ContratoDTO;
import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.service.ContratoDTOService;
import com.happypets.aplicacion.service.ContratoService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.serviceImpl.ContratoDTOServiceImpl;
import com.happypets.aplicacion.serviceImpl.ContratoServiceImpl;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;
import com.happypets.aplicacion.util.DBDataUtils;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ContextsPath;
import com.happypets.web.utils.ErrorCodes;
import com.happypets.web.utils.Errors;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;
import com.happypets.web.utils.ViewsNames;

/**
 * Servlet implementation class Contrato
 */
@WebServlet("/contrato")
public class ContratoServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(ContratoServlet.class);  
	private ContratoService contrServ;
	private MascotaService mascServ;
	private ContratoDTOService contrDTOServ;

	public ContratoServlet() {
		contrServ= new ContratoServiceImpl();
		mascServ= new MascotaServiceImpl();
		contrDTOServ= new ContratoDTOServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter(ActionNames.ACTION);
		
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		Cliente cliente  = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
		Cuidador cuid=(Cuidador)SessionManager.get(request, AttributeNames.CUIDADOR);
		String target=null;
		boolean redirect=false;
		Errors errors = new Errors();
		request.setAttribute(AttributeNames.ERRORS, errors);
		if (ActionNames.CONTRATAR.equalsIgnoreCase(action)) {

			String mascota=request.getParameter(ParameterNames.ID_MASCOTA);
			String servicio=request.getParameter(ParameterNames.SERVICIOS);
			String cuidador=request.getParameter(ParameterNames.ID_CUIDADOR);
			String fechaInicio=request.getParameter(ParameterNames.FECHA_INICIO);
			String fechaFin=request.getParameter(ParameterNames.FECHA_FIN);

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
				logger.warn(e1.getMessage(),e1);
			}
			contrato.setFechaContrato(new Date());
			contrato.setIdServicio(Long.valueOf(servicio));
			contrato.setIdEstado('P');

			try {
				contrServ.create(contrato);
				redirect = true;
				target=UrlBuilder.getUrlForController(request, ContextsPath.CONTRATO, ActionNames.HISTORIAL_CLIENTE);

			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			}
		}
		else if(ActionNames.HISTORIAL_CLIENTE.equalsIgnoreCase(action)){

			List<ContratoDTO> contratos = null;
			try {
				contratos = contrDTOServ.findByIdCliente(cliente.getIdcliente());
				request.setAttribute(AttributeNames.CONTRATOS, contratos);
				target = ViewsNames.HISTORIAL_CLIENTE;
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			}

		}
		else if(ActionNames.DETAIL.equalsIgnoreCase(action)){

			String idContrato= request.getParameter(ParameterNames.ID_CONTRATO);
			Long id  = Long.valueOf(idContrato);
			try {
				 Contrato contrato=contrServ.findByid(Long.valueOf(id));
				request.setAttribute(AttributeNames.CONTRATO, contrato);
				target = ViewsNames.CONTRATO_DETAIL;
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			}

		}
		else if(ActionNames.CANCELAR.equals(action)) {
			try {
				Contrato co= new Contrato();
				contrServ.updateEstado(co.getIdContrato(), 'R');
			} catch (NumberFormatException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			}

		}
	
		else if(ActionNames.HISTORIAL_CUIDADOR.equals(action)) {
			List<ContratoDTO> contratosCuidador = null;

			try {
				contratosCuidador = contrDTOServ.findByIdCuidador(cuid.getIdcuidador());
				request.setAttribute(AttributeNames.CONTRATOS, contratosCuidador);
				target = ViewsNames.HISTORIAL_CUIDADOR;
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = ViewsNames.INDEX;
			}
		}
		else if(ActionNames.ELIMINAR.equals(action)) {
			String idContrato= request.getParameter(ParameterNames.ID_CONTRATO);
			
				try {
					contrServ.updateEstado(Long.valueOf(idContrato), 'R');
				} catch (DataException e) {
					logger.warn(e.getMessage(),e);
					errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
					request.setAttribute(AttributeNames.ERRORS, errors);
					target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
				}
				target = ViewsNames.HISTORIAL_CLIENTE;
		}
		else if(ActionNames.ELIMINAR.equals(action)) {
			String idContrato= request.getParameter(ParameterNames.ID_CONTRATO);
			
				try {
					contrServ.updateEstado(Long.valueOf(idContrato), 'R');
				} catch (DataException e) {
					logger.warn(e.getMessage(),e);
					errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
					request.setAttribute(AttributeNames.ERRORS, errors);
					target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
				}
				target = ViewsNames.HISTORIAL_CUIDADOR;
		}
		else if(ActionNames.ACEPTAR.equals(action)) {
			String idContrato= request.getParameter(ParameterNames.ID_CONTRATO);
			try {
				contrServ.updateEstado(Long.valueOf(idContrato),  'A');
			} catch (NumberFormatException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			}
			target = ViewsNames.HISTORIAL_CUIDADOR;
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
