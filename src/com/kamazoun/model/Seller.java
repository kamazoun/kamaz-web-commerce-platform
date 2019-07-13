package com.kamazoun.model;

public class Seller
{

	private Integer user_id;
	private String  company;
	private String  details;
	/**
	 * @return the user_id
	 */
	public Integer getUser_id()
	{
		return user_id;
	}
	/**
	 * @return the company
	 */
	public String getCompany()
	{
		return company;
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
	 * @param company the company to set
	 */
	public void setCompany(String company)
	{
		this.company = company;
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
		
		//puisque seller est un user, son id est defini comme user_id
		//int maxNo = MySQLUtil.queryMaxNo("user", "user_id");
		//user_id = maxNo + 1;
		query += "INSERT INTO seller VALUES(" + user_id
				 + ", '" + company + "',  '" + details + "')";

		return query;
	}
	
	public String generateDelete()
	{
		String query = "";

		query += "DELETE FROM seller "
				+ "WHERE user_id = " + user_id;

		return query;
	}
}
