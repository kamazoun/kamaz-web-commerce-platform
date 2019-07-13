package com.kamazoun.service;

import com.kamazoun.dao.MySQLUtil;

public class DbUpdate
{

	public static void reduceProductQuantity(int product_id,
			int minusQuantity)
	{
		String sql = "UPDATE product" + " SET quantity_available = "
				+ (DbQuery.getProductAvailableQuantity(product_id)
						- minusQuantity)
				+ " WHERE product_id = " + product_id;

		MySQLUtil.executeUpdate(sql);
		try
		{
			Thread.sleep(1000); // to avoid that EventNotification reads the
								// value of available_quantity before the update
								// has been executed
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		EventNotification.notifyProductQuantityDecrease(product_id,
				minusQuantity);
	}

	public static void IncreaseProductSight(int product_id)
	{
		String sql = "UPDATE product" + " SET sight = "
				+ (DbQuery.getProductSight(product_id) + 1)
				+ " WHERE product_id = " + product_id;

		MySQLUtil.executeUpdate(sql);
		try
		{
			Thread.sleep(1000); // to avoid that EventNotification reads the
								// value of available_quantity before the update
								// has been executed
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void reduceUserAmountOf(int user_id, double amount)
	{
		String sql = "UPDATE user" + " SET amount = "
				+ (DbQuery.getUserAmountFromId(user_id) - amount)
				+ " WHERE user_id = " + user_id;

		MySQLUtil.executeUpdate(sql);
		try
		{
			Thread.sleep(1000); // to avoid that EventNotification reads the
								// value of available_quantity before the update
								// has been executed
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		/*
		 * EventNotification.notifyProductQuantityDecrease(product_id,
		 * minusQuantity); Peut etre enregistrer l'evenement dans session ou ds
		 * le user details
		 */
	}

	public static void IncreaseBanqueAmount(int amount)
	{
		String sql = "UPDATE banque" + " SET amount = "
				+ (DbQuery.getBanqueAmount() + amount);

		MySQLUtil.executeUpdate(sql);

		try
		{
			Thread.sleep(1000); // to avoid that EventNotification reads the
								// value of available_quantity before the update
								// has been executed
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void ReduceBanqueAmount(int amount)
	{
		String sql = "UPDATE banque" + " SET amount = "
				+ (DbQuery.getBanqueAmount() - amount);

		MySQLUtil.executeUpdate(sql);

		try
		{
			Thread.sleep(1000); // to avoid that EventNotification reads the
								// value of available_quantity before the update
								// has been executed
		}
		catch (InterruptedException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void changeUserProfilePhoto(String user_id, String img)
	{
		String sql = "UPDATE user" + " SET img = '" + img
				+ "' WHERE user_id = " + user_id;

		MySQLUtil.executeUpdate(sql);
	}
	
	
	public static void checkMessageAsSeen(String notification_id)
	{
		String sql = "UPDATE notification" + " SET seen = 'true' "
				+ "WHERE notification_id = " + notification_id;

		MySQLUtil.executeUpdate(sql);
	}
}
