class Game < ActiveRecord::Base
  has_many :results
  has_many :players, :through => :results
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
