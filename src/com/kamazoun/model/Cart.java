package com.kamazoun.model;

import java.util.List;

public class Cart
{

	public static List<ProductItem> insertIntoCart(List<ProductItem> cart,
			ProductItem productItem)
	{
		for (int i = 0; i < cart.size(); i++)
		{
			if (cart.get(i).getProduct_id() == productItem
					.getProduct_id())
			{
				if (cart.get(i)
						.getQuantity_available() >= (productItem
								.getQuantity()))
				{
					cart.get(i).setQuantity(cart.get(i).getQuantity()
							+ productItem.getQuantity());// solve it on the page
															// by javascript
					/*
					 * ici on pourrait faire DbUpdate.reduceProductQuantity(int
					 * product_id, int minusQuantity), mais seulement si on
					 * etait sur que le user procedera a l'achat. Donc il vaut
					 * mieux notifier la diminution des produits a l'achat ds
					 * Pay
					 */
				}
				return cart;
			}
		}
		
		cart.add(productItem);
		return cart;
	}
}
