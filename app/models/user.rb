class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes

  def full_name
    self.first_name + " " + self.last_name
  end

  def like_check
    connections_array = []
    self.likes.each do |like|
      other_user = User.find(like.swiped_id)
      if self.id == like.swiped_id
        next
      end
      other_user_likes_array = other_user.likes.select { |x| x.swiped_id == self.id }
      other_user_likes_array.each do |other|
        other_id = other.user_id
      connections_array << User.find(other_id).full_name
      end
    end
    connections_array.uniq
  end

  def user_profile
    # self.id

    Profile.where(user_id: self.id)
  end

  # def user_skills
  #   self.user_profile.each do |attribute|
  #     string = attribute.skills.join(", ")
  #     return string
  #   end
  # end
end
