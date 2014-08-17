class RemoveScoreFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :score
  end
end
