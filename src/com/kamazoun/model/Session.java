package com.kamazoun.model;

import com.kamazoun.dao.MySQLUtil;

public class Session
{
	private Integer session_id;
	private Long date;
	//private Integer total_price;
	private String key_terms;
	private String details;
	/**
	 * @return the session_id
	 */
	public Integer getSession_id()
	{
		return session_id;
	}
	/**
	 * @return the date
	 */
	public Long getDate()
	{
		return date;
	}
	/**
	 * @return the total_price
	 */
	/*public Integer getTotal_price()
	{
		return total_price;
	}*/
	/**
	 * @return the key_terms
	 */
	public String getKey_terms()
	{
		return key_terms;
	}
	/**
	 * @return the details
	 */
	public String getDetails()
	{
		return details;
	}
	/**
	 * @param session_id the session_id to set
	 */
	public void setSession_id(Integer session_id)
	{
		this.session_id = session_id;
	}
	/**
	 * @param date the date to set
	 */
	public void setDate(Long date)
	{
		this.date = date;
	}
	/**
	 * @param total_price the total_price to set
	 */
	/*public void setTotal_price(Integer total_price)
	{
		this.total_price = total_price;
	}*/
	/**
	 * @param key_terms the key_terms to set
	 */
	public void setKey_terms(String key_terms)
	{
		this.key_terms = key_terms;
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
		
		int maxNo = MySQLUtil.queryMaxNo("session", "session_id");
		session_id = maxNo + 1;
		query += "INSERT INTO product VALUES(" + session_id
				+ ", " + date + ", '" + key_terms + "', '" + details  + "')";

		return query;
	}
	
	/* Eternal record, no delete
	 * 
	 * public String generateDelete()
	{
		String query = "";

		query += "DELETE FROM session "
				+ "WHERE session_id = " + session_id;
				//+ "AND seller_id = " + seller_id ;

		return query;
	}*/
}
