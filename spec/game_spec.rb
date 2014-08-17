require 'spec_helper'

describe Game do
  it { should have_and_belong_to_many :players }
  it { should belong_to :league }
  it 'should declare a winner if a player has 21 points' do
    player1 = Player.new(:name => 'bill', :score => 21)
    player2 = Player.new(:name => 'ted', :score => 7)
    test_game = Game.new
    test_game.players << player1
    test_game.players << player2
    expect(test_game.winner).to eq player1
  end
end
