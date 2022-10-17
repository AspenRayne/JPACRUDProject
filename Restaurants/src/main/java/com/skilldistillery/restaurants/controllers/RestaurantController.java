package com.skilldistillery.restaurants.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.restaurants.data.GoogleMapsAPI;
import com.skilldistillery.restaurants.data.PlacesSearchResultOverride;
import com.skilldistillery.restaurants.data.RestaurantDAO;
import com.skilldistillery.restaurants.entities.Restaurant;

@Controller
public class RestaurantController {
	@Autowired
	private RestaurantDAO dao;

	private GoogleMapsAPI googleApi = new GoogleMapsAPI();

	private Map<String, PlacesSearchResultOverride> userSelectionMap;

	@RequestMapping(path = { "/", "home.do" })
	public String index(Model model) {

		return "index";
	}

	@RequestMapping(path = "createPage.do")
	public String create(Model model) {
		model.addAttribute("searchResults", null);
		return "createForm";
	}

	@RequestMapping(path = "showAll.do")
	public String showAll(Model model) {
		model.addAttribute("restaurants", dao.findAll());
		return "restaurant/show";
	}

	@RequestMapping(path = "getRestaurant.do", method = RequestMethod.GET)
	public ModelAndView getRestaurant(@RequestParam("id") int id) {
		ModelAndView mv = new ModelAndView();

		mv.addObject("restaurant", dao.findById(id));

		mv.setViewName("restaurant/show");
		return mv;
	}

	@RequestMapping(path = "searchRestaurant.do", method = RequestMethod.POST)
	public ModelAndView searchRestaurant(String name) {
		ModelAndView mv = new ModelAndView();

		mv.setViewName("createForm");
		try {
			List<PlacesSearchResultOverride> resultList = googleApi.getPlaces2(name);
			this.userSelectionMap = new HashMap<>();
			for (PlacesSearchResultOverride place : resultList) {
				userSelectionMap.put(place.getFormattedAddress(), place);
			}
			mv.addObject("searchResults", resultList);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return mv;
	}

	@RequestMapping(path = "placeSelection.do", method = RequestMethod.POST)
	public ModelAndView placeSelection(@RequestParam("selectedResult") String address) {
		ModelAndView mv = new ModelAndView();
		PlacesSearchResultOverride place = this.userSelectionMap.get(address);
		List<Restaurant> restaurant = dao.findByAddress(place.getFormattedAddress());
		if (!restaurant.isEmpty()) {
			mv.addObject("alreadyCreated", "This restaurant has already been created. Please try another.");
		} else {
			mv.addObject("selectedRestaurant", place);
		}
		mv.setViewName("createForm");
		return mv;
	}

	@RequestMapping(path = "createRestaurant.do", method = RequestMethod.POST)
	public ModelAndView createRestaurant(Restaurant restaurant, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		restaurant = dao.create(restaurant);
		redir.addFlashAttribute("restaurant", restaurant);
		mv.setViewName("redirect:restaurantCreated.do");
		return mv;
	}

	@RequestMapping(path = "restaurantCreated.do", method = RequestMethod.GET)
	public ModelAndView filmAdded() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("restaurant/showOne");
		return mv;

	}

	@RequestMapping(path = "updateDetails.do", method = RequestMethod.GET)
	public ModelAndView updateDetails(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("updateRestaurant", dao.findById(id));
		mv.setViewName("updateForm");
		return mv;
	}

	@RequestMapping(path = "updateRestaurant.do", method = RequestMethod.POST)
	public ModelAndView updateRestaurant(int id, Restaurant restaurant, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		restaurant = dao.update(id, restaurant);
		redir.addFlashAttribute("restaurant", dao.update(id, restaurant));
		mv.setViewName("redirect:restaurantUpdated.do");
		return mv;
	}

	@RequestMapping(path = "restaurantUpdated.do", method = RequestMethod.GET)
	public ModelAndView filmUpdated() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("restaurant/showOne");
		return mv;
	}

	@RequestMapping(path = "removeDetails.do", method = RequestMethod.GET)
	public ModelAndView removeDetails(int id) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("removeRestaurant", dao.findById(id));
		mv.setViewName("removeForm");
		return mv;
	}

	@RequestMapping(path = "removeRestaurant.do", method = RequestMethod.GET)
	public ModelAndView removeRestaurant(int id) {
		ModelAndView mv = new ModelAndView();
		boolean deleted = dao.deleteById(id);
		mv.addObject("removeRestaurant", deleted);
		mv.setViewName("restaurantRemoved");
		return mv;
	}
	
	@RequestMapping(path="sortByName.do")
	public ModelAndView sortByName(String name) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("restaurants", dao.findByName(name));
		mv.setViewName("restaurant/show");
		return mv;
	}
	@RequestMapping(path="sortByAddress.do")
	public ModelAndView sortByAddress(String address) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("restaurants", dao.findByAddress(address));
		mv.setViewName("restaurant/show");
		return mv;
	}
	@RequestMapping(path="sortByVisited.do")
	public ModelAndView sortByName(Boolean visited) {
		ModelAndView mv = new ModelAndView();
		mv.addObject("restaurants", dao.findByVisited(visited));
		mv.setViewName("restaurant/show");
		return mv;
	}
}
