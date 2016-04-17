class ExchangesController < BaseController

  def create
    PakketHub::Exchange.create_and_pull_funds(params[:request_id], params[:travel_plan_id])
  end

end