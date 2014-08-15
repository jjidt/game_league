require 'spec_helper'

describe Player do
  it {should validate_presence_of :name}
  it {should validate_presence_of :score}
  it {should allow_value(21).for(:score)}
  it {should allow_value(0).for(:score)}
  it {should_not allow_value(22).for(:score)}
  it {should have_and_belong_to_many :games}
end
