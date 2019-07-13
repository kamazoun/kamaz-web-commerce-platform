package com.kamazoun.model;

import com.kamazoun.dao.MySQLUtil;

public class User
{

	private Integer user_id;
	private String user_name;
	private String user_password;
	private String user_birthdate;
	private String user_first_name;
	private String user_given_name;
	private String user_country;
	private String user_phone;
	private String user_address;
	private Integer type_id;
	private String user_details;
	private Integer amount;
	private String img;
	
	public String getImg()
	{
		return img;
	}
	
	public void setImg(String img)
	{
		this.img = img;
	}
	
	public Integer getAmount()
	{
		return amount;
	}
	
	public void setAmount(Integer amount)
	{
		this.amount = amount;
	}
	
	/**
	 * @return the user_id
	 */
	public Integer getUser_id()
	{
		return user_id;
	}
	/**
	 * @return the user_name
	 */
	public String getUser_name()
	{
		return user_name;
	}
	/**
	 * @return the user_password
	 */
	public String getUser_password()
	{
		return user_password;
	}
	/**
	 * @return the user_birthdate
	 */
	public String getUser_birthdate()
	{
		return user_birthdate;
	}
	/**
	 * @return the user_first_name
	 */
	public String getUser_first_name()
	{
		return user_first_name;
	}
	/**
	 * @return the user_given_name
	 */
	public String getUser_given_name()
	{
		return user_given_name;
	}
	/**
	 * @return the user_country
	 */
	public String getUser_country()
	{
		return user_country;
	}
	/**
	 * @return the user_phone
	 */
	public String getUser_phone()
	{
		return user_phone;
	}
	/**
	 * @return the user_address
	 */
	public String getUser_address()
	{
		return user_address;
	}
	/**
	 * @return the type_id
	 */
	public Integer getType_id()
	{
		return type_id;
	}
	/**
	 * @return the user_details
	 */
	public String getUser_details()
	{
		return user_details;
	}
	/**
	 * @param user_id the user_id to set
	 */
	public void setUser_id(Integer user_id)
	{
		this.user_id = user_id;
	}
	/**
	 * @param user_name the user_name to set
	 */
	public void setUser_name(String user_name)
	{
		this.user_name = user_name;
	}
	/**
	 * @param user_password the user_password to set
	 */
	public void setUser_password(String user_password)
	{
		this.user_password = user_password;
	}
	/**
	 * @param user_birthdate the user_birthdate to set
	 */
	public void setUser_birthdate(String user_birthdate)
	{
		this.user_birthdate = user_birthdate;
	}
	/**
	 * @param user_first_name the user_first_name to set
	 */
	public void setUser_first_name(String user_first_name)
	{
		this.user_first_name = user_first_name;
	}
	/**
	 * @param user_given_name the user_given_name to set
	 */
	public void setUser_given_name(String user_given_name)
	{
		this.user_given_name = user_given_name;
	}
	/**
	 * @param user_country the user_country to set
	 */
	public void setUser_country(String user_country)
	{
		this.user_country = user_country;
	}
	/**
	 * @param user_phone the user_phone to set
	 */
	public void setUser_phone(String user_phone)
	{
		this.user_phone = user_phone;
	}
	/**
	 * @param user_address the user_address to set
	 */
	public void setUser_address(String user_address)
	{
		this.user_address = user_address;
	}
	/**
	 * @param type_id the type_id to set
	 */
	public void setType_id(Integer type_id)
	{
		this.type_id = type_id;
	}
	/**
	 * @param user_details the user_details to set
	 */
	public void setUser_details(String user_details)
	{
		this.user_details = user_details;
	}
	
	public String generateInsert()
	{
		String query = "";
		
		int maxNo = MySQLUtil.queryMaxNo("user", "user_id");
		user_id = maxNo + 1;
		
		query += "INSERT INTO user VALUES(" + user_id
				 + ", '" + user_name + "',  '" 
				 + user_password + "',  '"
				 + user_birthdate + "',  '"
				 + user_first_name + "',  '"
				 + user_given_name + "',  '"
				 + user_country + "',  '"
				 + user_phone + "',  '"
				 + user_address + "',  "
				 + type_id + ",  "
				 + amount + ",  '"
				 + user_details + "',  '"
				+ img + "')";

		return query;
	}
	
	public String generateDelete()
	{
		String query = "";

		query += "DELETE FROM user "
				+ "WHERE user_id = " + user_id;

		return query;
	}
}
