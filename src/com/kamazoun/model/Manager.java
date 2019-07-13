package com.kamazoun.model;

public class Manager
{
	private Integer user_id;
	private String  position;
	private String  department;
	private String  details;
	
	/**
	 * @return the user_id
	 */
	public Integer getUser_id()
	{
		return user_id;
	}
	/**
	 * @return the position
	 */
	public String getPosition()
	{
		return position;
	}
	/**
	 * @return the department
	 */
	public String getDepartment()
	{
		return department;
	}
	/**
	 * @return the details
	 */
	public String getDetails()
	{
		return details;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(Integer user_id)
	{
		this.user_id = user_id;
	}
	/**
	 * @param position the position to set
	 */
	public void setPosition(String position)
	{
		this.position = position;
	}
	/**
	 * @param department the department to set
	 */
	public void setDepartment(String department)
	{
		this.department = department;
	}
	/**
	 * @param details the details to set
	 */
	public void setDetails(String details)
	{
		this.details = details;
	}
	
	public String generateInsert()
	{
		String query = "";
		
		//puisque manager est un user, son id est defini comme user_id
		
		query += "INSERT INTO manager VALUES(" + user_id
				 + ", '" + position + "',  '" + department + "',  '" + details + "')";

		return query;
	}
	
	public String generateDelete()
	{
		String query = "";

		query += "DELETE FROM manager "
				+ "WHERE user_id = " + user_id;

		return query;
	}
	
}
