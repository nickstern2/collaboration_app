class AddDefaultValueToLiked < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :liked, :boolean, default: false
  end
end
