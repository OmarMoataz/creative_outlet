class AddIsPinnedColumnToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :is_pinned, :boolean, default: false
  end
end
