class TravelPlansController < BaseController
  before_action :authenticate_user!, only: :create

  def search
    @pakket_hub_request = Request.new(params[:request])
    # @results = PakketHub::TravelPlanSearcher.search(@pakket_hub_request)
    @results = PakketHub::TravelPlan.all.to_a
    @pakket_hub_request.beneficiary_id = current_user.try(:id)
    @pakket_hub_request.requestor_id = current_user.try(:id)

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
