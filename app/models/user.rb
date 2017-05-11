class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {maximum: 50}
  has_many :recipes, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", 
    foreign_key: "followed_id", dependent: :destroy
  has_many :following, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :likes
  has_many :bookmarks
  


  def add_bookmark?(recipe_id)
    if has_bookmark?(recipe_id)
      return false
    else
      Bookmark.create!(user_id: self.id, recipe_id: recipe_id)
    end

  end

  def delete_bookmark?(recipe_id)
    unless has_bookmark?(recipe_id)
      return false
    else
      Bookmark.where(user_id: self.id, recipe_id: recipe_id).delete_all
      return true
    end
  end

  def has_bookmark?(recipe_id)
    Bookmark.exists?(user_id: self.id, recipe_id: recipe_id)
  end

  def add_like?(recipe_id)
    if has_like?(recipe_id)
      return false
    else
      Like.create!(user_id: self.id, recipe_id: recipe_id)
    end

  end

  def delete_like?(recipe_id)
    unless has_like?(recipe_id)
      return false
    else
      Like.where(user_id: self.id, recipe_id: recipe_id).delete_all
      return true
    end
  end

  def has_like?(recipe_id)
    Like.exists?(user_id: self.id, recipe_id: recipe_id)
  end

  def follow(other_user)
    following << other_user
  end

  def unfollow(other_user)
    following.delete(other_user)
  end

  def following?(other_user)
    following.include?(other_user)
  end
end
