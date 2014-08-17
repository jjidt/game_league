class AlterResultsRelationships < ActiveRecord::Migration
  def change
    change_table :results do |t|
      t.belongs_to :players
      t.belongs_to :games
    end
  end
end
