class League < ActiveRecord::Base
  has_many :games

  validates :name, :presence => true
  validates_uniqueness_of :name

end
