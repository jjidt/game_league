class Player < ActiveRecord::Base
  validates :name, :presence => true
  validates :score, :presence => true
  validates_inclusion_of :score, in: 0..21
end
