class RequestsController < BaseController


  def search
    travel_plan = TravelPlan.new(params[:travel_plan])
    @results = PakketHub::RequestSearcher.search(travel_plan)

    render :index
  end

  def new
    @request = Request.new
  end

end
