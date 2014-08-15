class AddScoreColumnToPlayers < ActiveRecord::Migration
  def change
    change_table :players do |t|
      t.column :score, :integer
    end
  end
end
