class Player < ApplicationRecord
  has_many :won_matches, class_name: "Match", foreign_key: :winner_id, dependent: :destroy
  has_many :lost_matches, class_name: "Match", foreign_key: :loser_id, dependent: :destroy

  validates :name, presence: true, uniqueness: true

  scope :ranked, -> {
    left_joins(:won_matches, :lost_matches)
      .select(
        "players.*",
        "COUNT(DISTINCT matches.id) AS wins",
        "COUNT(DISTINCT lost_matches_players.id) AS losses"
      )
      .group("players.id")
      .order("wins DESC, losses ASC")
  }
end
