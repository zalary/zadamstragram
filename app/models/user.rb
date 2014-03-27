class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :omniauthable

  has_many :relationships, foreign_key: "follower_id", dependent: :destroy
  has_many :followed_users, through: :relationships, source: :followed

  has_many :reverse_relationships, foreign_key: "followed_id", class_name: "Relationships"
  has_many :followers, through: :reverse_relationships, source: :follower

  has_many :posts
  has_many :likes

  def following?(other_user)
    relationships.find_by(followed_id: other_user.id) ? true : false
  end

  def follow!(other_user)
    relationships.create!(followed_id: other_user.id)
  end

  def unfollow!(other_user)
    relationships.find_by(followed_id: other_user.id).destroy
  end

  def followed_posts_by_date
    # followed_users
    # followed_users.includes(:posts)
    #.order(:created_at)
    followed_ids = self.relationships.where(follower_id: self.id).map(&:followed_id)

    Post.where(user_id: followed_ids).order(created_at: :desc)


  end

  def show_followed
    images = []
    followed_users.each do |f|
      p = Post.find_by(user_id: f.id)
      images << p.pic_url
    end

    comments = []
    followed_users.each do |f|
      c = Post.find_by(user_id: f.id).comment_id
      c.each do |comment|
        comments << [comment.user_id, comment.text]
      end
    end

    likes = []
    followed_users.each do |f|
      l = Post.find_by(user_id: f.id).like_id
      l.each do |like|
        likes << like.user_id
      end
    end

    return images, comments, likes
  end
end
