package com.happypets.web.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.aplicacion.model.Cliente;
import com.happypets.aplicacion.model.Mascota;
import com.happypets.aplicacion.model.TipoEspecie;
import com.happypets.aplicacion.service.DataException;
import com.happypets.aplicacion.service.IdiomaService;
import com.happypets.aplicacion.service.MascotaService;
import com.happypets.aplicacion.service.TipoEspecieService;
import com.happypets.aplicacion.serviceImpl.IdiomaServiceImpl;
import com.happypets.aplicacion.serviceImpl.MascotaServiceImpl;
import com.happypets.aplicacion.serviceImpl.TipoEspecieServiceImpl;
import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ContextsPath;
import com.happypets.web.utils.ParameterNames;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;
import com.happypets.web.utils.ValidationUtils;
import com.happypets.web.utils.ViewsNames;

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
		Cliente cliente = (Cliente)SessionManager.get(request, AttributeNames.CLIENTE);
		String target=null;
		boolean redirect=false;
		if (ActionNames.ADD_MASCOTA.equalsIgnoreCase(action)) {

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
			String fotoFavorita=request.getParameter(ParameterNames.FOTO_FAVORITA);
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
			mascota.setIdCliente(cliente.getIdcliente());
			mascota.setFotoFavorita(Boolean.valueOf(fotoFavorita));
			try {
				mascota=mascServ.create(mascota);

				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA, ActionNames.DETAIL, ParameterNames.ID_MASCOTA, String.valueOf(mascota.getIdMascota()));

				redirect = true;
			} catch (DataException e) {
				e.printStackTrace();
			}

		}
		else if(ActionNames.EDIT_PERFIL_MASCOTA.equals(action)) {
			String nombre = request.getParameter(ParameterNames.NOMBRE_MASCOTA);
			String idMascota = request.getParameter(ParameterNames.ID_MASCOTA);
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
				logger.info("Actualizando perfil mascota");
			}

			Mascota mascota= new Mascota();
			mascota.setIdMascota(Long.valueOf(idMascota));
			mascota.setNombre(nombre);
			mascota.setFechaNacimiento(ValidationUtils.dateValidator(fechaNacimiento));
			mascota.setIdTipo(Long.valueOf(especie));
			mascota.setMicrochip(Boolean.valueOf(microchip));
			mascota.setVacunado(Boolean.valueOf(vacunado));
			mascota.setBuenoConNinos(Boolean.valueOf(buenoConNinos));
			mascota.setBuenoConAnimales(Boolean.valueOf(buenoConAnimales));
			mascota.setDesparasitado(Boolean.valueOf(desparasitado));
			mascota.setAlergia(Boolean.valueOf(alergia));
			mascota.setTratamiento(Boolean.valueOf(tratamiento));
			mascota.setDescripcion(descripcion);
			try {
				Mascota masc = 	mascServ.update(mascota);
				target = UrlBuilder.getUrlForController(request, ContextsPath.MASCOTA, ActionNames.DETAIL, ParameterNames.ID_MASCOTA, String.valueOf(masc.getIdMascota()));
				redirect = true;
			} catch (DataException e) {
				e.printStackTrace();
			}
		}
		else if(ActionNames.DETAIL.equals(action)) {
			String idMascota = request.getParameter(ParameterNames.ID_MASCOTA);
			String actionUpdate = request.getParameter(ActionNames.ACTION_UPDATE);

			try {
				Mascota m = mascServ.findById(Long.valueOf(idMascota));
				TipoEspecie tip = 	servEspecie.findById(m.getIdTipo(), "es");
				request.setAttribute(AttributeNames.MASCOTA, m);
				request.setAttribute(AttributeNames.TIPO_ESPECIE, tip);
			} catch (DataException e) {
				e.printStackTrace();
			}
			if(actionUpdate == null) {
				target = ViewsNames.PERFIL_MASCOTA;
			}
			else {
				try {
					List<TipoEspecie> listEspecie = servEspecie.findAll("es");
					request.setAttribute(AttributeNames.ESPECIES, listEspecie);
				} catch (DataException e) {

					e.printStackTrace();
				}
				target = ViewsNames.EDITAR_PERFIL_MASCOTA;
			}
		}
		else if(ActionNames.ELIMINAR.equals(action)) {
			String idMasc= request.getParameter(ParameterNames.ID_MASCOTA);
			try {
				mascServ.deleteMascota(Long.valueOf(idMasc));
			} catch ( DataException e) {
				e.printStackTrace();
			}
			target = ViewsNames.PERFIL_CLIENTE;
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
