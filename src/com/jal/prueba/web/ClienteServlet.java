package com.jal.prueba.web;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
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
import com.happypets.aplicacion.serviceImpl.ClienteServiceImpl;
import com.happypets.aplicacion.serviceImpl.IdiomaServiceImpl;
import com.jal.prueba.utils.ActionNames;
import com.jal.prueba.utils.AttributeNames;
import com.jal.prueba.utils.ContextsPath;
import com.jal.prueba.utils.ParameterNames;
import com.jal.prueba.utils.SessionManager;
import com.jal.prueba.utils.UrlBuilder;

/**
 * Servlet implementation class Cliente
 */
@WebServlet("/cliente")
public class ClienteServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(ClienteServlet.class);
	private ClienteService cliServ;
	private IdiomaService servIdioma;
	public ClienteServlet() {
		cliServ= new ClienteServiceImpl();		
		servIdioma= new IdiomaServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		String action = request.getParameter(ParameterNames.ACTION);
		if(ActionNames.REGISTRO_CLIENTE.equalsIgnoreCase(action)) {
			String target=null;
			boolean redirect=false;
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
				e.printStackTrace();
			}
			try {
				cliente = cliServ.registro(cliente);
				SessionManager.set(request, AttributeNames.CLIENTE,cliente);
				target =ContextsPath.SEARCH_CUIDADOR;
				redirect = true;
			}catch (DataException e) {
				e.printStackTrace();
			}
			if(redirect) {
				logger.info("Redirect to..."+ target);
				response.sendRedirect(UrlBuilder.builderUrlForm(request, target));
			}else {
				logger.info("Forwading to..." + target);
				request.getRequestDispatcher(target).forward(request, response);
			}
		}
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
