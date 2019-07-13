package com.kamazoun.dao;

import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class MySQLUtil
{

	public static Statement statement = DatabaseAccess.statement;
	
	public static Integer queryMaxNo(String table, String column)
	{
		String sql = "SELECT MAX(" + column + ") FROM " + table;
		ResultSet rs;
		try
		{
			rs = statement.executeQuery(sql);
			if(null == rs)
				return 0;
			while(rs.next())
			{
				return rs.getInt(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	public static void executeUpdate(String sql)
	{
		try
		{
			statement.executeUpdate(sql);
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public  static ResultSet executeQuery(String sql)
	{
		try
		{
			ResultSet rs = statement.executeQuery(sql);
			return rs;
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public static String printQueryResult(String query)
			throws SQLException, ClassNotFoundException
	{
		ResultSet rs = statement.executeQuery(query);
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnCount = rsmd.getColumnCount();

		String result = "";
		int rows = 0;

		for (int i = 1; i <= columnCount; i++)
		{
			result += rsmd.getColumnName(i) + "\t\t";
		}

		result += "\n";

		while (rs.next())
		{
			for (int i = 1; i <= columnCount; i++)
			{
				result += rs.getString(i) + "\t\t";
			}
			result += "\n";
			rows = rs.getRow();
		}

		result += "\nNumber of rows: " + rows;
		return result;
	}

	public  static ResultSet returnBasicQuery(String select, String from, String where)
	{
		String sql = "SELECT " + select
				+ " FROM " + from
				+ " WHERE " + where;
		try
		{
			ResultSet rs = statement.executeQuery(sql);
			return rs;
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
