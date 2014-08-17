require 'spec_helper'

describe Result do
  it { should validate_presence_of :score }
  it { should allow_value(21).for(:score) }
  it { should allow_value(0).for(:score) }
  it { should_not allow_value(22).for(:score) }
  it 'should update winner status to true if score is equal to 21' do
    player1 =Player.create(:name => 'bill')
    player2 = Player.create(:name => 'ted')
    player1_id = player1.id
    player2_id = player2.id
    test_game_id = Game.create.id
    test_result = Result.create(:players_id => player1_id, :games_id => test_game_id, :score => 21)
    test_result2 = Result.create(:players_id => player2_id, :games_id => test_game_id, :score => 7)
    binding.pry
    expect(test_result.winner).to eq true
    expect(test_result2.winner).to eq false
  end
end
