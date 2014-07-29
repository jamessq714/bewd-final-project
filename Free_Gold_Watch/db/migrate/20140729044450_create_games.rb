class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string  :name
      t.boolean :active
      t.string  :year_released
      t.boolean :pintype

      t.timestamps
    end
  end
end
