class CreatePortfolios < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolios do |t|
      t.text :description
      t.references :profile, foreign_key: true

      t.timestamps
    end
  end
end
