class MatchesController < ApplicationController
  def index
    @matches = Match.includes(:winner, :loser).order(played_at: :desc)
  end

  def new
    @match = Match.new(played_at: Time.current)
    @players = Player.order(:name)
  end

  def create
    @match = Match.new(match_params)

    if @match.save
      redirect_to matches_path, notice: "Match recorded successfully."
    else
      @players = Player.order(:name)
      render :new, status: :unprocessable_entity
    end
  end

  private

  def match_params
    params.require(:match).permit(:winner_id, :loser_id, :played_at)
  end
end
