class AddLeaguesNameColumn < ActiveRecord::Migration
  def change
    change_table :leagues do |t|
      t.column :name, :varchar
    end
  end
end
