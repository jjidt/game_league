class League < ActiveRecord::Base
  has_many :games
  has_many :players, :through => :games

  validates :name, :presence => true
  validates_uniqueness_of :name

end
