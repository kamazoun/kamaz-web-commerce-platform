package com.kamazoun.model;

public class SessionProduct
{
	private Integer session_id;
	private Integer  product_id;
	private Integer  quantity;
	private Integer  unit_price;
	/**
	 * @return the session_id
	 */
	public Integer getSession_id()
	{
		return session_id;
	}
	/**
	 * @return the product_id
	 */
	public Integer getProduct_id()
	{
		return product_id;
	}
	/**
	 * @return the quantity
	 */
	public Integer getQuantity()
	{
		return quantity;
	}
	/**
	 * @return the unit_price
	 */
	public Integer getUnit_price()
	{
		return unit_price;
	}
	/**
	 * @param session_id the session_id to set
	 */
	public void setSession_id(Integer session_id)
	{
		this.session_id = session_id;
	}
	/**
	 * @param product_id the product_id to set
	 */
	public void setProduct_id(Integer product_id)
	{
		this.product_id = product_id;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(Integer quantity)
	{
		this.quantity = quantity;
	}
	/**
	 * @param unit_price the unit_price to set
	 */
	public void setUnit_price(Integer unit_price)
	{
		this.unit_price = unit_price;
	}
	
}
