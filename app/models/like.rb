class Like < ApplicationRecord
  belongs_to :user, dependent: :destroy
  validates :swiped_id, :uniqueness => { :scope => :user_id}

  validates :user_id, presence: true
  validates :swiped_id, presence: true


  # after_create :check_for_match

  # def check_for_match
  #   unless Like.where(user_id: self.swiped_id, swiped_id: self.user_id, liked: true).empty?
  #     Match.create(user_two_id: self.swiped_id )
  #   end
  # end

  def delete_duplicate_likes
    user_likes = Like.where(user_id: self.id, )
  end
end
