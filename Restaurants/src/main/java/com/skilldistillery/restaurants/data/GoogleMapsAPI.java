package com.skilldistillery.restaurants.data;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

import com.google.maps.GeoApiContext;
import com.google.maps.PlacesApi;
import com.google.maps.model.LatLng;
import com.google.maps.model.PlaceType;
import com.google.maps.model.PlacesSearchResponse;
import com.google.maps.model.PlacesSearchResult;

public class GoogleMapsAPI {
	private String apiKey = "AIzaSyAmGkfQ3PsKoNyWkVgEUuQ6nDPYJ0nDL_0";
	private GeoApiContext context = new GeoApiContext.Builder().apiKey(apiKey).build();
//	private LocationBiasPoint locationBias = new LocationBiasPoint(new LatLng(39.7392,-104.9903));
	private LatLng latlng = new LatLng(39.7392, -104.9903);

//	private final HttpClient client = new HttpURL();

	public void getPlaces(String name) throws Exception {
		URL url = new URL("https://maps.googleapis.com/maps/api/place/textsearch"
				+ "/json?location=39.7392,-104.9903&radius=50000&types=food&query=" + name + "&key=" + apiKey);

		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		try (BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()))) {
			for (String line; (line = reader.readLine()) != null;) {
				System.out.println(line);

			}
		}

	}

	public List<PlacesSearchResultOverride> getPlaces2(String name) throws Exception {

		PlacesSearchResponse response = PlacesApi.textSearchQuery(context, name).location(latlng).radius(50000)
				.type(PlaceType.RESTAURANT).await();
		
		if(response.toString()  == null) {
			System.out.println("NO Response");
			return null;
		}
		List<PlacesSearchResultOverride> places = new ArrayList<>();
		for (PlacesSearchResult candidate : response.results) {
			PlacesSearchResultOverride candidateOverride = new PlacesSearchResultOverride();
			candidateOverride.setName(candidate.name);
			candidateOverride.setFormattedAddress(candidate.formattedAddress);
			candidateOverride.setTypes(candidate.types);
//			System.out.println(candidate.name() + " " + candidate.formattedAddress());
			places.add(candidateOverride);

		}
		return places;
	}

}
