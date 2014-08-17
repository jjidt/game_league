class Player < ActiveRecord::Base
  has_many :results
  has_many :games, :through => :results
  has_one :league, :through => :games

  validates :name, :presence => true
  validates_uniqueness_of :name

  def wins
    self.games.merge(Result.where(:winner => true))
  end

end
