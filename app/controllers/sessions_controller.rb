class SessionsController < ApplicationController
  def new
  end

  def create

    team = Team.find_by(team_name: params[:session][:team_name])
    if team && team.authenticate(params[:session][:password])
      log_in team
      redirect_to players_path success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url, info: 'ログアウトしました'
  end

  private
  def log_in(team)
    session[:team_id] = team.id
  end

  def log_out
    session.delete(:team_id)
    @current_user = nil
  end
end
