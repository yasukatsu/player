class GamesController < ApplicationController

  def index
    @games = Game.all
    @team = current_team
    @player_GK = Player.where(team_id: @team.id, position: "GK")
    @player_CP = Player.where(team_id: @team.id, position: "CP")

    @game = Game.where(team_id: @team.id)
  end

   private
   def game_params
     params.require(:game).permit(:score, :player)
   end
 end
