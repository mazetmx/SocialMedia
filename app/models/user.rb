class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  has_many :following_users, foreign_key: :followee_id, class_name: "Following"
  has_many :followers, through: :following_users

  has_many :followed_users, foreign_key: :follower_id, class_name: "Following"
  has_many :followees, through: :followed_users

  has_many :likes
  has_many :liked_posts, through: :likes, source: :post
end
