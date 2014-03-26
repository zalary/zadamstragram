class Post < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  has_many :comments
  has_many :likes



  def self.followed_posts_by_user(user)
    
    followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
    where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)

    #self.includes(:user_id == 2).order(:created_at)
  end

end
