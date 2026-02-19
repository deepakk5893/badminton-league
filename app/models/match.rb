class Match < ApplicationRecord
  belongs_to :winner, class_name: "Player"
  belongs_to :loser, class_name: "Player"

  validates :played_at, presence: true
  validate :winner_and_loser_must_be_different

  private

  def winner_and_loser_must_be_different
    if winner_id == loser_id
      errors.add(:base, "Winner and loser must be different players")
    end
  end
end
