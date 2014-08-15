class RenameJoinTable < ActiveRecord::Migration
  def change
    drop_table :assemblies_parts

    create_table :games_players, id: false do |t|
      t.belongs_to :game
      t.belongs_to :player
    end
  end
end
