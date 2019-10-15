class ChangeColumnDefault < ActiveRecord::Migration[5.2]
  def change
    change_column :likes, :liked, :boolean, default: nil
  end
end
