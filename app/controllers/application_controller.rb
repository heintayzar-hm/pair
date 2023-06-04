class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    if resource.experience_level.nil?
      user_experience_path
    else
      home_index_path
    end
  end
end
