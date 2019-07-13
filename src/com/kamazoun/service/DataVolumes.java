package com.kamazoun.service;

import java.util.ArrayList;
import java.util.List;

import com.kamazoun.model.BuyersPurchases;
import com.kamazoun.model.SellersSales;

public class DataVolumes
{

	/**
	 * Renvoye la liste des id des meilleurs sellers
	 * */
	public static SellersSales getBestSeller()
	{
		List<SellersSales> sellerIdList = DbQuery.getSellersSales();
		SellersSales sellerId = new SellersSales();
		
		sellerId.setSeller_id("0");
		sellerId.setQuantity("0");
		
		for(int i = 0; i < sellerIdList.size(); i++)
		{
			int tempQuantity = Integer.parseInt(sellerIdList.get(i).getQuantity());
			int quantity = Integer.parseInt(sellerId.getQuantity());
			if(tempQuantity >= quantity)
			{
				sellerId.setQuantity(tempQuantity + "");
				sellerId.setSeller_id(sellerIdList.get(i).getSeller_id());
			}
		}
		
		return sellerId;
	}
	
	
	/**
	 * Renvoye la liste des id des meilleurs buyers
	 * */
	public static BuyersPurchases getBestBuyer()
	{
		List<BuyersPurchases> buyerIdList = DbQuery.getBuyersPurchases();
		BuyersPurchases buyerId = new BuyersPurchases();
		
		buyerId.setBuyer_id("0");
		buyerId.setQuantity("0");
		
		for(int i = 0; i < buyerIdList.size(); i++)
		{
			int tempQuantity = Integer.parseInt(buyerIdList.get(i).getQuantity());
			int quantity = Integer.parseInt(buyerId.getQuantity());
			if(tempQuantity >= quantity)
			{
				buyerId.setQuantity(tempQuantity + "");
				buyerId.setBuyer_id(buyerIdList.get(i).getBuyer_id());
			}
		}
		
		return buyerId;
	}
}
