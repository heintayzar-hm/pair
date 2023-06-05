# frozen_string_literal: true

class HomeController < ApplicationController
  def index
    @meetings = Meeting.where(user: current_user)
  end
end
