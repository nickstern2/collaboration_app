class Like < ApplicationRecord
  belongs_to :user, dependent: :destroy

# Do I need these with my current logic set-up?
  validates :user_id, presence: true
  validates :swiped_id, presence: true
  # after_create :check_for_match

  def check_for_match
    unless Like.where(user_id: self.swiped_id, swiped_id: self.user_id, liked: true).empty?
      # Match.create(user_two_id: self.swiped_id.............. )
    end
  end

end
