class AddAcceptedToFriendship < ActiveRecord::Migration
  def change
    add_column :friendships, :accepted, :boolean
  end
end