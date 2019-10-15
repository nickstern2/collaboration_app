class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :photo, PhotoUploader

  # validates :first_name, presence: true
  # validates :last_name, presence: true
  validates :email, presence: true
  after_create :profile_create

  has_many :likes, dependent: :destroy
  has_one :profile, dependent: :destroy

  # ***Associations to add***

  # has_one :portfolio, through: :profile
  # has_many :messages, through: :matches

  def profile_create
    Profile.create(user_id: self.id)
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def like_check
    # checks for al?                bhxl the people you liked??
    connections_array = []
    self.likes.each do |like|
      other_user = User.find(like.swiped_id)
      next if self.id == like.swiped_id

      other_user_likes_array = other_user.likes.select { |x| x.swiped_id == self.id }
      other_user_likes_array.each do |other|
        other_id = other.user_id
        connections_array << User.find(other_id)
      end
    end
    connections_array.uniq
  end

  def user_profile
    Profile.where(user_id: self.id)
  end

  def dislike_user
    @users = User.all
    @discover_users = @users
    @discover_users = @discover_users.to_a

    deleted_user = User.find(params[:id])
    ele = @discover_users.find_index(deleted_user)

    return @discover_users.delete_at(ele)
  end
end
