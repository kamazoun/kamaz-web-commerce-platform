package com.kamazoun.model;

public class SalesRecord
{
	String date_time;
	Integer product_id;
	Integer seller_id;
	Integer buyer_id;
	Integer quantity;
	String details;
	/**
	 * @return the date_time
	 */
	public String getDate_time()
	{
		return date_time;
	}
	/**
	 * @return the product_id
	 */
	public Integer getProduct_id()
	{
		return product_id;
	}
	/**
	 * @return the seller_id
	 */
	public Integer getSeller_id()
	{
		return seller_id;
	}
	/**
	 * @return the buyer_id
	 */
	public Integer getBuyer_id()
	{
		return buyer_id;
	}
	/**
	 * @return the quantity
	 */
	public Integer getQuantity()
	{
		return quantity;
	}
	/**
	 * @return the details
	 */
	public String getDetails()
	{
		return details;
	}
	/**
	 * @param date_time the date_time to set
	 */
	public void setDate_time(String date_time)
	{
		this.date_time = date_time;
	}
	/**
	 * @param product_id the product_id to set
	 */
	public void setProduct_id(Integer product_id)
	{
		this.product_id = product_id;
	}
	/**
	 * @param seller_id the seller_id to set
	 */
	public void setSeller_id(Integer seller_id)
	{
		this.seller_id = seller_id;
	}
	/**
	 * @param buyer_id the buyer_id to set
	 */
	public void setBuyer_id(Integer buyer_id)
	{
		this.buyer_id = buyer_id;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(Integer quantity)
	{
		this.quantity = quantity;
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
		String update = "";
		
		update += "INSERT INTO sales_record VALUES('" + date_time
				+ "', " + product_id + ", " + seller_id  + ", " + buyer_id  + ", " + quantity  + ", '" + details  + "')";


		return update;
	}
}
