class AddRememberToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :remember_token, :string
  end
end
