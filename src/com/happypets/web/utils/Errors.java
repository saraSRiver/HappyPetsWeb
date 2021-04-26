package com.happypets.web.utils;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Errors {

		private Map<String, String> errorsMap = null;
		
		public Errors() {
			errorsMap = new HashMap<String, String>();
		}
		
		public void addError(String error, String errorNombre) {
			errorsMap.put(error, errorNombre);
		}
		
		public String getError(String error) {
			return errorsMap.get(error);
		}
		
		public boolean hasErrors() {
			return !errorsMap.isEmpty();
		}
		public String printError(String parameter) {
			
			String errores = errorsMap.get(parameter);
			if(errores == null) {
				return null;
			}
			if(errores.isEmpty()) {
				return null;
			}
		
			
			return errores;
		}
}
