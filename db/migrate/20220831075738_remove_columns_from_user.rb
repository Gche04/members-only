class RemoveColumnsFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :username, :string
    remove_column :users, :password, :string
  end
end
