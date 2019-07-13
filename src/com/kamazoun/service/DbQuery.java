package com.kamazoun.service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.swing.JOptionPane;

import com.kamazoun.dao.MySQLUtil;
import com.kamazoun.model.BuyersPurchases;
import com.kamazoun.model.Notification;
import com.kamazoun.model.Product;
import com.kamazoun.model.ProductItem;
import com.kamazoun.model.SalesOrders;
import com.kamazoun.model.SalesRecord;
import com.kamazoun.model.SellersSales;
import com.kamazoun.model.User;
import com.mysql.jdbc.ResultSetMetaData;

public class DbQuery
{

	public static List<Product> getRecentProducts()
	{
		int numb = MySQLUtil.queryMaxNo("product", "product_id");
		if (numb <= 40)
		{
			return getAllProducts();
		}
		else
		{
			List<Product> productList = new ArrayList<Product>();
			for (int i = 0; i < 40; i++)
			{
				productList.add(retrieveProduct(numb - i));
			}

			return productList;
		}
	}

	public static List<Product> getAllProducts()
	{
		List<Product> productList = new ArrayList<Product>();
		for (int i = 1; i <= MySQLUtil.queryMaxNo("product",
				"product_id"); i++)
		{
			productList.add(retrieveProduct(i));
		}
		return productList;
	}

