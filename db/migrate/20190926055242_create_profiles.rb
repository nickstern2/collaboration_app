class CreateProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :profiles do |t|
      t.text :bio
      t.text :skills, array: true, default: []
      t.text :interests, array: true, default: []
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
