class MakeRoleNameRequired < ActiveRecord::Migration[5.2]
  def change
    change_column :roles, :name, :string, null: false
  end
end
