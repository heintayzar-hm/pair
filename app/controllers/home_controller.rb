class HomeController < ApplicationController
  def index
    @meetings = Meeting.where(user: current_user)
  end
end
