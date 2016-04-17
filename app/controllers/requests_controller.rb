class RequestsController < BaseController
  before_action :authenticate_user!, only: :create

  def search
    @travel_plan = TravelPlan.new(params[:travel_plan])
    @results = PakketHub::Request.search(@travel_plan)
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
    Request.create! params[:request]
    redirect_to root_path
  end

end
