class RemoveColumnFromUser < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :role_id
    add_column :users, :role, :integer
  end
end
