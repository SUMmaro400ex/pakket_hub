class CourierController < ApplicationController

  def new
    @travel_plans = PakketHub::TravelPlan.new
  end
end
