package com.happypets.web.filters;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.web.utils.ActionNames;
import com.happypets.web.utils.AttributeNames;
import com.happypets.web.utils.ContextsPath;
import com.happypets.web.utils.SessionManager;
import com.happypets.web.utils.UrlBuilder;

public class ClienteSesionFilter implements Filter {
	private static Logger logger = LogManager.getLogger(ClienteSesionFilter.class);

	public ClienteSesionFilter() {
	}

	public void destroy() {
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		HttpServletResponse httpResponse = (HttpServletResponse) response;
		String target = null;
		logger.info("aplicando ClienteSesionFilter");
		if((SessionManager.get(httpRequest, AttributeNames.CLIENTE))==null||
				SessionManager.get(httpRequest, AttributeNames.CUIDADOR)!=null) {
			logger.info("Filtro aplicado");

			target = UrlBuilder.getUrlForController(httpRequest, ContextsPath.MASCOTA_MES, ActionNames.INDEX, true);
			logger.info("Redirect to..." + target);
			httpResponse.sendRedirect(target);

		}
		else {

			chain.doFilter(request, response);
		}
	}

	public void init(FilterConfig fConfig) throws ServletException {

	}

}
