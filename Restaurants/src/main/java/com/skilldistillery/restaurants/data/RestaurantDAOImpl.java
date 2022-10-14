package com.skilldistillery.restaurants.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.restaurants.entities.Restaurant;

@Service
@Transactional
public class RestaurantDAOImpl implements RestaurantDAO {
	
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Restaurant> findAll() {
		String queryString = "SELECT r FROM Restaurant r";
		List<Restaurant> restaurants = em.createQuery(queryString, Restaurant.class).getResultList();
		return restaurants;
	}

	@Override
	public Restaurant findById(int id) {
		return em.find(Restaurant.class, id);
		
	}

	@Override
	public Restaurant create(Restaurant restaurant) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Restaurant update(int id, Restaurant restaurant) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean deleteById(int id) {
		// TODO Auto-generated method stub
		return false;
	}

}
