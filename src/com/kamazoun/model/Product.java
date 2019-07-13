package com.kamazoun.model;

import com.kamazoun.dao.MySQLUtil;

public class Product
{

	private Integer product_id;
	private Integer  seller_id;
	private String product_code;
	private Integer quantity_available;
	private String details;
	private Integer sight;
	private String img;
	private Double price;
	private String product_name;
	
	public String getProduct_name()
	{
		return product_name;
	}
	
	public void setProduct_name(String product_name)
	{
		this.product_name = product_name;
	}
	
	public Double getPrice()
	{
		return price;
	}
	
	public void setPrice(Double price)
	{
		this.price = price;
	}
	
	public String getImg()
	{
		return img;
	}
	
	public void setImg(String img)
	{
		this.img = img;
	}
	
	public Integer getSight()
	{
		return sight;
	}
	
	public void setSight(Integer sight)
	{
		this.sight = sight;
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
	 * @return the product_code
	 */
	public String getProduct_code()
	{
		return product_code;
	}
	/**
	 * @return the quantity_available
	 */
	public Integer getQuantity_available()
	{
		return quantity_available;
	}
	/**
	 * @return the details
	 */
	public String getDetails()
	{
		return details;
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
	 * @param product_code the product_code to set
	 */
	public void setProduct_code(String product_code)
	{
		this.product_code = product_code;
	}
	/**
	 * @param quantity_available the quantity_available to set
	 */
	public void setQuantity_available(Integer quantity_available)
	{
		this.quantity_available = quantity_available;
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
		
		int maxNo = MySQLUtil.queryMaxNo("product", "product_id");
		product_id = maxNo + 1;
		query += "INSERT INTO product VALUES(" + product_id
				+ ", " + seller_id + ", '" + product_code + "', "
				+ quantity_available + ", '" + details + "', "
				+ 0 + ", '" + img
				+ "', " + price + ", '" + product_name + "')";

		return query;
	}
	
	public String generateDelete()
	{
		String query = "";

		query += "DELETE FROM product "
				+ "WHERE product_id = " + product_id;
				//+ "AND seller_id = " + seller_id ;

		return query;
	}
}
