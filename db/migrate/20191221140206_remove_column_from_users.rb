class RemoveColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :remember_token, :string
  end
end
