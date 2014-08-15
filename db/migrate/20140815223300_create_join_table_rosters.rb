class CreateJoinTableRosters < ActiveRecord::Migration
  def change
    create_table :assemblies_parts, id: false do |t|
      t.belongs_to :game
      t.belongs_to :player
    end
  end
end
