package com.kamazoun.model;

import com.kamazoun.dao.MySQLUtil;

public class SalesOrders
{

	private Integer salesorder_id;
	private Integer client_id;
	private Integer session_id;
	/**
	 * @return the salesorder_id
	 */
	public Integer getSalesorder_id()
	{
		return salesorder_id;
	}
	/**
	 * @return the client_id
	 */
	public Integer getClient_id()
	{
		return client_id;
	}
	/**
	 * @return the session_id
	 */
	public Integer getSession_id()
	{
		return session_id;
	}
	/**
	 * @param salesorder_id the salesorder_id to set
	 */
	public void setSalesorder_id(Integer salesorder_id)
	{
		this.salesorder_id = salesorder_id;
	}
	/**
	 * @param client_id the client_id to set
	 */
	public void setClient_id(Integer client_id)
	{
		this.client_id = client_id;
	}
	/**
	 * @param session_id the session_id to set
	 */
	public void setSession_id(Integer session_id)
	{
		this.session_id = session_id;
	}
	
	
	public String generateInsert()
	{
		String query = "";
		
		int maxNo = MySQLUtil.queryMaxNo("salesorder", "salesorder_id");
		salesorder_id = maxNo + 1;
		query += "INSERT INTO salesorder VALUES(" + salesorder_id
				+ ", " + client_id + ", " + session_id  + ")";

		return query;
	}
}
