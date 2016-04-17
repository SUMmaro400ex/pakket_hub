class TravelPlansController < BaseController
  before_action :authenticate_user!, only: :create

  def search
    address = params["request"]["location_attributes"]["address"]
    response = RestClient.get "https://maps.googleapis.com/maps/api/geocode/json",
     {:params => {'address' => address,
            'key'=>'AIzaSyDazU0gvbBdl2aKSaBUMNHkqG6uVLYW7jI'}}
    lat = JSON.parse(response)["results"][0]["geometry"]["location"]["lat"]
    lng = JSON.parse(response)["results"][0]["geometry"]["location"]["lng"]
    params["request"]["location_attributes"][:latitude] = lat
    params["request"]["location_attributes"][:longitude] = lng
    @lat = lat
@lng = lng

    @pakket_hub_request = Request.new(params[:request])
    # @results = PakketHub::TravelPlanSearcher.search(@pakket_hub_request)
    @results = PakketHub::TravelPlan.all.to_a
    @pakket_hub_request.beneficiary_id = current_user.try(:id)
    @pakket_hub_request.requestor_id = current_user.try(:id)

	puts params.to_s
    render :index
  end

  def new
    @travel_plan = TravelPlan.new
  end

  def create
    TravelPlan.create! params[:travel_plan]
    redirect_to root_path

  end

  def show
    redirect_to root
  end

end
