package com.skilldistillery.restaurants.data;

import java.util.List;

import com.skilldistillery.restaurants.entities.Restaurant;

public interface RestaurantDAO {
	
	List<Restaurant> findAll();
	
	Restaurant findById(int id);
	
	Restaurant create(Restaurant restaurant);
	
	Restaurant update(int id, Restaurant restaurant);
	
	boolean deleteById(int id);
}
