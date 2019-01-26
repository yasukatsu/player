class ApplicationController < ActionController::Base

  include ApplicationHelper

  protect_from_forgery with: :exception
  add_flash_types :success, :info, :warning, :danger

  def current_team
    # @current_team ||= Team.find_by(id: session[:team_id])
    Team.find(session[:team_id])
  end

  def logged_in?
    !current_team.nil?
  end

  def current_player?(player)
    current_player.id == player.id
  end

end
