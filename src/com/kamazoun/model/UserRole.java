package com.kamazoun.model;

public class UserRole
{
	private String user_name;
	private String role_name;
	/**
	 * @return the user_name
	 */
	public String getUser_name()
	{
		return user_name;
	}
	/**
	 * @return the role_name
	 */
	public String getRole_name()
	{
		return role_name;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}
	/**
	 * @param role_name the role_name to set
	 */
	public void setRole_name(String role_name)
	{
		this.role_name = role_name;
	}
	
	public String generateInsert()
	{
		String query = "";
		
		query += "INSERT INTO user_role VALUES('" + user_name
				+ "', '" + role_name + "')";

		return query;
	}
	
	public String generateDelete()
	{
		String query = "";

		query += "DELETE FROM user_role "
				+ " WHERE user_name = '" + user_name + "'";

		return query;
	}
	
}

