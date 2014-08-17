class RemoveWinnerColumnFromPlayers < ActiveRecord::Migration
  def change
    remove_column :players, :winner
  end
end
