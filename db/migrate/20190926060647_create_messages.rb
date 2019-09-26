class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.text :sent
      t.text :received
      t.references :matches, foreign_key: true

      t.timestamps
    end
  end
end
