class Result < ActiveRecord::Base
  belongs_to :player
  belongs_to :game

  validates :score, :presence => true
  validates_inclusion_of :score, :in => 0..21
end
