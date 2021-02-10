package br.com.treinacom.controlador;

import java.sql.Connection;
import java.sql.DriverManager;


public class FabricaConexao {
	public Connection getConnection() {
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			return DriverManager.getConnection("jdbc:mysql://localhost/gestaoescola", "root", "");
		} catch (Exception e) {
			throw new RuntimeException();
		}
	}
}