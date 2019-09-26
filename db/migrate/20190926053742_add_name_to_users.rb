class AddNameToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :password, :string
    add_reference :users, :location, foreign_key: true
  end
end
