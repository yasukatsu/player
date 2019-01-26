class PlayersController < ApplicationController
  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    @team = current_team
    @player.team_id = @team.id
    @player = current_player
    @player.player_id = @player.id

  	if @player.save
  		redirect_to players_path, success: '選手登録に成功しました'
  	else
  		flash.now[:danger] = "選手登録に失敗しました"
  		render :new
  	end
  end

  def index
    @players = Player.all
    @team = current_team
    @player_GK = Player.where(team_id: @team.id, position: "GK")
    @player_CP = Player.where(team_id: @team.id, position: "CP")
    # @player = current_player
    # @player.player_id = @player.id
  end

  def show
    @players = Player.all
    # @player = current_player
    # @player.player_id = @player.id
  end

  private
  def player_params
    params.require(:player).permit(
      :id,
      :team_id,
      :image,
      :name,
      :name_kana,
      :birthday,
      :height,
      :weight,
      :position,
      :dominant_arm,
      :st_position,
      :graduate
    )
  end
end
