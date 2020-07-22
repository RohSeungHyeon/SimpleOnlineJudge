package com.spring.board.util;


import java.sql.*;

public class DBConnector {
	private static DBConnector dbConnector = new DBConnector();

	public static DBConnector getInstance() {
		return dbConnector;
	}

	private DBConnector() {
	}

	static {
		// Load driver
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public Connection getConnection() {
		String DB_URL = "jdbc:oracle:thin:@localhost:1521:xe";
		String DB_USER = "c##ora_user";
		String DB_PW = "88888888";

		Connection conn = null;

		try {
			conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PW);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return conn;
	}
}
