require 'spec_helper'

describe Player do
  it { should validate_presence_of :name }
  it { should validate_uniqueness_of :name }
  it { should have_many :games }
  it { should have_many :results }
  it { should have_one :league }

  describe "wins" do
    it 'should list all wins for a given player' do
      player1 =Player.create(:name => 'bill')
      player2 = Player.create(:name => 'ted')
      player1_id = player1.id
      player2_id = player2.id
      test_game = Game.create
      test_game2 = Game.create
      test_game_id = test_game.id
      test_game2_id = test_game2.id
      test_game3 = Game.create
      test_game3_id = test_game3.id
      test_result = Result.create(:player_id => player1_id, :game_id => test_game_id, :score => 21)
      test_result2 = Result.create(:player_id => player2_id, :game_id => test_game_id, :score => 7)
      test_result3 = Result.create(:player_id => player1_id, :game_id => test_game2_id, :score => 21)
      test_result4 = Result.create(:player_id => player1_id, :game_id => test_game3_id, :score => 5)
      expect(player1.wins).to eq [test_game, test_game2]
    end
  end
end
