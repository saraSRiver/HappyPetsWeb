package com.jal.prueba.web;

import java.io.IOException;
import java.sql.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Mascota;
import com.happypets.aplicacion.service.IdiomaService;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.service.TipoEspecieService;
import com.happypets.aplicacion.serviceImpl.IdiomaServiceImpl;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;
import com.happypets.aplicacion.serviceImpl.TipoEspecieServiceImpl;
import com.jal.prueba.utils.ActionNames;
import com.jal.prueba.utils.ParameterNames;
import com.jal.prueba.utils.UrlBuilder;

/**
 * Servlet implementation class mascota
 */
@WebServlet("/mascota")
public class MascotaServlet extends HttpServlet {
	private static Logger logger = LogManager.getLogger(MascotaServlet.class);
    private MascotaService mascServ;
    private TipoEspecieService servEspecie=null;
    private IdiomaService servIdioma=null;
    public MascotaServlet() {
    	mascServ= new MascotaServiceImpl();
    	servEspecie= new TipoEspecieServiceImpl();
		servIdioma= new IdiomaServiceImpl();
    }
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		if(logger.isDebugEnabled()) {
			logger.debug(request.getParameterMap());
		}
		String action = request.getParameter(ActionNames.ACTION);
		if (ActionNames.ADD_MASCOTA.equalsIgnoreCase(action)) {
			String target=null;
			boolean redirect=false;
			String nombre = request.getParameter(ParameterNames.NOMBRE_MASCOTA);
			String fechaNacimiento = request.getParameter(ParameterNames.FECHA_NACIMIENTO);
			String especie=request.getParameter(ParameterNames.ESPECIES);
			String microchip = request.getParameter(ParameterNames.MICROCHIP);
			String vacunado = request.getParameter(ParameterNames.VACUNADO);
			String buenoConNinos = request.getParameter(ParameterNames.BIEN_CON_NINOS);
			String buenoConAnimales = request.getParameter(ParameterNames.BIEN_CON_ANIMALES);
			String desparasitado = request.getParameter(ParameterNames.DESPARASITADO);
			String alergia = request.getParameter(ParameterNames.ALERGIA);
			String tratamiento = request.getParameter(ParameterNames.TRATAMIENTO);
			String descripcion = request.getParameter(ParameterNames.DESCRIPCION);
			
			if (logger.isInfoEnabled()) {
				logger.info("Añadiendo mascota");
			}
			Mascota mascota= new Mascota();
			mascota.setNombre(nombre);
			mascota.setFechaNacimiento(Date.valueOf(fechaNacimiento));
			mascota.setIdTipo(Long.valueOf(especie));
			mascota.setMicrochip(Boolean.valueOf(microchip));
			mascota.setVacunado(Boolean.valueOf(vacunado));
			mascota.setBuenoConNinos(Boolean.valueOf(buenoConNinos));
			mascota.setBuenoConAnimales(Boolean.valueOf(buenoConAnimales));
			mascota.setDesparasitado(Boolean.valueOf(desparasitado));
			mascota.setAlergia(Boolean.valueOf(alergia));
			mascota.setTratamiento(Boolean.valueOf(tratamiento));
			mascota.setDescripcion(descripcion);
			mascota.setFechaBaja(null);
			
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
