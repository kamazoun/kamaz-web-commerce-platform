package com.kamazoun.model;

import com.kamazoun.dao.MySQLUtil;

public class SalesOrdersItems
{

	private Integer salesorder_items_id;
	private Integer salesorder_id;
	private Integer product_id;
	/**
	 * @return the salesorder_items_id
	 */
	public Integer getSalesorder_items_id()
	{
		return salesorder_items_id;
	}
	/**
	 * @return the salesorder_id
	 */
	public Integer getSalesorder_id()
	{
		return salesorder_id;
	}
	/**
	 * @return the product_id
	 */
	public Integer getProduct_id()
	{
		return product_id;
	}
	/**
	 * @param salesorder_items_id the salesorder_items_id to set
	 */
	public void setSalesorder_items_id(Integer salesorder_items_id)
	{
		this.salesorder_items_id = salesorder_items_id;
	}
	/**
	 * @param salesorder_id the salesorder_id to set
	 */
	public void setSalesorder_id(Integer salesorder_id)
	{
		this.salesorder_id = salesorder_id;
	}
	/**
	 * @param product_id the product_id to set
	 */
	public void setProduct_id(Integer product_id)
	{
		this.product_id = product_id;
	}
	
	public String generateInsert()
	{
		String query = "";
		
		int maxNo = MySQLUtil.queryMaxNo("salesorder_items", "salesorder_items_id");
		salesorder_id = maxNo + 1;
		query += "INSERT INTO product VALUES(" + salesorder_items_id
				+ ", " + salesorder_id + ", " + product_id  + ")";

		return query;
	}
}
