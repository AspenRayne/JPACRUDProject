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
	public List<Restaurant> findByAddress(String address) {
		String queryString = "SELECT r FROM Restaurant r WHERE r.address like :address";
		List<Restaurant> restaurants = em.createQuery(queryString, Restaurant.class).setParameter("address", "%" + address + "%")
				.getResultList();
		return restaurants;

	}
	
	public List<Restaurant> findByVisited(Boolean visited){
		String queryString = "SELECT r FROM Restaurant r WHERE r.visited = :visited";
		List<Restaurant> restaurants = em.createQuery(queryString, Restaurant.class).setParameter("visited", visited).getResultList();
		return restaurants;
	}
	public List<Restaurant> findByName(String name){
		String queryString = "SELECT r FROM Restaurant r WHERE r.name like :name";
		List<Restaurant> restaurants = em.createQuery(queryString, Restaurant.class).setParameter("name", "%" + name + "%").getResultList();
		return restaurants;
	}

	@Override
	public Restaurant create(Restaurant restaurant) {
		em.persist(restaurant);

		return restaurant;
	}

	@Override
	public Restaurant update(int id, Restaurant restaurant) {
		Restaurant managed = em.find(Restaurant.class, id);
		if(managed != null){
			managed.setName(restaurant.getName());
			managed.setAddress(restaurant.getAddress());
			managed.setRating(restaurant.getRating());
			managed.setVisited(restaurant.getVisited());
			managed.setReview(restaurant.getReview());
		}
		return managed;
	}

	@Override
	public boolean deleteById(int id) {
		boolean successfullyDeleted = false;
		Restaurant deleted = em.find(Restaurant.class, id);
		if(deleted != null) {
			em.remove(deleted);
			successfullyDeleted = !em.contains(deleted);
		}
		return successfullyDeleted;
	}

}
