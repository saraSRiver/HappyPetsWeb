package com.jal.prueba.utils;



import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class UrlBuilder {

	public static String builderUrlForm(HttpServletRequest request, String direccion) {
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(request.getServerName()).append(":")
		.append(request.getServerPort()).append(request.getContextPath()).append(direccion);
		return sb.toString();
	}
	public static String builderUrlImg(HttpServletRequest request, String imagen) {
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(request.getServerName()).append(":")
		.append(request.getServerPort()).append(request.getContextPath()).append("/img/")
		.append(imagen);

		return sb.toString();
	}

	public static String builderUrlImgFav(HttpServletRequest request, String imagenFav) {
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(request.getServerName()).append(":")
		.append(request.getServerPort()).append(request.getContextPath()).append("/img/")
		.append("/mascotas").append("/favoritas/").append(imagenFav);

		return sb.toString();
	}
	public static String builderUrlImgCommon(HttpServletRequest request, String imagen) {
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(request.getServerName()).append(":")
		.append(request.getServerPort()).append(request.getContextPath()).append("/img/")
		.append("/common/").append(imagen);

		return sb.toString();
	}
	public static String builderUrlImgIndex(HttpServletRequest request, String imagen) {
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(request.getServerName()).append(":")
		.append(request.getServerPort()).append(request.getContextPath()).append("/img/")
		.append("/index/").append(imagen);

		return sb.toString();
	}
	public static String builderUrlRedirect(HttpServletRequest request, String direccion) {
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(request.getServerName()).append(":")
		.append(request.getServerPort()).append(request.getContextPath()).append(direccion);
		return sb.toString();
	}
	public static String getUrlForController(HttpServletRequest request,String action) {

		Map<String, String[]> valores = request.getParameterMap();
		StringBuilder sb = new StringBuilder();
		sb.append("http://").append(request.getServerName()).append(":")
		.append(request.getServerPort())
		.append(request.getContextPath()).append("/").append(action).append("&");

		for(Map.Entry<String, String[]> m: valores.entrySet()) {
			sb.append(m.getKey()).append("=").append(m.getValue()[0]).append("&");
		}
		return sb.toString();
	}
	public static String getUrlForController(HttpServletRequest request, String controllerPath, String controllerAction,String... paramsAndValues ) {
		StringBuilder sb = new StringBuilder("http://").append(request.getServerName()).append(":")
				.append(request.getServerPort())
				.append(request.getContextPath()).append("/").append(controllerPath)
				.append("?")
				.append(ActionNames.ACTION)
				.append("=")
				.append(controllerAction)
				.append("&");
		if(paramsAndValues.length > 1) {
			for(int i=0; i < paramsAndValues.length; i+=2) {
				sb.append(paramsAndValues[i]).append("=").append(paramsAndValues[i + 1]).append("&");
			}}
		else {
			sb.append(paramsAndValues[0]);
		}

		return sb.toString();

	}
	public static String getUrlForController(HttpServletRequest request, String controllerPath, String controllerAction ) {
		StringBuilder sb = new StringBuilder("http://").append(request.getServerName()).append(":")
				.append(request.getServerPort())
				.append(request.getContextPath()).append("/").append(controllerPath)
				.append("?")
				.append(ActionNames.ACTION)
				.append("=")
				.append(controllerAction);

		return sb.toString();

	}
}
