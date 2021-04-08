package com.jal.prueba.web;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.service.ClienteService;
import com.happypets.aplicacion.service.CuidadorService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.exceptions.IncorrectPasswordException;
import com.happypets.aplicacion.service.exceptions.MailException;
import com.happypets.aplicacion.service.exceptions.UserNotFoundException;
import com.happypets.aplicacion.serviceImpl.ClienteServiceImpl;
import com.happypets.aplicacion.serviceImpl.CuidadorServiceImpl;
import com.jal.prueba.utils.ActionNames;
import com.jal.prueba.utils.AttributeNames;
import com.jal.prueba.utils.ContextsPath;
import com.jal.prueba.utils.CookieManager;
import com.jal.prueba.utils.ErrorCodes;
import com.jal.prueba.utils.Errors;
import com.jal.prueba.utils.ParameterNames;
import com.jal.prueba.utils.SessionManager;
import com.jal.prueba.utils.UrlBuilder;
import com.jal.prueba.utils.ViewsNames;

/**
 * Servlet implementation class Usuario
 */
@WebServlet("/usuario")
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
				
				if (StringUtils.isEmpty(email)) {
					errors.addError(ParameterNames.EMAIL, ErrorCodes.PARAMETRO_OBLIGATORIO);
				} 
				// ... EMAIL VALIDO
				
				if (StringUtils.isEmpty(password)) {
					errors.addError(ParameterNames.PASSWORD, ErrorCodes.PARAMETRO_OBLIGATORIO);
				}

				
				if (errors.hasErrors()) {
					target = ViewsNames.LOGIN_USUARIO;					
				} else {
					Cuidador cuidador = null;
					try {
						cuidador = cuidServ.login(email, password);
						SessionManager.set(request, AttributeNames.CUIDADOR, cuidador);
						
						target =ViewsNames.PERFIL_CUIDADOR;
						redirect = true;
					} catch (UserNotFoundException | IncorrectPasswordException | DataException e) {

						e.printStackTrace();
					}
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
				} catch (MailException | UserNotFoundException | IncorrectPasswordException | DataException
						e) {

					e.printStackTrace();
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
