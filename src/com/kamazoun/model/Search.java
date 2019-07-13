package com.kamazoun.model;

import java.util.List;

import com.kamazoun.service.DbQuery;

public class Search
{

	public static List<Product> searchExactProducts(String searchTag)
	{
		List<Product> searchResults = DbQuery.retrieveAllProductWithCode(searchTag);
		searchResults.addAll(DbQuery.retrieveAllProductWithName(searchTag));
		
		searchResults.addAll(DbQuery.retrieveAllProductWithName("%" + searchTag + "%"));
		return searchResults;
	}
	
	public static List<Product> searchFuzzyProducts(String searchTag)
	{
		List<Product> searchResults = DbQuery.retrieveAllProductWithCode("%" + searchTag + "%");
		//searchResults.addAll(DbQuery.retrieveAllProductWithName("%" + searchTag + "%"));
		
		char[] arr = searchTag.toCharArray();
		
		for(int i = 0; i < searchTag.length(); i++)
		{
			//arr[i] = '%'; trop lourd
			arr[i] = '_';
			searchResults.addAll(DbQuery.retrieveAllProductWithCode(String.valueOf(arr)));
			searchResults.addAll(DbQuery.retrieveAllProductWithName(String.valueOf(arr)));
		}
		
		System.out.println(searchResults.size());
		return searchResults;
	}
}
