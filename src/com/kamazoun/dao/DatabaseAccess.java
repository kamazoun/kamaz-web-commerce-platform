package com.kamazoun.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class DatabaseAccess
{
	public static boolean isLogged = false;
	
	public static Connection connection = null;
	public static Statement statement = null;
	static String driverName = "com.mysql.jdbc.Driver"; // the name of the JDBC
	// DriverManager to use in
	// Class.forName(name)
	static String serverName = "localhost"; // ex: "linux.grace.umd.edu";
	static String portNumber = "3306";
	static String databaseName = "web_cart";
	// String username = "kamaz";
	// String password = "nana";
	static String url = "jdbc:mysql://" + serverName + ":"
			+ portNumber + "/" + databaseName;
	// for Oracle uri = "jdbc:oracle:thin:@" + serverName ip or address + ":" +
	// portNumber + ":" + sid; ex String sid = "dbclass1";

	public static void connect(String username, String password)
			throws SQLException, ClassNotFoundException
	{
		Class.forName(driverName);
		connection = DriverManager.getConnection(url, username,
				password);
		statement = connection.createStatement();
		isLogged = true;
	}

}
