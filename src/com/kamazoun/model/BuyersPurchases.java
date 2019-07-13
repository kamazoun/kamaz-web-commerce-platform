package com.kamazoun.model;

public class BuyersPurchases
{
	private String buyer_id;
	private String quantity;
	/**
	 * @return the buyer_id
	 */
	public String getBuyer_id()
	{
		return buyer_id;
	}
	/**
	 * @return the quantity
	 */
	public String getQuantity()
	{
		return quantity;
	}
	/**
	 * @param buyer_id the buyer_id to set
	 */
	public void setBuyer_id(String buyer_id)
	{
		this.buyer_id = buyer_id;
	}
	/**
	 * @param quantity the quantity to set
	 */
	public void setQuantity(String quantity)
	{
		this.quantity = quantity;
	}
	
}
