class CreateScores < ActiveRecord::Migration
  def change
    create_table :scores do |t|
      t.float :value

      t.timestamps
    end
  end
end
