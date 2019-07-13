package com.kamazoun.model;

public class Buyer
{

	private Integer user_id;
	private String details;

	/**
	 * @return the user_id
	 */
	public Integer getUser_id()
	{
		return user_id;
	}


	/**
	 * @return the details
	 */
	public String getDetails()
	{
		return details;
	}

	/**
	 * @param user_id
	 *            the user_id to set
	 */
	public void setUser_id(Integer user_id)
	{
		this.user_id = user_id;
	}


	/**
	 * @param details
	 *            the details to set
	 */
	public void setDetails(String details)
	{
		this.details = details;
	}
	
	public String generateInsert()
	{
		String query = "";
		
		//puisque buyer est un user, son id est defini comme user_id
		
		query += "INSERT INTO buyer VALUES(" + user_id
				 + ", '" + details + "')";

		return query;
	}
	
	public String generateDelete()
	{
		String query = "";

		query += "DELETE FROM buyer "
				+ "WHERE user_id = " + user_id;

		return query;
	}

}
