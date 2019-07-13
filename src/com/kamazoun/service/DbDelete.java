package com.kamazoun.service;

import com.kamazoun.dao.MySQLUtil;
import com.kamazoun.model.Buyer;
import com.kamazoun.model.Manager;
import com.kamazoun.model.Seller;
import com.kamazoun.model.User;
import com.kamazoun.model.UserRole;

public class DbDelete
{
	
	public static void deleteUser(String user_id)
	{	
		User user = DbQuery.retrieveUser(Integer.parseInt(user_id));
		switch (user.getType_id())
		{
			case 1:
				UserRole ur = new UserRole();
				ur.setUser_name(user.getUser_name());
				ur.setRole_name("manager");
				MySQLUtil.executeUpdate(ur.generateDelete());
				
				Manager manager = new Manager();
				manager.setUser_id(user.getUser_id());
				manager.setDetails(user.getUser_details());
				manager.setDepartment("default");
				manager.setPosition("default");
				MySQLUtil.executeUpdate(manager.generateDelete());
				break;

			case 2:
				UserRole ur1 = new UserRole();
				ur1.setUser_name(user.getUser_name());
				ur1.setRole_name("seller");
				MySQLUtil.executeUpdate(ur1.generateDelete());
				
				Seller seller = new Seller();
				seller.setUser_id(user.getUser_id());
				seller.setCompany("personal");
				seller.setDetails(user.getUser_details());
				MySQLUtil.executeUpdate(seller.generateDelete());
				break;

			case 3:
				UserRole ur11 = new UserRole();
				ur11.setUser_name(user.getUser_name());
				ur11.setRole_name("manager");
				MySQLUtil.executeUpdate(ur11.generateDelete());
				
				Buyer buyer = new Buyer();
				buyer.setUser_id(user.getUser_id());
				buyer.setDetails(user.getUser_details());
				MySQLUtil.executeUpdate(buyer.generateDelete());
				break;
		}
		
		MySQLUtil.executeUpdate(user.generateDelete());
	}

}
