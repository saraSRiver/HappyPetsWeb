package com.happypets.web.utils;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ValidationUtils {
private static final DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	public ValidationUtils() {}
	
	public static Date dateValidator(String fecha) {
		try {
			Date data = df.parse(fecha);
			return data;
		} catch (ParseException e) {
		
			e.printStackTrace();
		}
		return null;
	}
}
