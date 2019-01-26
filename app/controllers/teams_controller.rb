class TeamsController < ApplicationController
  def new
    @team = Team.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save
      redirect_to root_path, success: '登録が完了しました。ログイン画面へお進みください。'
    else
      flash.now[:danger] = "登録に失敗しました。"
      render :new
   end
  end

   private
   def team_params
     params.require(:team).permit(:team_name, :email, :password, :password_confirmation)
   end
end
