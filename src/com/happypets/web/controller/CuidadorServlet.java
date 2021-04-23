package com.happypets.web.controller;

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

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.ContratoDTO;
import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.model.DireccionDTO;
import com.happypets.aplicacion.model.Experiencia;
import com.happypets.aplicacion.model.Servicio;
import com.happypets.aplicacion.model.ServicioOfrecido;
import com.happypets.aplicacion.service.ContratoDTOService;
import com.happypets.aplicacion.service.CuidadorCriteria;
import com.happypets.aplicacion.service.CuidadorService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.IdiomaService;
import com.happypets.aplicacion.service.ServicioOfrecidoService;
import com.happypets.aplicacion.service.ServicioService;
import com.happypets.aplicacion.service.TipoEspecieService;
import com.happypets.aplicacion.service.exceptions.MailException;
import com.happypets.aplicacion.serviceImpl.ContratoDTOServiceImpl;
import com.happypets.aplicacion.serviceImpl.CuidadorServiceImpl;
import com.happypets.aplicacion.serviceImpl.IdiomaServiceImpl;
import com.happypets.aplicacion.serviceImpl.ServicioOfrecidoServiceImpl;
import com.happypets.aplicacion.serviceImpl.ServicioServiceImpl;
import com.happypets.aplicacion.serviceImpl.TipoEspecieServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ContextsPath;
import com.happypets.web.utils.MapPrint;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;
import com.happypets.web.utils.ViewsNames;

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
	private ContratoDTOService contrDTOServ;
	public CuidadorServlet() {
		cuidServ= new CuidadorServiceImpl();
		servOfrecido = new ServicioOfrecidoServiceImpl();
		servEspecie= new TipoEspecieServiceImpl();
		servIdioma= new IdiomaServiceImpl();
		servServicio = new ServicioServiceImpl();
		contrDTOServ= new ContratoDTOServiceImpl();
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
				target = ViewsNames.RESULTS;
				
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
				target  = ViewsNames.DETAIL;
				
			} catch (DataException e) {
				e.printStackTrace();
			}
		} 

		if(ActionNames.REGISTRO_CUIDADOR.equalsIgnoreCase(action)) {

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
			String experienciaCuid= request.getParameter(ParameterNames.EXPERIENCIA);
			String[]especies= request.getParameterValues(ParameterNames.ESPECIES);
			String []servicios= request.getParameterValues(ParameterNames.SERVICIOS);
			String []precio= request.getParameterValues(ParameterNames.PRECIO_SERVICIO);
			StringBuilder stringBuilder2 = new StringBuilder();
			stringBuilder2.append("registrando a ");
			stringBuilder2.append(nombre);

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
			
			cuidador.setDireccion(direccionDto);
			
			try {
				for(int i= 0; i< servicios.length; i++) {
					ServicioOfrecido servOfrecido = new ServicioOfrecido();
			
					Servicio servicio = servServicio.findById(Long.valueOf(servicios[i]), "es");
					servOfrecido.setPrecio(Double.valueOf(precio[i]));
					servOfrecido.setIdServicio(servicio.getIdServicio());
					servOfrecido.setNombreServicio(servicio.getNombreServicio());
					cuidador.add(servOfrecido);
				}
				for(String es: especies) {

					cuidador.add(servEspecie.findById(Long.valueOf(es),"es"));
				}
				for(String i : idiomas) {
					cuidador.add(servIdioma.findByid(i));
				}
				cuidServ.registro(cuidador);
				target = ContextsPath.MASCOTA_MES + "?" + ActionNames.ACTION + "=" + ActionNames.INDEX;
			} catch (DataException | MailException e) {
				logger.warn(e.getMessage(), e);
			}

		}
		else if(ActionNames.LOG_OUT.equalsIgnoreCase(action)) {
			SessionManager.remove(request, AttributeNames.CUIDADOR);
			target = ContextsPath.MASCOTA_MES + "?" + ActionNames.ACTION + "=" + ActionNames.INDEX;
			redirect = true;
			
		} else if (ActionNames.HISTORIAL_CUIDADOR.equalsIgnoreCase(action)){
			Cuidador cuidador  = (Cuidador)SessionManager.get(request, AttributeNames.CUIDADOR);
			List<ContratoDTO> contratos = null;
			try {
				contratos = contrDTOServ.findByIdCuidador(cuidador.getIdcuidador());
				request.setAttribute(AttributeNames.CONTRATOS, contratos);
				target = ViewsNames.HISTORIAL_CUIDADOR;
			} catch (DataException e) {

				e.printStackTrace();
			}
		}
		else if(ActionNames.ELIMINAR.equals(action)) {
			String idCuid= request.getParameter(ParameterNames.ID_CUIDADOR);
			try {
				cuidServ.baja(Long.valueOf(idCuid));
			} catch (DataException e) {
				e.printStackTrace();
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

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
