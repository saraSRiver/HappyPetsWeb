package com.happypets.web.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.DireccionDTO;
import com.happypets.aplicacion.service.ClienteService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.IdiomaService;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.service.exceptions.IncorrectPasswordException;
import com.happypets.aplicacion.serviceImpl.ClienteServiceImpl;
import com.happypets.aplicacion.serviceImpl.IdiomaServiceImpl;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ContextsPath;
import com.happypets.web.utils.ErrorCodes;
import com.happypets.web.utils.Errors;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.PasswordEncryptor;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;
import com.happypets.web.utils.ViewsNames;

public class ClienteServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(ClienteServlet.class);
	private ClienteService cliServ;
	private IdiomaService servIdioma;
	private MascotaService servMasc;
	public ClienteServlet() {
		cliServ= new ClienteServiceImpl();		
		servIdioma= new IdiomaServiceImpl();
		servMasc= new MascotaServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		
		String target=null;
		boolean redirect=false;
		String action = request.getParameter(ActionNames.ACTION);
		Errors errors = new Errors();
		request.setAttribute(AttributeNames.ERRORS, errors);
		Cliente c = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
		if(ActionNames.REGISTRO_CLIENTE.equalsIgnoreCase(action)) {

			String nombre=request.getParameter(ParameterNames.NOMBRE);
			String apellidos=request.getParameter(ParameterNames.APELLIDOS);
			String password= request.getParameter(ParameterNames.PASSWORD);
			String repPassword= request.getParameter(ParameterNames.REP_PASSWORD);
			String email= request.getParameter(ParameterNames.EMAIL);
			String repEmail= request.getParameter(ParameterNames.REP_EMAIL);
			String telefono= request.getParameter(ParameterNames.TELEFONO);
			String piso= request.getParameter(ParameterNames.PISO);
			String portal= request.getParameter(ParameterNames.PORTAL);
			String calle= request.getParameter(ParameterNames.CALLE);
			String cp=request.getParameter(ParameterNames.CP);
			String poblacion= request.getParameter(ParameterNames.POBLACION);
			String provincia= request.getParameter(ParameterNames.PROVINCIA);
			String []idiomas= request.getParameterValues(ParameterNames.IDIOMAS);

			Cliente cliente= new Cliente();
			cliente.setNombre(nombre);
			cliente.setApellidos(apellidos);
			cliente.setPassword(password);
			cliente.setPassword(repPassword);
			cliente.setEmail(email);
			cliente.setEmail(repEmail);
			cliente.setTelefono(telefono);
			cliente.setEstadoPromocion(false);
			DireccionDTO direccionDto= new DireccionDTO();
			direccionDto.setCalle(calle);
			direccionDto.setPortal(Integer.valueOf(portal));
			direccionDto.setCp(Integer.valueOf(cp));
			direccionDto.setPiso(Integer.valueOf(piso));
			direccionDto.setIdPoblacion(Long.valueOf(poblacion));
			direccionDto.setIdProvincia(Long.valueOf(provincia));
			direccionDto.setIdpais(1L);
			direccionDto.setNombrePais("España");
			cliente.setDireccion(direccionDto);
			try {
				for(String i : idiomas) {
					cliente.add(servIdioma.findByid(i));
				}
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			
			}
			try {
				cliente = cliServ.registro(cliente);
				SessionManager.set(request, AttributeNames.CLIENTE,cliente);
				target = ViewsNames.PERFIL_CLIENTE;
				redirect = true;
			}catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
			
			}

			if(ActionNames.PERFIL_CLIENTE.equalsIgnoreCase(action)) {
				target = ViewsNames.PERFIL_CLIENTE;
				redirect = true;
			}
		}
		else if(ActionNames.LOG_OUT.equalsIgnoreCase(action)) {
			SessionManager.remove(request, AttributeNames.CLIENTE);
			target = ContextsPath.MASCOTA_MES + "?" + ActionNames.ACTION + "=" + ActionNames.INDEX;
			redirect = true;
		}
		else if(ActionNames.EDIT_PERFIL_CLIENTE.equalsIgnoreCase(action)) {
			String nombre=request.getParameter(ParameterNames.NOMBRE);
			String apellidos=request.getParameter(ParameterNames.APELLIDOS);
			String passwordActual= request.getParameter(ParameterNames.PASSWORD);
			String repPassword= request.getParameter(ParameterNames.REP_PASSWORD);
			String email= request.getParameter(ParameterNames.EMAIL);
			String repEmail= request.getParameter(ParameterNames.REP_EMAIL);
			String telefono= request.getParameter(ParameterNames.TELEFONO);
			String piso= request.getParameter(ParameterNames.PISO);
			String portal= request.getParameter(ParameterNames.PORTAL);
			String calle= request.getParameter(ParameterNames.CALLE);
			String cp=request.getParameter(ParameterNames.CP);
			String poblacion= request.getParameter(ParameterNames.POBLACION);
			String provincia= request.getParameter(ParameterNames.PROVINCIA);
			String []idiomas= request.getParameterValues(ParameterNames.IDIOMAS);
			if (logger.isInfoEnabled()) {
				logger.info("Actualizando perfil del cliente");
			}
			Cliente clienteActual= new Cliente();
			String newPassword = request.getParameter(ParameterNames.NEW_PASSWORD); 
			clienteActual.setNombre(nombre);
			clienteActual.setApellidos(apellidos);
			clienteActual.setPassword(passwordActual);
			clienteActual.setPassword(repPassword);
			clienteActual.setEmail(email);
			clienteActual.setEmail(repEmail);
			clienteActual.setTelefono(telefono);
			clienteActual.setEstadoPromocion(false);
			DireccionDTO direccionDto= new DireccionDTO();
			direccionDto.setCalle(calle);
			direccionDto.setPortal(Integer.valueOf(portal));
			direccionDto.setCp(Integer.valueOf(cp));
			direccionDto.setPiso(Integer.valueOf(piso));
			direccionDto.setIdPoblacion(Long.valueOf(poblacion));
			direccionDto.setIdProvincia(Long.valueOf(provincia));
			direccionDto.setIdpais(1L);
			direccionDto.setNombrePais("España");
			direccionDto.setIdcliente(c.getIdcliente());
			clienteActual.setDireccion(direccionDto);
			clienteActual.setIdcliente(c.getIdcliente());
			try {
				for(String i : idiomas) {
					clienteActual.add(servIdioma.findByid(i));
				}
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
				errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
				request.setAttribute(AttributeNames.ERRORS, errors);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
				
			}

			if(newPassword.equals(repPassword)) {
				if(PasswordEncryptor.checkPassword(passwordActual, c.getPassword())) {
					clienteActual.setIdcliente(c.getIdcliente());
					clienteActual.setPassword(newPassword);

					try {
						Cliente cl;
						cl = cliServ.update(clienteActual);
						SessionManager.set(request, AttributeNames.CLIENTE,cl);
						target = ViewsNames.PERFIL_CLIENTE;
						redirect = true;
					} catch (IncorrectPasswordException e) {
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
			}
		}
			else if(ActionNames.ELIMINAR.equals(action)) {
				String idCli= request.getParameter(ParameterNames.ID_CLIENTE);
				try {
					cliServ.baja(Long.valueOf(idCli));
				} catch (DataException e) {
					logger.warn(e.getMessage(),e);
					errors.addError(ActionNames.LOGIN, ErrorCodes.ERROR_GENERIC);
					request.setAttribute(AttributeNames.ERRORS, errors);
					target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA_MES, ActionNames.INDEX, false);
				
				}
				target = ContextsPath.MASCOTA_MES + "?" + ActionNames.ACTION + "=" + ActionNames.INDEX;
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
