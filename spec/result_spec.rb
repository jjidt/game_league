require 'spec_helper'

describe Result do
  it { should validate_presence_of :score }
  it { should allow_value(21).for(:score) }
  it { should allow_value(0).for(:score) }
  it { should_not allow_value(22).for(:score) }
end
