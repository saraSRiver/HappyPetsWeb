package com.happypets.web.filters;

import java.io.IOException;
import java.util.Locale;
import java.util.Map;

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

import com.happypets.web.utils.ConstantsValues;
import com.happypets.web.utils.SessionManager;

/**
 * Servlet Filter implementation class LocaleFilter
 */
//@WebFilter("/LocaleFilter")
public class LocaleFilter implements Filter {
	private static Logger logger = LogManager.getLogger(LocaleFilter.class);
   
    public LocaleFilter() {
        
    }

    
	public void destroy() {
	
	}

	
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest httpRequest= (HttpServletRequest) request;
		HttpServletResponse httpResponse = ((HttpServletResponse) response);
		Locale locale = (Locale) SessionManager.get(httpRequest, ConstantsValues.USER_LOCALE);
		
		SessionManager.set(httpRequest, ConstantsValues.USER_LOCALE, locale);	
		
		chain.doFilter(request, response);
	}

	public void init(FilterConfig fConfig) throws ServletException {
		
	}

}
