package com.jal.prueba.utils;



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
}
