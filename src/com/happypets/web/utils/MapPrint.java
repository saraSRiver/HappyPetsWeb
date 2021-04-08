package com.happypets.web.utils;

import java.util.Map;

public class MapPrint {
	public static final String print(Map<String, String[]> parameters) {
		StringBuilder sb = new StringBuilder();
		for(Map.Entry<String, String[]> values: parameters.entrySet()) {
			sb.append(values.getKey()).append("={");
			for(String va: values.getValue()) {
				sb.append(va).append("}");
			}
		}
		return sb.toString();
	}
}
