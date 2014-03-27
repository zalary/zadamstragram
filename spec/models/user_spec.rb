require 'spec_helper'

describe User do

  before do
    @zal =  User.new({:name => "Zalary", :email => "zalary@gmail.com", :password => "123456zal", :password_confirmation => "123456zal"})

    @zal.skip_confirmation!
    @zal.save!

    @adam =  User.new({:name => "Adam", :email => "adamshukur@gmail.com", :password => "123456adam", :password_confirmation => "123456adam"})

    @adam.skip_confirmation!
    @adam.save!

    Post.create(pic_url: "http://i.imgur.com/ExktfIb.jpg", user_id: @zal.id)
    Post.create(pic_url: "http://i.imgur.com/nRqnkp5.jpg", user_id: @adam.id)

    @zal.follow!(@adam)
  end

  context "follows other users" do
    it "has a url for their pics" do
    expect(@zal.followed_posts_by_date.first.pic_url).to include("http://i.imgur.com/nRqnkp5.jpg")
  end
    it "does not have a url for a user's own pics" do
    expect(@zal.followed_posts_by_date.last.pic_url).to_not include("http://i.imgur.com/ExktfIb.jpg")
  end

  end

end
