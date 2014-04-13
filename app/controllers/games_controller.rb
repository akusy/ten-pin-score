class GamesController < ApplicationController
  respond_to :html, :json

  def create
    @game = Game.create
    GameService.new(@game).start
    respond_with @game
  end

  def index
  end

  def show
    @game = Game.find params[:id]
    @frames = @game.frames.includes(:balls).order("id asc")
  end
end
