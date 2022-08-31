class RemoveIndexFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_index "users", column: [:username], name: "index_users_on_username"
  end
end
