class SetBelongsTo < ActiveRecord::Migration
  def change
    change_table :games do |t|
      t.belongs_to :league
    end
  end
end
