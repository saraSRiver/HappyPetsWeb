package com.jal.prueba.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.model.Direccion;
import com.happypets.aplicacion.model.DireccionDTO;
import com.happypets.aplicacion.model.Experiencia;
import com.happypets.aplicacion.service.CuidadorCriteria;
import com.happypets.aplicacion.service.CuidadorService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.IdiomaService;
import com.happypets.aplicacion.service.ServicioOfrecidoService;
import com.happypets.aplicacion.service.ServicioService;
import com.happypets.aplicacion.service.TipoEspecieService;
import com.happypets.aplicacion.service.exceptions.ServiceException;
import com.happypets.aplicacion.serviceImpl.CuidadorServiceImpl;
import com.happypets.aplicacion.serviceImpl.IdiomaServiceImpl;
import com.happypets.aplicacion.serviceImpl.ServicioOfrecidoServiceImpl;
import com.happypets.aplicacion.serviceImpl.TipoEspecieServiceImpl;
import com.jal.prueba.utils.ActionNames;
import com.jal.prueba.utils.AttributeNames;
import com.jal.prueba.utils.ParameterNames;
import com.jal.prueba.utils.SessionManager;
import com.jal.prueba.utils.UrlBuilder;
import com.jal.prueba.utils.ViewsNames;

/**
 * Servlet de cuidador
 */
@WebServlet("/cuidador")
public class CuidadorServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(CuidadorServlet.class);
	private CuidadorService cuidServ;
	private IdiomaService servIdioma=null;
	private ServicioService servServicio=null;
	private ServicioOfrecidoService servOfrecido = null;
	private TipoEspecieService servEspecie=null;

	public CuidadorServlet() {
		cuidServ= new CuidadorServiceImpl();
		servOfrecido = new ServicioOfrecidoServiceImpl();
		servEspecie= new TipoEspecieServiceImpl();
		servIdioma= new IdiomaServiceImpl();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, DataException {
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		String action = request.getParameter(ParameterNames.ACTION);

		if (ActionNames.CUIDADOR_BUSCAR.equalsIgnoreCase(action)) {
			String poblacion = request.getParameter(ParameterNames.POBLACION);
			String idiomas= request.getParameter(ParameterNames.IDIOMAS);
			String experiencia=request.getParameter(ParameterNames.EXPERIENCIA);
			String especies=request.getParameter(ParameterNames.ESPECIES);
			String servicios=request.getParameter(ParameterNames.SERVICIOS);
			String precioDesde=request.getParameter(ParameterNames.PRECIO_DESDE);
			String precioHasta=request.getParameter(ParameterNames.PRECIO_HASTA);
			if (logger.isInfoEnabled()) {
				logger.info("Buscando cuidadores");
			}


			CuidadorCriteria criteria = new CuidadorCriteria();
			criteria.setIdTipoEspecie(Long.valueOf(especies));
			criteria.setIdExperiencia(Integer.valueOf(experiencia));
			criteria.setIdIdioma(idiomas);
			criteria.setIdPoblacion(Long.valueOf(poblacion));
			criteria.setIdServicio(Long.valueOf(servicios));
			criteria.setPrecioDesde(Double.valueOf(precioDesde));
			criteria.setPrecioHasta(Double.valueOf(precioHasta));

			try {
				List<Cuidador>cuidadores= new ArrayList();
				cuidadores=cuidServ.findByCriteria(criteria);

				request.setAttribute(AttributeNames.CUIDADOR,cuidadores);

				request.getRequestDispatcher(ViewsNames.RESULTS)
				.forward(request, response);
			} catch (DataException e) {
				e.printStackTrace();
			}
		}
		else if(ActionNames.CUIDADOR_DETAIL.equalsIgnoreCase(action)){

			String idCuidador=	request.getParameter(ParameterNames.ID_CUIDADOR);
			Long id  = Long.valueOf(idCuidador);
			try {
				Cuidador cuidador=cuidServ.findById(id);
				request.setAttribute(AttributeNames.CUIDADOR,cuidador);
				request.getRequestDispatcher(ViewsNames.DETAIL)
				.forward(request, response);

			} catch (DataException e) {
				e.printStackTrace();
			}
		} 

		if(ActionNames.REGISTRO_CUIDADOR.equalsIgnoreCase(action)) {
			String target=null;
			boolean redirect=false;
			String nombre=request.getParameter("nombre");
			String apellidos=request.getParameter("apellidos");
			String password= request.getParameter("password");
			String repPassword= request.getParameter("repPassword");
			String email= request.getParameter("email");
			String repEmail= request.getParameter("repEmail");
			String telefono= request.getParameter("telefono");
			String piso= request.getParameter("piso");
			String portal= request.getParameter("nVivienda/portal");
			String calle= request.getParameter("calle");
			String cp=request.getParameter("CP");
			String poblacion= request.getParameter("poblacion");
			String provincia= request.getParameter("provincia");
			String []idiomas= request.getParameterValues("idiomas");
			String experienciaCuid= request.getParameter("experiencia");
			String[]especies= request.getParameterValues("especies");
			String []servicios= request.getParameterValues("servicios");
			String precio= request.getParameter("precio");
			StringBuilder stringBuilder2 = new StringBuilder();
			stringBuilder2.append("registrando a ");
			stringBuilder2.append(nombre);
			System.out.println(stringBuilder2.toString());

			Cuidador cuidador = new Cuidador();
			cuidador.setNombre(nombre);
			cuidador.setApellidos(apellidos);
			cuidador.setEmail(email);
			cuidador.setEmail(repEmail);
			cuidador.setPassword(password);
			cuidador.setPassword(repPassword);
			cuidador.setTelefono(telefono);
			Experiencia experiencia= new Experiencia();
			experiencia.setIdExperiencia(Integer.valueOf(experienciaCuid));
			cuidador.setExperiencia(experiencia);
			DireccionDTO direccionDto= new DireccionDTO();
			direccionDto.setCalle(calle);
			direccionDto.setPortal(Integer.valueOf(portal));
			direccionDto.setCp(Integer.valueOf(cp));
			direccionDto.setPiso(Integer.valueOf(piso));
			direccionDto.setIdPoblacion(Long.valueOf(poblacion));
			direccionDto.setIdProvincia(Long.valueOf(provincia));
			direccionDto.setIdpais(1L);
			direccionDto.setNombrePais("España");
			cuidador.setDireccion(direccionDto);

			try {
				for(String es: especies) {
					for(String i : idiomas) {
						cuidador.add(servEspecie.findById(Long.valueOf(es),i));
					}
				}
			} catch (DataException e) {
				e.printStackTrace();
			}

			try {
				for(String i : idiomas) {
					cuidador.add(servIdioma.findByid(i));
				}
			} catch (DataException e) {
				e.printStackTrace();
			}
			try {
				for (String i: servicios) {
					cuidador.add(servServicio.findById(cuidador.getIdcuidador(), precio));
				}
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
