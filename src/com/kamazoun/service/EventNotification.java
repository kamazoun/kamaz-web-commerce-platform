package com.kamazoun.service;

import java.util.Calendar;
import java.util.GregorianCalendar;

import com.kamazoun.dao.MySQLUtil;

public class EventNotification
{

	/**
	 * Notify that the product_id's available quantity has diminished from quantity
	 * */
	public static void notifyProductQuantityDecrease(int product_id,
			int quantity)
	{
		int maxno = MySQLUtil.queryMaxNo("notification",
				"notification_id");
		maxno++;
		String message = "Product id: " + product_id
				+ " 's quantity diminished of " + quantity;
		String details = "The available quantity for product: "
				+ DbQuery.getProductNameFromId(product_id)
				+ ", from seller: "
				+ DbQuery.getProductSeller(product_id) + ", is: "
				+ DbQuery.getProductAvailableQuantity(product_id)
				+ " and the number of times the product has been viewed at this instant is: "
				+ DbQuery.getProductSightNumber(product_id);

		String sql = "INSERT INTO notification" + "VALUES (" + maxno
				+ ", " + DbQuery.getProductSeller(product_id) + ", '"
				+ message + "', '" + getCurrentTime() + "', '"
				+ details + "')";

		MySQLUtil.executeUpdate(sql);
	}

	/**
	 * Return the current time as string in the format: yyyy-mm-dd hh:mm:ss.ms
	 * */
	public static String getCurrentTime()
	{
		String time = "";

		Calendar calendar = new GregorianCalendar();

		time += calendar.get(Calendar.YEAR) + "-";
		time += (calendar.get(Calendar.MONTH) + 1) + "-";
		time += calendar.get(Calendar.DATE) + " ";
		time += calendar.get(Calendar.HOUR_OF_DAY) + ":";
		time += calendar.get(Calendar.MINUTE) + ":";
		time += calendar.get(Calendar.SECOND) + ".";
		time += calendar.get(Calendar.MILLISECOND) + "";

		return time;
	}
	
	/**
	 * Notify that an order has not be able to be filleb because quantity insufficient
	 * (Normally should not happen because user cannot order more than quantity available)
	 * */
	public static void notifyProductQuantityUnsufficient()
	{
		
	}
}
