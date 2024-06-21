class AddRoleIdToRoles < ActiveRecord::Migration[5.2]
  def change
   add_column :roles, :external_role_id, :integer
  end
end
