class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  validates :email, presence: true, uniqueness: true
  # after_create :profile_create

  has_many :likes, dependent: :delete_all
  # belongs_to :like, as: :swiped_id
  has_one :profile, dependent: :destroy

  def full_name
    if !(self.first_name.nil? || self.last_name.nil?)
    self.first_name + " " + self.last_name
    end
  end

  def like_check
    connections_array = []
    # Iterate through all my likes
    self.likes.each do |like|
      # find the id of the person I liked
      other_user = User.find(like.swiped_id)
      # SKIP if that other person is myself or if the like instance is not true
      next if self.id == like.swiped_id || like.liked != true
      # Select all the other person's likes where they liked me (should be just one?*if any*)
      other_user_likes_array = other_user.likes.select { |x| x.swiped_id == self.id && x.liked == true}
      # Iterate through this new array (again, should be a single instance??)
      other_user_likes_array.each do |other|
        other_id = other.user_id
        connections_array << User.find(other_id)
      # raise
      end
    end
    connections_array.uniq
  end

  def delete_duplicate_profile
    user_profile = Profile.where(user_id: self.id)
      if user_profile.count > 1
        i = 1

        while i < user_profile.length
          user_profile[i].delete
          i += 1
        end
      end
  end
end
