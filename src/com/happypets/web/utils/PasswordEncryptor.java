package com.happypets.web.utils;

import org.jasypt.util.password.StrongPasswordEncryptor;

//método para encriptar las passwords actualizadas
public class PasswordEncryptor {
	private static final StrongPasswordEncryptor PASSWORD_ENCRYPTOR = 
			new StrongPasswordEncryptor();

	public static final String encryptPassword(String password) {
		return PASSWORD_ENCRYPTOR.encryptPassword(password);
	}
	public static final boolean checkPassword(String passwordNormal, String passwordEncriptada) {
		if (PASSWORD_ENCRYPTOR.checkPassword(passwordNormal, passwordEncriptada)) {
			return true;
			// si la password es correcta
		} else {
			// si la password no es correcta
			return false;
		}
	}

}
