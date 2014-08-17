require 'spec_helper'

describe Player do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :games }
  it { should have_many :results }
end
