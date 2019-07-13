package com.kamazoun.service;

import java.text.DateFormat;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Locale;
import java.util.TimeZone;

import com.kamazoun.dao.MySQLUtil;
import com.kamazoun.model.Buyer;
import com.kamazoun.model.Client;
import com.kamazoun.model.Manager;
import com.kamazoun.model.Notification;
import com.kamazoun.model.Product;
import com.kamazoun.model.ProductItem;
import com.kamazoun.model.SalesOrders;
import com.kamazoun.model.SalesOrdersItems;
import com.kamazoun.model.Seller;
import com.kamazoun.model.Session;
import com.kamazoun.model.User;
import com.kamazoun.model.UserRole;

public class DbInsert
{
	public static void insertUser(User user)
	{
		MySQLUtil.executeUpdate(user.generateInsert());
		switch (user.getType_id())
		{
			case 1:
				Manager manager = new Manager();
				manager.setUser_id(user.getUser_id());
				manager.setDetails(user.getUser_details());
				manager.setDepartment("default");
				manager.setPosition("default");
			
				MySQLUtil.executeUpdate(manager.generateInsert());
				
				UserRole ur = new UserRole();
				ur.setUser_name(user.getUser_name());
				ur.setRole_name("manager");
				MySQLUtil.executeUpdate(ur.generateInsert());
				break;

			case 2:
				Seller seller = new Seller();
				seller.setUser_id(user.getUser_id());
				seller.setCompany("personal");
				seller.setDetails(user.getUser_details());
				
				MySQLUtil.executeUpdate(seller.generateInsert());
				
				UserRole ur1 = new UserRole();
				ur1.setUser_name(user.getUser_name());
				ur1.setRole_name("seller");
				MySQLUtil.executeUpdate(ur1.generateInsert());
				break;

			case 3:
				Buyer buyer = new Buyer();
				buyer.setUser_id(user.getUser_id());
				buyer.setDetails(user.getUser_details());
				
				MySQLUtil.executeUpdate(buyer.generateInsert());
				
				UserRole ur11 = new UserRole();
				ur11.setUser_name(user.getUser_name());
				ur11.setRole_name("buyer");
				MySQLUtil.executeUpdate(ur11.generateInsert());
				break;
		}
	}
	
	public static void insertProduct(Product product)
	{
		MySQLUtil.executeUpdate(product.generateInsert());
	}
	
	public static void insertSession(Session session)
	{
		MySQLUtil.executeUpdate(session.generateInsert());
	}
	
	public static void insertClient(Client client)
	{
		MySQLUtil.executeUpdate(client.generateInsert());
	}
	
	public static void insertSalesOrder(SalesOrders sO)
	{
		MySQLUtil.executeUpdate(sO.generateInsert());
	}
	
	public static void insertSalesOrdersItems(SalesOrdersItems sOI)
	{
		MySQLUtil.executeUpdate(sOI.generateInsert());
	}
	
	public static void addSalesRecord(List<ProductItem> cart, int buyer_id, String details)
	{
		GregorianCalendar calendar = new GregorianCalendar(); 
		DateFormat formatter = DateFormat.getDateTimeInstance( DateFormat.FULL, DateFormat.FULL, Locale.US); 
		TimeZone timeZone = TimeZone.getTimeZone("CST"); 
		formatter.setTimeZone(timeZone);
		
		String dateTime = formatter.format(calendar.getTime());
		
		
		for(ProductItem u:cart)
		{
			MySQLUtil.executeUpdate(insertIntoSalesRecord(dateTime, u.getProduct_id(), u.getSeller_id(), buyer_id, u.getQuantity(), details));
		}
	}

	protected static String insertIntoSalesRecord(String date, int product_id, int seller_id, int buyer_id, int quantity, String details)
	{
		String query = "INSERT INTO sales_record VALUES('" + date
				+ "', " + product_id + ", " + seller_id  + ", " + buyer_id  + ", " + quantity  + ", '" + details + "')"; //le field 'details' est omis et sera dc null ds la db

		return query;
	}
	
	public static void insertNotification(Notification message)
	{
		MySQLUtil.executeUpdate(message.generateInsert());
	}
}
