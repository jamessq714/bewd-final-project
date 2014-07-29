class AddGameToScore < ActiveRecord::Migration
  def change
    add_reference :scores, :game, index: true
  end
end
