package com.happypets.web.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.model.Experiencia;
import com.happypets.aplicacion.model.Idioma;
import com.happypets.aplicacion.model.Mascota;
import com.happypets.aplicacion.model.Poblacion;
import com.happypets.aplicacion.model.Provincia;
import com.happypets.aplicacion.model.Servicio;
import com.happypets.aplicacion.model.TipoEspecie;
import com.happypets.aplicacion.service.ClienteService;
import com.happypets.aplicacion.service.CuidadorService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.ExperienciaService;
import com.happypets.aplicacion.service.IdiomaService;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.service.PoblacionService;
import com.happypets.aplicacion.service.ProvinciaService;
import com.happypets.aplicacion.service.ServicioService;
import com.happypets.aplicacion.service.TipoEspecieService;
import com.happypets.aplicacion.serviceImpl.ClienteServiceImpl;
import com.happypets.aplicacion.serviceImpl.CuidadorServiceImpl;
import com.happypets.aplicacion.serviceImpl.ExperienciaServiceImpl;
import com.happypets.aplicacion.serviceImpl.IdiomaServiceImpl;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;
import com.happypets.aplicacion.serviceImpl.PoblacionServiceImpl;
import com.happypets.aplicacion.serviceImpl.ProvinciaServiceImpl;
import com.happypets.aplicacion.serviceImpl.ServicioServiceImpl;
import com.happypets.aplicacion.serviceImpl.TipoEspecieServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;
import com.happypets.web.utils.ViewsNames;

/**
 * Servlet implementation class Precreate
 */
@WebServlet("/precreate")
public class PrecreateServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(PrecreateServlet.class);
	private ServicioService servicioService;
	private PoblacionService poblacionService;
	private ExperienciaService experienciaService;
	private IdiomaService idiomaService;
	private TipoEspecieService tipEspService;
	private ProvinciaService provinciaService;
	private MascotaService mascotaServ;
	private CuidadorService cuidadorServ;
	public PrecreateServlet() {
		servicioService = new ServicioServiceImpl();
		poblacionService = new PoblacionServiceImpl();
		experienciaService = new ExperienciaServiceImpl();
		idiomaService = new IdiomaServiceImpl();
		tipEspService = new TipoEspecieServiceImpl();	
		provinciaService = new ProvinciaServiceImpl();
		mascotaServ= new MascotaServiceImpl();
		cuidadorServ= new CuidadorServiceImpl();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		String action = request.getParameter(ActionNames.ACTION);
		String target = null;
		boolean redirect = false;
		if(ActionNames.REGISTRO_CUIDADOR.equals(action)) {
			try {
				List<Servicio> listServicio = servicioService.findAll("es");
				List<TipoEspecie>listTipoEsp = tipEspService.findAll("es");
				List<Idioma> listIdioma = idiomaService.findAll();
				List<Poblacion>listPoblacion = poblacionService.findAll();
				List<Provincia>listProvincia = provinciaService.findAll();
				List<Experiencia>listExperiencia = experienciaService.findAll("es");

				request.setAttribute(AttributeNames.SERVICIOS, listServicio);
				request.setAttribute(AttributeNames.TIPO_ESPECIE, listTipoEsp);
				request.setAttribute(AttributeNames.IDIOMA, listIdioma);
				request.setAttribute(AttributeNames.POBLACION, listPoblacion);
				request.setAttribute(AttributeNames.PROVINCIA, listProvincia);
				request.setAttribute(AttributeNames.EXPERIENCIA, listExperiencia);
				target = ViewsNames.REGISTRO_CUIDADOR;
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
			}

		}
		if(ActionNames.CONTRATAR.equals(action)) {
			try {
				String cuidador=request.getParameter(ParameterNames.ID_CUIDADOR);
				Cliente cliente= (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
				Cuidador c= cuidadorServ.findById(Long.valueOf(cuidador));
				request.setAttribute(AttributeNames.CUIDADOR, c);
	

				target =ViewsNames.SOLICITUD_CONTRATO;
			} catch (DataException e) {
				logger.warn(e.getMessage(),e);
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
