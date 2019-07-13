package com.kamazoun.model;

import com.kamazoun.dao.MySQLUtil;

public class Notification
{
	 Integer notification_id;
	 Integer sender_id;
	 Integer receiver_id;
	 String message;
	 String time;
	 String details;
	 String seen;
	/**
	 * @return the notification_id
	 */
	public Integer getNotification_id()
	{
		return notification_id;
	}
	/**
	 * @return the sender_id
	 */
	public Integer getSender_id()
	{
		return sender_id;
	}
	/**
	 * @return the receiver_id
	 */
	public Integer getReceiver_id()
	{
		return receiver_id;
	}
	/**
	 * @return the message
	 */
	public String getMessage()
	{
		return message;
	}
	/**
	 * @return the time
	 */
	public String getTime()
	{
		return time;
	}
	/**
	 * @return the details
	 */
	public String getDetails()
	{
		return details;
	}
	/**
	 * @param notification_id the notification_id to set
	 */
	public void setNotification_id(Integer notification_id)
	{
		this.notification_id = notification_id;
	}
	/**
	 * @param sender_id the sender_id to set
	 */
	public void setSender_id(Integer sender_id)
	{
		this.sender_id = sender_id;
	}
	/**
	 * @param receiver_id the receiver_id to set
	 */
	public void setReceiver_id(Integer receiver_id)
	{
		this.receiver_id = receiver_id;
	}
	/**
	 * @param message the message to set
	 */
	public void setMessage(String message)
	{
		this.message = message;
	}
	/**
	 * @param time the time to set
	 */
	public void setTime(String time)
	{
		this.time = time;
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
		
		int maxNo = MySQLUtil.queryMaxNo("notification", "notification_id");
		notification_id = maxNo + 1;
		
		update += "INSERT INTO notification VALUES(" + notification_id
				 + ", " + sender_id + ",  " 
				 + receiver_id + ",  '"
				 + message + "',  '"
				 + time + "',  '"
				 + details + "',  '"
				 + seen + "')";
		
		return update;
	}
	
	public String generateDelete()
	{
		String update = "";
		
		update += "DELETE FROM notification "
				+ "WHERE notification_id = " + notification_id;
		
		return update;
	}
	
	public void setSeen(String seen)
	{
		this.seen = seen;
	}

	public String getSeen()
	{
		return seen;
	}
}