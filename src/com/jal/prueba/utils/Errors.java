package com.jal.prueba.utils;

import java.util.HashMap;
import java.util.Map;

public class Errors {

		private Map<String, String> errorsMap = null;
		
		public Errors() {
			errorsMap = new HashMap<String, String>();
		}
		
		public void addError(String key, String code) {
			errorsMap.put(key, code);
		}
		
		public String getError(String key) {
			return errorsMap.get(key);
		}
		
		public boolean hasErrors() {
			return !errorsMap.isEmpty();
		}
}
