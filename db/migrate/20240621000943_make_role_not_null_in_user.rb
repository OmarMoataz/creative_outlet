class MakeRoleNotNullInUser < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :role_id, :integer, null: false
  end
end
