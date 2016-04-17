class TravelPlansController < BaseController

  def search
    pakket_hub_request = Request.new(params[:request])
    @results = PakketHub::TravelPlanSearcher.search(pakket_hub_request)

    render :index
  end

  def new
    @travel_plan = TravelPlan.new
  end

end
