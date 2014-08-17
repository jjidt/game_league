class AlterResultsTable < ActiveRecord::Migration
  def change
    change_table :results do |t|
      t.belongs_to :player
      t.belongs_to :game
    end
    remove_column :results, :players_id
    remove_column :results, :games_id
  end
end
