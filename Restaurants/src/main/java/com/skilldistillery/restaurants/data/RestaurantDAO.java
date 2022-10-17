package com.skilldistillery.restaurants.data;

import java.util.List;

import com.skilldistillery.restaurants.entities.Restaurant;

public interface RestaurantDAO {
	
	List<Restaurant> findAll();
	
	Restaurant findById(int id);
	
	List<Restaurant> findByAddress(String address);
	
	List<Restaurant> findByName(String name);
	
	List<Restaurant> findByVisited(Boolean visited);
	
	Restaurant create(Restaurant restaurant);
	
	Restaurant update(int id, Restaurant restaurant);
	
	boolean deleteById(int id);
}
