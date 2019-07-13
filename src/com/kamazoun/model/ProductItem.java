package com.kamazoun.model;

public class ProductItem extends Product{
	
	public ProductItem()
	{
		// TODO Auto-generated constructor stub
	}
	
	public ProductItem(Product p)
	{
		// TODO Auto-generated constructor stub
		setProduct_id(p.getProduct_id());
		setSeller_id(p.getSeller_id());
		setProduct_code(p.getProduct_code());
		setQuantity_available(p.getQuantity_available());
		setDetails(p.getDetails());
		setSight(p.getSight());
		setImg(p.getImg());
		setPrice(p.getPrice());
		setProduct_name(p.getProduct_name());
	}
	
	private Integer quantity;
	
	public void setQuantity(Integer quantity)
	{
		this.quantity = quantity;
	}
	
	public Integer getQuantity()
	{
		return quantity;
	}
	
	/**
	 * @return the totalPrice
	 */
	public Double getTotalPrice() {
		return getPrice() * quantity;
	}
	
	/*private Integer product_id;
	private String product_code;
	private String product_name;
	private Integer seller_id;
	private Double price;*/
	
	
	/**
	 * @return the product_id
	 *//*
	public Integer getProduct_id()
	{
		return product_id;
	}

	*//**
	 * @return the product_code
	 *//*
	public String getProduct_code()
	{
		return product_code;
	}

	*//**
	 * @return the product_name
	 *//*
	public String getProduct_name()
	{
		return product_name;
	}

	*//**
	 * @return the seller_id
	 *//*
	public Integer getSeller_id()
	{
		return seller_id;
	}

	*//**
	 * @return the price
	 *//*
	public Double getPrice()
	{
		return price;
	}

	*//**
	 * @return the quantity
	 *//*
	public Integer getQuantity()
	{
		return quantity;
	}

	*//**
	 * @param product_id the product_id to set
	 *//*
	public void setProduct_id(Integer product_id)
	{
		this.product_id = product_id;
	}

	*//**
	 * @param product_code the product_code to set
	 *//*
	public void setProduct_code(String product_code)
	{
		this.product_code = product_code;
	}

	*//**
	 * @param product_name the product_name to set
	 *//*
	public void setProduct_name(String product_name)
	{
		this.product_name = product_name;
	}

	*//**
	 * @param seller_id the seller_id to set
	 *//*
	public void setSeller_id(Integer seller_id)
	{
		this.seller_id = seller_id;
	}

	*//**
	 * @param price the price to set
	 *//*
	public void setPrice(Double price)
	{
		this.price = price;
	}
*/
}
