require 'spec_helper'

describe Game do
  it { should have_and_belong_to_many :players }
  it { should belong_to :league }

end
