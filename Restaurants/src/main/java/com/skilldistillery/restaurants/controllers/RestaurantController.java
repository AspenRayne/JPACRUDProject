package com.skilldistillery.restaurants.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.restaurants.data.RestaurantDAO;

@Controller
public class RestaurantController {
	@Autowired
	private RestaurantDAO dao;
	
	@RequestMapping(path= {"/","home.do"})
	public String index(Model model) {
		model.addAttribute("restaurants", dao.findAll());
		return "index";
	}
}
