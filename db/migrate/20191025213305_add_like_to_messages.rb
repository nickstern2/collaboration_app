class AddLikeToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :like, foreign_key: true
  end
end
