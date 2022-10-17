package com.skilldistillery.restaurants.data;


import java.util.Arrays;

import com.google.maps.model.PlacesSearchResult;

public class PlacesSearchResultOverride extends PlacesSearchResult{

	private static final long serialVersionUID = 1L;

	private String name;

	public String formattedAddress;
	
	public String types[];

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getFormattedAddress() {
		return formattedAddress;
	}

	public void setFormattedAddress(String formattedAddress) {
		this.formattedAddress = formattedAddress;
	}

	public String[] getTypes() {
		return types;
	}

	public void setTypes(String[] types) {
		this.types = types;
	}

	@Override
	public String toString() {
		return "PlacesSearchResultOverride [name=" + name + ", formattedAddress=" + formattedAddress + ", types="
				+ Arrays.toString(types) + "]";
	}
	
	

}
