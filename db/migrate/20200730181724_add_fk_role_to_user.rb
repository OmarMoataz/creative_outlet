class AddFkRoleToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_id, :integer
    add_foreign_key :users, :roles
  end
end
