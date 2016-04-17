class WelcomeController < ApplicationController

  def index
    @resource = User.new
  end

  def about
  end

  def contact
  end

  def privacy
  end
end
