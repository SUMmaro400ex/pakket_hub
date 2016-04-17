class RequestsController < BaseController
  before_action :authenticate_user!, only: :create

  def search

    address = params["travel_plan"]["destination_attributes"]["address"]
    response = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json",
     {:params => {'address' => address,
            'key'=>'AIzaSyDazU0gvbBdl2aKSaBUMNHkqG6uVLYW7jI'}}
    lat = JSON.parse(response)["results"][0]["geometry"]["location"]["lat"]
    lng = JSON.parse(response)["results"][0]["geometry"]["location"]["lng"]
    params["travel_plan"]["destination_attributes"][:latitude] = lat
    params["travel_plan"]["destination_attributes"][:longitude] = lng
@lat = lat
@lng = lng

    @travel_plan = TravelPlan.new(params[:travel_plan])
    @results = PakketHub::Request.all.to_a
    @travel_plan.courier_id = current_user.try(:id)
    render :index
  end

  def new
    @request = Request.new
  end

  def show
    redirect_to root
  end

  def create
    puts "sergii"
    Request.create! params[:request]
    redirect_to root_path
  end

end
