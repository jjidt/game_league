class Game < ActiveRecord::Base
  has_and_belongs_to_many :players
  belongs_to :league

  before_save :set_winner

private

  def set_winner
    self.players.each do |player|
      if player.score == 21
        self.winner = player
      end
    end
  end

end
