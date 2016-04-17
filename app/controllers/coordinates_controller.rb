class CoordinatesController < ApplicationController

  def create
  	address1 = params[:address1]
  	address2 = params[:address2]
  	response1 = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json",
  	 {:params => {'address' => address1,
  	 	 		  'key'=>'AIzaSyDazU0gvbBdl2aKSaBUMNHkqG6uVLYW7jI'}}
  	response2 = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json",
  	 {:params => {'address' => address2,
  	 	 		  'key'=>'AIzaSyDazU0gvbBdl2aKSaBUMNHkqG6uVLYW7jI'}}

	lat1 = JSON.parse(response1)["results"][0]["geometry"]["location"]["lat"]
	lng1 = JSON.parse(response1)["results"][0]["geometry"]["location"]["lng"]

	lat2 = JSON.parse(response2)["results"][0]["geometry"]["location"]["lat"]
	lng2 = JSON.parse(response2)["results"][0]["geometry"]["location"]["lng"]

	@distance = (Math.sqrt((lat2-lat1)*(lat2-lat1)+(lng2-lng1)*(lng2-lng1))*69).round(1)
	@lat_middle = ((lat1 + lat2) / 2).round(5)
	@lng_middle = ((lng1 + lng2) / 2).round(5)
	render :show

	response3 = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json",
	{:params => {'latlng' => "#{@lat_middle},#{@lng_middle}",
	'key'=>'AIzaSyDazU0gvbBdl2aKSaBUMNHkqG6uVLYW7jI'}}

  end
  
end