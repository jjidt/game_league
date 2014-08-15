class Player < ActiveRecord::Base
  has_and_belongs_to_many :games

  validates :name, :presence => true
  validates :score, :presence => true
  validates_inclusion_of :score, :in => 0..21
end
