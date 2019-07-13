package com.kamazoun.model;

public class UserType
{

	private Integer type_id;
	private String role_name;
	/**
	 * @return the type_id
	 */
	public Integer getType_id()
	{
		return type_id;
	}
	/**
	 * @return the role_name
	 */
	public String getRole_name()
	{
		return role_name;
	}
	/**
	 * @param type_id the type_id to set
	 */
	public void setType_id(Integer type_id)
	{
		this.type_id = type_id;
	}
	/**
	 * @param role_name the role_name to set
	 */
	public void setRole_name(String role_name)
	{
		this.role_name = role_name;
	}
}
