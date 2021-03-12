package com.jal.prueba.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.happypets.aplicacion.model.Cuidador;
import com.happypets.aplicacion.model.Direccion;
import com.happypets.aplicacion.model.DireccionDTO;
import com.happypets.aplicacion.model.Experiencia;
import com.happypets.aplicacion.model.Idioma;
import com.happypets.aplicacion.model.ServicioOfrecido;
import com.happypets.aplicacion.model.TipoEspecie;
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

/**
 * Servlet de autentificación de usuarios
 */
@WebServlet("/registroCuidador")
public class CuidadorRegistroServlet extends HttpServlet {
	private ServicioOfrecidoService servOfrecido = null;
	private TipoEspecieService servEspecie=null;
	private CuidadorService cuidServ;
	private IdiomaService servIdioma=null;
	private ServicioService servServicio=null;

	public CuidadorRegistroServlet() {
		servOfrecido = new ServicioOfrecidoServiceImpl();
		servEspecie= new TipoEspecieServiceImpl();
		servIdioma= new IdiomaServiceImpl();
		cuidServ= new CuidadorServiceImpl();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

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
		Experiencia experiencia= new Experiencia();
		experienciaCuid= experiencia.getValor();
		cuidador.setExperiencia(experiencia);
		Direccion direccion;
		DireccionDTO direccionDto;
		direccion= new Direccion();
		direccionDto= new DireccionDTO();
		direccionDto.setPortal(Integer.valueOf(portal));
		direccionDto.setCp(Integer.valueOf(cp));
		direccionDto.setIdPoblacion(Long.valueOf(poblacion));
		direccionDto.setIdProvincia(Long.valueOf(provincia));
		direccionDto.setIdpais(1L);
		direccionDto.setNombrePais("España");
	
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
			///capa de negocio
			cuidador=cuidServ.registro(cuidador);
			request.setAttribute("registro",cuidador);
			request.getRequestDispatcher("/html/cuidador/registro.jsp")
			.forward(request, response);
			StringBuilder stringBuilder = new StringBuilder();
			stringBuilder.append("<p>Hola");
			stringBuilder.append(cuidador.getNombre());
			stringBuilder.append("</p>");
			stringBuilder.append(".");
			stringBuilder.append("<p>");
			stringBuilder.append(" Bienvenido/a a Happy Pets");
			stringBuilder.append("</p>");
		
			
		} catch (DataException de) {
			de.printStackTrace();
		
		} catch (ServiceException se) {
			se.printStackTrace();
			
		}
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}

}
