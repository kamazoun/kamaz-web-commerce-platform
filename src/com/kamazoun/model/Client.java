package com.kamazoun.model;

import com.kamazoun.dao.MySQLUtil;

public class Client
{

	private Integer client_id;
	private String first_name;
	private String given_name;
	private String card;
	private String password;
	private String phone;

	/**
	 * @return the client_id
	 */
	public Integer getClient_id()
	{
		return client_id;
	}

	/**
	 * @return the first_name
	 */
	public String getFirst_name()
	{
		return first_name;
	}

	/**
	 * @return the given_name
	 */
	public String getGiven_name()
	{
		return given_name;
	}

	/**
	 * @return the card
	 */
	public String getCard()
	{
		return card;
	}

	/**
	 * @return the password
	 */
	public String getPassword()
	{
		return password;
	}

	/**
	 * @return the phone
	 */
	public String getPhone()
	{
		return phone;
	}

	/**
	 * @return the address
	 */
	public String getAddress()
	{
		return address;
	}

	/**
	 * @param client_id
	 *            the client_id to set
	 */
	public void setClient_id(Integer client_id)
	{
		this.client_id = client_id;
	}

	/**
	 * @param first_name
	 *            the first_name to set
	 */
	public void setFirst_name(String first_name)
	{
		this.first_name = first_name;
	}

	/**
	 * @param given_name
	 *            the given_name to set
	 */
	public void setGiven_name(String given_name)
	{
		this.given_name = given_name;
	}

	/**
	 * @param card
	 *            the card to set
	 */
	public void setCard(String card)
	{
		this.card = card;
	}

	/**
	 * @param password
	 *            the password to set
	 */
	public void setPassword(String password)
	{
		this.password = password;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String phone)
	{
		this.phone = phone;
	}

	/**
	 * @param address
	 *            the address to set
	 */
	public void setAddress(String address)
	{
		this.address = address;
	}

	private String address;

	public String generateInsert()
	{
		String query = "";

		int maxNo = MySQLUtil.queryMaxNo("client", "client_id");
		client_id = maxNo + 1;

		query += "INSERT INTO client VALUES(" + client_id + ", '"
				+ first_name + "',  '" + given_name + "',  '" + card
				+ "',  '" + password + "',  '" + phone + "', '" + address + "')";

		return query;
	}
}
