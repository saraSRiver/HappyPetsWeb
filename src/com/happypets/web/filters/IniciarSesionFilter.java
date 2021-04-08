package com.happypets.web.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.SessionManager;

/**
 * Servlet Filter implementation class IniciarSesion
 */
@WebFilter("/IniciarSesionFilter")
public class IniciarSesionFilter implements Filter {
	private static Logger logger = LogManager.getLogger(IniciarSesionFilter.class);
    
    public IniciarSesionFilter() {
       
    }

	
	public void destroy() {
		
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String target = null;
		if((SessionManager.get(httpRequest, AttributeNames.USUARIO))!=null ) {
			logger.info("Accediendo al portal de Acceso");
			httpRequest.getSession(false);
		}
	}

	
	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
