class Result < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  validates :score, :presence => true
  validates_inclusion_of :score, :in => 0..21

  before_save :assign_win

  scope :win, lambda { where(winner: true) }

private

  def assign_win
    if self.score == 21
      self.winner = true
    else
      self.winner = nil
    end
  end
end
