class CreateWinnerColumnForGames < ActiveRecord::Migration
  def change
    add_column :players, :winner, :boolean
  end
end
