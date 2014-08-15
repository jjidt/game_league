class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.column :name, :varchar
    end
  end
end
