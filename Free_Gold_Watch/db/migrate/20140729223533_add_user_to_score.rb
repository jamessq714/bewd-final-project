class AddUserToScore < ActiveRecord::Migration
  def change
    add_reference :scores, :user, index: true
  end
end
