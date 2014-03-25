class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
        :confirmable, :omniauthable
  has_many :relationships, foreign_key: "follower_id"
  has_many :followed_users, through: :relationships, source: :followed







  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationships"
  has_many :followers, through: :reverse_relationships, source: :follower

end
