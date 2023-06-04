class UserSelectionsController < ApplicationController
  def experience
    # Render the experience selection view
  end

  def create_experience
    # Process and save the experience selection
    # Redirect to the programming languages selection page
    current_user.update(experience_level: params[:experience_level])
    redirect_to user_programming_languages_path

  end

  def programming_languages
    # Render the programming languages selection view
    @programming_languages = ProgrammingLanguage.all
  end

  def create_programming_languages
    # Process and save the programming languages selection
    # Redirect to the desired page (e.g., user dashboard)
    current_user.update(programming_languages: params[:programming_languages])
    redirect_to home_index_path
  end
end
