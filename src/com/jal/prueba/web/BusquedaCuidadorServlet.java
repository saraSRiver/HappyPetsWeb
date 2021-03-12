package com.jal.prueba.web;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.service.CuidadorCriteria;
import com.happypets.aplicacion.service.CuidadorService;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.serviceImpl.CuidadorServiceImpl;
import com.jal.prueba.utils.ActionNames;
import com.jal.prueba.utils.ParameterNames;
import com.jal.prueba.utils.ViewsNames;

/**
 * Servlet de búsqueda de cuidadores
 */
@WebServlet("/busquedaCuidador")
public class BusquedaCuidadorServlet extends HttpServlet {

	
	private static Logger logger = LogManager.getLogger(BusquedaCuidadorServlet.class);
	
	private CuidadorService cuidServ;

	public BusquedaCuidadorServlet() {
		cuidServ= new CuidadorServiceImpl();
	}
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getParameter(ParameterNames.ACTION2);

		if (ActionNames.CUIDADOR_BUSCAR.equalsIgnoreCase(action)) {
			String poblacion = request.getParameter(ParameterNames.POBLACION2);
			String idiomas= request.getParameter(ParameterNames.IDIOMAS2);
			String experiencia=request.getParameter(ParameterNames.EXPERIENCIA2);
			String especies=request.getParameter(ParameterNames.ESPECIES2);
			String servicios=request.getParameter(ParameterNames.SERVICIOS2);
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
				List<Cuidador>cuidadores= cuidServ.findByCriteria(criteria);
			
				request.setAttribute(ActionNames.CUIDADOR_BUSCAR,cuidadores);
				
				request.getRequestDispatcher(ViewsNames.RESULTS)
				.forward(request, response);
			} catch (DataException e) {
				e.printStackTrace();
			}
		}
		else if(ActionNames.CUIDADOR_DETAIL.equalsIgnoreCase(ParameterNames.ACTION2)){
			request.getParameter(ParameterNames.ID_CUIDADOR);
			Long id = Long.valueOf(ParameterNames.ID_CUIDADOR);
			
			try {
				Cuidador cuidador=cuidServ.findById(id);
				request.setAttribute(ParameterNames.CUIDADOR,cuidador);
				request.getRequestDispatcher(ViewsNames.DETAIL)
				.forward(request, response);

			} catch (DataException e) {
				e.printStackTrace();
			}
		} 
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
