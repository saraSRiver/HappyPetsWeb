package com.jal.prueba.utils;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class CookieManager {
	public static final Cookie getCookie(HttpServletRequest request, String name) {
		Cookie[] cookies = request.getCookies();		
		if (cookies!=null) {
			for (Cookie c: cookies) {
				if (c.getName().equalsIgnoreCase(name)) {
					return c;
				}
			}
		}
		return null;    
	}
	
	  public static final void addCookie(HttpServletResponse response, String name, String value, String path, int timeToLive) {		
			Cookie c = new Cookie(name, value);		
			c.setMaxAge(timeToLive);
			c.setPath(path);
			response.addCookie(c);	
	    }
}
