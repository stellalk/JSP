package kr.co.farmstory1.config;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConfig {
	
	//single tone object
	private static DBConfig instance = new DBConfig();
	private DBConfig() {}
	
	public static DBConfig getInstance() {
		return instance;
	}
	
	//DB info
	private final String HOST = "jdbc:mysql://192.168.10.114:3306/kye";
	private final String USER = "kye";
	private final String PASS = "1234";
	
	public Connection getConnection() throws Exception{
		//1.load JDBC driver
		Class.forName("com.mysql.jdbc.Driver");
			
		//2.access to the database
		Connection conn = DriverManager.getConnection(HOST, USER, PASS);
		return conn;
	}
}
