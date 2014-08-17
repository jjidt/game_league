class AlterTablePlayersGames < ActiveRecord::Migration
  def change
    drop_table :games_players
    create_table :results do |t|
      t.column :score, :integer
      t.column :winner, :boolean
    end
  end
end
