package com.happypets.web.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.service.ClienteService;
import com.happypets.aplicacion.service.CuidadorService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.exceptions.IncorrectPasswordException;
import com.happypets.aplicacion.service.exceptions.UserNotFoundException;
import com.happypets.aplicacion.serviceImpl.ClienteServiceImpl;
import com.happypets.aplicacion.serviceImpl.CuidadorServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ContextsPath;
import com.happypets.web.utils.ErrorCodes;
import com.happypets.web.utils.Errors;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;
import com.happypets.web.utils.ViewsNames;


public class UsuarioServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(UsuarioServlet.class);
	private CuidadorService cuidServ;
	private ClienteService cliServ;

	public UsuarioServlet() {
		cuidServ= new CuidadorServiceImpl();
		cliServ= new ClienteServiceImpl();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		String action = request.getParameter(ActionNames.ACTION);
		String target=null;
		boolean redirect=false;
		Errors errors = new Errors();
		request.setAttribute(AttributeNames.ERRORS, errors);

		//comprobación de si el usuario es cliente o cuidador
		if(ActionNames.LOGIN.equalsIgnoreCase(action)) {
			String tipoUsuario= request.getParameter(ParameterNames.TIPO_USUARIO);
			//login de cuidador
			if(ActionNames.CUIDADOR.equalsIgnoreCase(tipoUsuario)) {
				String email = request.getParameter(ParameterNames.EMAIL);
				String password = request.getParameter(ParameterNames.PASSWORD);
				Cuidador cuidador = null;
				try {
					cuidador = cuidServ.login(email, password);
					SessionManager.set(request, AttributeNames.CUIDADOR, cuidador);

					target =ViewsNames.PERFIL_CUIDADOR;
					redirect = true;
				}	catch(UserNotFoundException | IncorrectPasswordException e) {
					logger.warn(e.getMessage(),e);
					errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
					request.setAttribute(AttributeNames.ERRORS, errors);
					target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
				}
				catch ( DataException e) {
					logger.warn(e.getMessage(),e);
					errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
					request.setAttribute(AttributeNames.ERRORS, errors);
					target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);

				}
			}
			//login de cliente
			else if(ActionNames.CLIENTE.equalsIgnoreCase(tipoUsuario)) {
				String email= request.getParameter(ParameterNames.EMAIL);
				String password= request.getParameter(ParameterNames.PASSWORD);
				Cliente cliente = null;

				try {
					cliente = cliServ.login(email, password);
					SessionManager.set(request, AttributeNames.CLIENTE, cliente);
					target = ViewsNames.PERFIL_CLIENTE;
					redirect = true;

				}	catch(UserNotFoundException | IncorrectPasswordException e) {
					logger.warn(e.getMessage(),e);
					errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
					request.setAttribute(AttributeNames.ERRORS, errors);
					target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
				}
				catch ( DataException e) {
					logger.warn(e.getMessage(),e);
					errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
					request.setAttribute(AttributeNames.ERRORS, errors);
					target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);

				}

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