	public static String getProductImageFromId(String product_id)
	{
		String query = "SELECT img" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Integer getProductPriceFromId(String product_id)
	{
		String query = "SELECT price" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return Integer.parseInt(rs.getString(1));
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public static Product retrieveProduct(int product_id)
	{
		String query = "SELECT *" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		Product product = new Product();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 9)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					product.setProduct_id(rs.getInt(1));
					product.setSeller_id(rs.getInt(2));
					product.setProduct_code(rs.getString(3));
					product.setQuantity_available(rs.getInt(4));
					product.setDetails(rs.getString(5));
					product.setSight(rs.getInt(6));
					product.setImg(rs.getString(7));
					product.setPrice(rs.getDouble(8));
					product.setProduct_name(rs.getString(9));
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return product;
	}

	/**
	 * Create a return a productItem that has the same fields than the product
	 * of id product_id, and with the quantity to buy set to quantity Returns
	 * null if the quantity to buy is greater than the available quantity
	 */
	public static ProductItem getProductItemFromProduct(
			int product_id, int quantity)
	{
		ProductItem productItem = new ProductItem(
				retrieveProduct(product_id));
		if (quantity <= productItem.getQuantity_available())
			productItem.setQuantity(quantity);
		else
			productItem = null;

		return productItem;
	}

	public static String getProductNameFromId(int product_id)
	{
		String query = "SELECT product_name" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getProductCodeFromId(int product_id)
	{
		String query = "SELECT product_code" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Integer getProductAvailableQuantity(int product_id)
	{
		String query = "SELECT quantity_available" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getInt(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Integer getProductSight(int product_id)
	{
		String query = "SELECT sight" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getInt(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Integer getProductSeller(int product_id)
	{
		String query = "SELECT seller_id" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getInt(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Integer getProductSightNumber(int product_id)
	{
		String query = "SELECT sight" + " FROM product"
				+ " WHERE product_id = " + product_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getInt(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static List<Product> retrieveAllProductWithCode(
			String product_code)
	{
		String query = "SELECT *" + " FROM product"
				+ " WHERE product_code = '" + product_code + "'"
				+ "OR product_code LIKE '" + product_code + "'";

		ResultSet rs = MySQLUtil.executeQuery(query);
		Product product = null;
		List<Product> productList = new ArrayList<Product>();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 9)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					product = new Product();
					product.setProduct_id(rs.getInt(1));
					product.setSeller_id(rs.getInt(2));
					product.setProduct_code(rs.getString(3));
					product.setQuantity_available(rs.getInt(4));
					product.setDetails(rs.getString(5));
					product.setSight(rs.getInt(6));
					product.setImg(rs.getString(7));
					product.setPrice(rs.getDouble(8));
					product.setProduct_name(rs.getString(9));
					productList.add(product);
					product = null;
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productList;
	}

	public static List<Product> retrieveAllProductWithName(
			String product_name)
	{
		String query = "SELECT *" + " FROM product"
				+ " WHERE product_name = '" + product_name + "'"
				+ "OR product_name LIKE '" + product_name + "'";

		ResultSet rs = MySQLUtil.executeQuery(query);
		Product product = null;
		List<Product> productList = new ArrayList<Product>();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 9)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					product = new Product();
					product.setProduct_id(rs.getInt(1));
					product.setSeller_id(rs.getInt(2));
					product.setProduct_code(rs.getString(3));
					product.setQuantity_available(rs.getInt(4));
					product.setDetails(rs.getString(5));
					product.setSight(rs.getInt(6));
					product.setImg(rs.getString(7));
					product.setPrice(rs.getDouble(8));
					product.setProduct_name(rs.getString(9));
					productList.add(product);
					product = null;
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productList;
	}

	/**
	 * Return the name of all kind of users: managers, sellers and buyers
	 */
	public static String getUserNameFromId(int user_id)
	{
		String query = "SELECT user_name" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserIdFromUserName(String user_name)
	{
		String query = "SELECT user_id" + " FROM user"
				+ " WHERE user_name = '" + user_name + "'";

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static Integer getUserAmountFromId(int user_id)
	{
		String query = "SELECT amount" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getInt(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserAddressFromId(int user_id)
	{
		String query = "SELECT user_address" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserPhoneFromId(int user_id)
	{
		String query = "SELECT user_phone" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserDetailsFromId(int user_id)
	{
		String query = "SELECT user_details" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserImageFromId(int user_id)
	{
		String query = "SELECT img" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserFirstnameFromId(int user_id)
	{
		String query = "SELECT user_first_name" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserGivennameFromId(int user_id)
	{
		String query = "SELECT user_given_name" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserAvatarnameFromId(int user_id)
	{
		String query = "SELECT user_name" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static String getUserTypeIdFromId(int user_id)
	{
		String query = "SELECT type_id" + " FROM user"
				+ " WHERE user_id = " + user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static List<User> getAllUsers()
	{
		List<User> userList = new ArrayList<User>();

		/*
		 * Cette methode pose probleme dans le cas ou par ex il y a le user_id
		 * 1, mais pas le user_id 2 et ensuite le user_id 3 for(int i = 1; i <=
		 * MySQLUtil.queryMaxNo("user", "user_id"); i++) {
		 * userList.add(retrieveUser(i));
		 * //System.out.println("Number of users in db: " + i); }
		 */

		String query = "SELECT *" + " FROM user";

		ResultSet rs = MySQLUtil.executeQuery(query);

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 13)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				User user = new User();
				while (rs.next())
				{
					user = new User();
					user.setUser_id(rs.getInt(1));
					user.setUser_name(rs.getString(2));
					user.setUser_password(rs.getString(3));
					user.setUser_birthdate(rs.getString(4));
					user.setUser_first_name(rs.getString(5));
					user.setUser_given_name(rs.getString(6));
					user.setUser_country(rs.getString(7));
					user.setUser_phone(rs.getString(8));
					user.setUser_address(rs.getString(9));
					user.setType_id(rs.getInt(10));
					user.setAmount(rs.getInt(11));
					user.setUser_details(rs.getString(12));
					user.setImg(rs.getString(13));

					userList.add(user);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return userList;
	}

	public static User retrieveUser(int user_id)
	{
		String query = "SELECT *" + " FROM user" + " WHERE user_id = "
				+ user_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		User user = new User();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 13)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					user.setUser_id(rs.getInt(1));
					user.setUser_name(rs.getString(2));
					user.setUser_password(rs.getString(3));
					user.setUser_birthdate(rs.getString(4));
					user.setUser_first_name(rs.getString(5));
					user.setUser_given_name(rs.getString(6));
					user.setUser_country(rs.getString(7));
					user.setUser_phone(rs.getString(8));
					user.setUser_address(rs.getString(9));
					user.setType_id(rs.getInt(10));
					user.setAmount(rs.getInt(11));
					user.setUser_details(rs.getString(12));
					user.setImg(rs.getString(13));
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return user;
	}

	public static String getUserRole(String user_name)
	{
		String query = "SELECT role_name" + " FROM user_role"
				+ " WHERE user_name = '" + user_name + "'";

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	public static String getPasswordOf(String user_name)
	{
		// TODO Auto-generated method stub
		String select = "user_password";
		String from = "user";
		String where = "user_name = '" + user_name + "'";

		ResultSet rs = MySQLUtil.returnBasicQuery(select, from,
				where);

		try
		{
			while (rs.next())
			{
				return rs.getString(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	public static List<SalesOrders> getAllSalesOrders()
	{
		List<SalesOrders> sOList = new ArrayList<SalesOrders>();
		for (int i = 1; i <= MySQLUtil.queryMaxNo("salesorder",
				"salesorder_id"); i++)
		{
			sOList.add(retrieveSalesOrders(i));
		}
		return sOList;
	}

	public static SalesOrders retrieveSalesOrders(int salesorder_id)
	{
		String query = "SELECT *" + " FROM salesorder"
				+ " WHERE salesorder_id = " + salesorder_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		SalesOrders sO = new SalesOrders();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 3)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					sO.setSalesorder_id(rs.getInt(1));
					sO.setClient_id(rs.getInt(2));
					sO.setSession_id(rs.getInt(3));
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sO;
	}

	public static Integer getBanqueAmount()
	{
		String query = "SELECT amount" + " FROM banque";

		ResultSet rs = MySQLUtil.executeQuery(query);
		try
		{
			while (rs.next())
			{
				return rs.getInt(1);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public static List<Product> getAllProductsFromSeller(
			int seller_id)
	{
		String query = "SELECT *" + " FROM product"
				+ " WHERE seller_id = " + seller_id;

		ResultSet rs = MySQLUtil.executeQuery(query);
		Product product = null;
		List<Product> productList = new ArrayList<Product>();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 9)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					product = new Product();
					product.setProduct_id(rs.getInt(1));
					product.setSeller_id(rs.getInt(2));
					product.setProduct_code(rs.getString(3));
					product.setQuantity_available(rs.getInt(4));
					product.setDetails(rs.getString(5));
					product.setSight(rs.getInt(6));
					product.setImg(rs.getString(7));
					product.setPrice(rs.getDouble(8));
					product.setProduct_name(rs.getString(9));
					productList.add(product);
					product = null;
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return productList;
	}

	public static List<Notification> getAllMessagesSentByUser(
			String sender_id)
	{
		List<Notification> notificationList = new ArrayList<Notification>();

		String query = "SELECT *" + " FROM notification"
				+ " WHERE sender_id='" + sender_id + "'";

		ResultSet rs = MySQLUtil.executeQuery(query);

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 7)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				Notification message = new Notification();
				while (rs.next())
				{
					message = new Notification();
					message.setNotification_id(rs.getInt(1));
					message.setSender_id(rs.getInt(2));
					message.setReceiver_id(rs.getInt(3));
					message.setMessage(rs.getString(4));
					message.setTime(rs.getString(5));
					message.setDetails(rs.getString(6));
					message.setSeen(rs.getString(7));

					notificationList.add(message);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return notificationList;
	}

	public static List<Notification> getAllMessagesReceivedByUser(
			String receiver_id)
	{
		List<Notification> notificationList = new ArrayList<Notification>();

		String query = "SELECT *" + " FROM notification"
				+ " WHERE receiver_id='" + receiver_id + "'";

		ResultSet rs = MySQLUtil.executeQuery(query);

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 7)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				Notification message = new Notification();
				while (rs.next())
				{
					message = new Notification();
					message.setNotification_id(rs.getInt(1));
					message.setSender_id(rs.getInt(2));
					message.setReceiver_id(rs.getInt(3));
					message.setMessage(rs.getString(4));
					message.setTime(rs.getString(5));
					message.setDetails(rs.getString(6));
					message.setSeen(rs.getString(7));

					notificationList.add(message);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return notificationList;
	}

	public static Notification retrieveNotification(
			String notification_id)
	{
		String query = "SELECT *" + " FROM notification"
				+ " WHERE notification_id = " + notification_id;

		ResultSet rs = MySQLUtil.executeQuery(query);

		Notification message = new Notification();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 7)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					message = new Notification();
					message.setNotification_id(rs.getInt(1));
					message.setSender_id(rs.getInt(2));
					message.setReceiver_id(rs.getInt(3));
					message.setMessage(rs.getString(4));
					message.setTime(rs.getString(5));
					message.setDetails(rs.getString(6));
					message.setSeen(rs.getString(7));

				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return message;
	}

	public static List<SalesRecord> getAllBuyingReportForUser(
			String buyer_id)
	{
		List<SalesRecord> buyingReportList = new ArrayList<SalesRecord>();

		String query = "SELECT *" + " FROM sales_record"
				+ " WHERE buyer_id=" + buyer_id;

		ResultSet rs = MySQLUtil.executeQuery(query);

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 6)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				SalesRecord buyingReport = new SalesRecord();
				while (rs.next())
				{
					buyingReport = new SalesRecord();
					buyingReport.setDate_time(rs.getString(1));
					buyingReport.setProduct_id(rs.getInt(2));
					buyingReport.setSeller_id(rs.getInt(3));
					buyingReport.setBuyer_id(rs.getInt(4));
					buyingReport.setQuantity(rs.getInt(5));
					buyingReport.setDetails(rs.getString(6));
					buyingReportList.add(buyingReport);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return buyingReportList;
	}

	public static List<SalesRecord> getAllSalesReportForSeller(
			String seller_id)
	{
		List<SalesRecord> salesReportList = new ArrayList<SalesRecord>();

		String query = "SELECT *" + " FROM sales_record"
				+ " WHERE seller_id=" + seller_id;

		ResultSet rs = MySQLUtil.executeQuery(query);

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 6)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				SalesRecord salesReport = new SalesRecord();
				while (rs.next())
				{
					salesReport = new SalesRecord();
					salesReport.setDate_time(rs.getString(1));
					salesReport.setProduct_id(rs.getInt(2));
					salesReport.setSeller_id(rs.getInt(3));
					salesReport.setBuyer_id(rs.getInt(4));
					salesReport.setQuantity(rs.getInt(5));
					salesReport.setDetails(rs.getString(6));
					salesReportList.add(salesReport);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return salesReportList;
	}

	public static List<String> getAllProductsImages()
	{
		List<String> imageList = new ArrayList<String>();

		String query = "SELECT img" + " FROM product";

		ResultSet rs = MySQLUtil.executeQuery(query);

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 1)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					imageList.add(rs.getString(1));
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return imageList;
	}

	public static List<SellersSales> getSellersSales()
	{
		String query = "Select seller_id, COUNT(quantity) "
				+ "FROM sales_record " + "GROUP BY seller_id";

		ResultSet rs = MySQLUtil.executeQuery(query);
		List<SellersSales> sellerIdList = new ArrayList<SellersSales>();
		SellersSales ss = new SellersSales();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 2)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					ss = new SellersSales();
					ss.setSeller_id(rs.getString(1));
					ss.setQuantity(rs.getString(2));
					sellerIdList.add(ss);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return sellerIdList;
	}
	
	
	public static List<BuyersPurchases> getBuyersPurchases()
	{
		String query = "Select buyer_id, COUNT(quantity) "
				+ "FROM sales_record " + "GROUP BY buyer_id";

		ResultSet rs = MySQLUtil.executeQuery(query);
		List<BuyersPurchases> buyerIdList = new ArrayList<BuyersPurchases>();
		BuyersPurchases bp = new BuyersPurchases();

		try
		{
			ResultSetMetaData rsmd = (ResultSetMetaData) rs
					.getMetaData();
			if (rsmd.getColumnCount() != 2)
			{
				JOptionPane.showMessageDialog(null,
						"column count incorrect");
			}
			else
			{
				while (rs.next())
				{
					bp = new BuyersPurchases();
					bp.setBuyer_id(rs.getString(1));
					bp.setQuantity(rs.getString(2));
					buyerIdList.add(bp);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return buyerIdList;
	}

}
