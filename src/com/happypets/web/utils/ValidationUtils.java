package com.happypets.web.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.happypets.web.controller.ClienteServlet;

public class ValidationUtils {
	private static Logger logger = LogManager.getLogger(ValidationUtils.class);
private static final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	public ValidationUtils() {}
	
	public static Date dateValidator(String fecha) {
		try {
			Date data = df.parse(fecha);
			return data;
		} catch (ParseException e) {
		
			logger.warn(e.getMessage(),e);
		}
		return null;
	}
}
