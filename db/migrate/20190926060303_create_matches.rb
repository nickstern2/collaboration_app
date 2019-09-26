class CreateMatches < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :user_one, index: true, foreign_key: { to_table: :users }
       t.references :user_two, index: true, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
