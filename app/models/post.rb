class Post < ActiveRecord::Base
  belongs_to :users
  has_many :comments
  has_many :likes
end
