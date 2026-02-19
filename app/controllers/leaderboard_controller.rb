class LeaderboardController < ApplicationController
  def index
    @players = Player.ranked
  end
end
